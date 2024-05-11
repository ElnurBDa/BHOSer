# Chatroom
Created by 

---
# Some notations
Those are designed by the author
- for exchanging key
	- `e2ek|||client_id|||public_key`
- for sending encrypted message 
	- `e2em|||client_id|||encrypted_message`
---
# Required modules
```python
# Client side imports
import socket
import threading
import rsa
# Server side imports
import asyncio 
from utils import * # it is for id generation by me
from enum import Enum # it is not that important, but why not
```
---
# Client Side
---
## Main
it is main part where two threads start
```python
def main():
    mysocket = MySocket()
    receiver = threading.Thread(target=mysocket.receive_messages)
    mysocket.sock.send(mysocket.public_key.save_pkcs1()) # send public key 
    receiver.start()
    try:
        mysocket.send_messages()
    except KeyboardInterrupt:
        print("Connection closed by user.")
    finally:
        mysocket.sock.close()
```
---
## Receiving message
```python
def receive_messages(self):
	while True:
		data = self.sock.recv(4096)
		message = data.decode().strip()
		if "e2em|||" in message: # if message is with encrypted message
			name, client_id, encrypted_message = message.split("|||") # `e2em|||client_id|||encrypted_message`
			decrypted_message = rsa.decrypt(eval(encrypted_message), self.private_key).decode()
			print(f"<# {name[:-4]} >{decrypted_message}") 
		elif "e2ek|||" in message: # if message is with other client's public key 
			parts = message.split("e2ek|||") # ['', `e2ek|||client_id|||public_key`,`e2ek|||client_id|||public_key`, ...]
			for part in parts[1:]: # `e2ek|||client_id|||public_key`
				client_id, public_key_encoded = part.split("|||")
				self.other_clients_in_chat[client_id] = rsa.PublicKey.load_pkcs1(public_key_encoded) # adds other client's public key
		else:
			print(f"<$ {message}") # if message is with no encryption
```
---
## Sending message
```python
def send_messages(self):
	while True:
		message = input("> ")
		if message.lower() == 'exit': break
		if len(self.other_clients_in_chat) == 0: # if client has not received other client's key
			self.sock.send(message.encode())
		else: # we are in room with other clients and chatting is e2e
			for client_id, public_key in self.other_clients_in_chat.items():
				encrypted_message = rsa.encrypt(message.encode(), public_key)
				self.sock.send(f"e2em|||{client_id}|||{encrypted_message}".encode())
```
---
# Server Side
---
## Some variables
```python
class Options(Enum): # for chat room functionality
    CREATE = 1
    SELECT = 2

clients = clients_db # {'id': {'name':"bob", 'writer':<writer>, 'chatroom_id':"1", 'publicKey':""}}
chatrooms = chatrooms_db # {'chatroom_id': 'chatroom_name'}
```
---
## Initializing
```python
class Client:
    def __init__(self, writer="", reader=""):
        self.id = ""
        self.writer = writer
        self.reader = reader
        self.name = ""
        self.chatroom_id = ""
        self.publicKey = ""
        self.client_address = writer.get_extra_info('peername')
        print(f"New connection from {self.client_address}")
```
---
## Sending and Receiving
```python
async def send_message(self, message):
	self.writer.write(message.encode())
	await self.writer.drain()

async def receive_message(self):
	data = await self.reader.read(header)
	return data.decode().strip() 

async def client_req_and_res(self, message): # ask question and receive answer in one function
	await self.send_message(message)
	return await self.receive_message()
```
---
## Multicasting and Broadcasting
```python
async def broadcast_to_all(self, message):
	for user_id, values in clients.items():
		if user_id != self.id:
			await send_message(values['writer'],f"{message}")

async def multicast_to_chat(self, message):        
	for user_id, values in clients.items():
		if user_id != self.id and values['chatroom_id'] == self.chatroom_id:
			await send_message(values['writer'],f"{message}")
```
---
## Main
```python
async def main():
    print("Server is started")
    try:
        server = await asyncio.start_server(handle_client, ip, port)
        async with server:
            await server.serve_forever()
    finally:
        # handle db
        # ...
```
---
## Handle Client
```python
async def handle_client(reader, writer):
    client = Client(writer, reader)
    await client.get_publicKey()
    print(f"{client.publicKey}")
    await client.choose_name()
    await client.choose_chat()
    clients[client.id] = client.get_user_profile() # adding user into "db"
    await client.send_message(f"Starting end-to-end encryption!\n")
    await client.multicast_to_chat(f"e2ek|||{client.id}|||{client.publicKey}") # exchange keys
    await client.send_publicKeys_of_chatroom() # exchange keys
    try:
        await client.chat_with_others_in_room()
    except asyncio.CancelledError:
        pass
    except Exception as e:
        print(f"Error handling client {client.name}: {e}")
    finally:
        await client.remove_client()
        del client
```
---
## Some functions related to e2e
```python
async def chat_with_others_in_room(self):
	while True:
		message = await self.receive_message()
		if "e2em|||" in message: # `e2em|||client_id|||encrypted_message` for sending to client with specific id
			_, client_id, encrypted_message = message.split("|||")
			await send_message(clients[client_id]["writer"], f"{self.name}{message}")

async def get_publicKey(self): # the first message that will be received 
	self.publicKey = await self.receive_message()

async def send_publicKeys_of_chatroom(self): # all public keys of users are sent to client 
	for user_id, values in clients.items():
		if values['chatroom_id'] == self.chatroom_id and user_id != self.id:
			await self.send_message(f"e2ek|||{user_id}|||{values['publicKey']}")
```
---
## Some other functions
if you need
```python
async def remove_client(self):        
	del clients[self.name]
	await self.multicast_to_chat(f"{self.name} has left the chat!\n")
	self.writer.close()
	await self.writer.wait_closed()
	print(f"Connection closed for {self.client_address}")

async def choose_name(self):
	self.name = await self.client_req_and_res("Welcome to the chatroom! Please enter your name: \n")
	print(f"{self.name} has joined the server")
	for user_id, values in clients.items():
		if values['name'] == self.name:
			self.id = user_id
	if not self.id: 
		self.id = generate_secure_user_id()

async def choose_chat(self):
	option = ""
	while option not in [Options.CREATE, Options.SELECT]:
		chatroom_names = "\n".join(chatrooms.values())
		option = await self.client_req_and_res(f"\n1. Create a Chatroom\n2. Select a Chatroom:\n{chatroom_names}\n")
		try:
			option = Options(int(option))  # Convert user input to enum
		except ValueError:
			option = None
		print(f"{option} is chosen")
	while True:
		if option == Options.CREATE: 
			chatroom_name = await self.client_req_and_res("Enter name of a new chatroom: ")
			print(f"{chatroom_name} chatroom is created")
			self.chatroom_id = generate_secure_chat_id() 
			chatrooms[self.chatroom_id] = chatroom_name
			break
		elif option == Options.SELECT:
			chatroom_name = await self.client_req_and_res("Enter name of a chatroom: ")
			self.chatroom_id = find_id_by_name(chatroom_name, chatrooms)
			if not self.chatroom_id: continue
			break
	await self.multicast_to_chat(f"\n{self.name} has joined the chat!\n")
	print(f"{self.chatroom_id} chatroom is touched in the server")

def get_user_profile(self):
	return {'name': self.name, 'chatroom_id': self.chatroom_id, 'writer': self.writer, 'publicKey': self.publicKey}
```
---
# Thanks
# For
# Attention!
