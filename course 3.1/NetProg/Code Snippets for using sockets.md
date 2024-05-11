# Some lines of code
---
To specify that use IPv4 and TCP correspondingly 
```python
server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
```
---
To enable the reuse of its address if it's available. This can be beneficial for server applications that need to restart or bind to the same address multiple times.
```python
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
```
---
To bind port and ip, and listen from there.
```python
server.bind((IP_address, Port))
server.listen(100) # 100 means 100 clients, no more
```
---
To send something to client. You need to encode it because it expects byte like input.
```python
some_message = "Welcome to this chatroom!"
conn.send(some_message.encode('utf-8'))
```
---
To get some message from some socket
```python
message = conn.recv(2048) # conn receives maximum of 2048 bytes
```
---
to accept an incoming client connection on a server socket
```python
conn, addr = server.accept()
```
---
to create individual thread for every user that connects. to handle multiple clients concurrently because each client connection is managed in its own thread. `start_new_thread`: This is a function from the `thread` module in Python. It is used to start a new thread that will execute a specified function with the given arguments.
```python
start_new_thread(clientthread,(conn,addr))	
```
---
To close connections
```python
conn.close()
server.close()
```
---
# Some snippets
---
to broadcast a message to multiple clients
```python
list_of_clients = []

def broadcast(message, connection):
	for clients in list_of_clients:
		if clients!=connection:
			try:
				clients.send(message)
			except:
				clients.close()
				remove(clients)
```
---
to remove client from list of connections
```python
def remove(connection):
	if connection in list_of_clients:
		list_of_clients.remove(connection)
```
---
to handle communication with a client in a multi-client chatroom server
```python
def clientthread(conn, addr):
	conn.send("Welcome to this chatroom!")
	while True:
		try:
			message = conn.recv(2048)
			if message:
				print ("<" + addr[0] + "> " + message)
				message_to_send = "<" + addr[0] + "> " + message
				broadcast(message_to_send, conn)
			else:
				remove(conn)
		except:
			continue
```
---
to listen for incoming client connections and handle them using threads
```python
while True:
	conn, addr = server.accept()
	list_of_clients.append(conn)
	print (addr[0] + " connected")
	start_new_thread(clientthread,(conn,addr))	
```
---
# Full code for server side that this code snippets was taken from
---
```python
import socket
import select
import sys
from _thread import *

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
server.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)

if len(sys.argv) != 3:
	print ("Correct usage: script, IP address, port number")
	exit()

IP_address = str(sys.argv[1])
Port = int(sys.argv[2])

server.bind((IP_address, Port))
server.listen(100)

list_of_clients = []

def clientthread(conn, addr):
	conn.send("Welcome to this chatroom!".encode('utf-8'))
	while True:
		try:
			message = conn.recv(2048)
			if message:
				print ("<" + addr[0] + "> " + message)
				message_to_send = "<" + addr[0] + "> " + message
				broadcast(message_to_send, conn)
			else:
				remove(conn)
		except:
			continue

def broadcast(message, connection):
	for clients in list_of_clients:
		if clients!=connection:
			try:
				clients.send(message.encode('utf-8'))
			except:
				clients.close()
				remove(clients)

def remove(connection):
	if connection in list_of_clients:
		list_of_clients.remove(connection)

while True:
	conn, addr = server.accept()
	list_of_clients.append(conn)
	print (addr[0] + " connected")
	start_new_thread(clientthread,(conn,addr))	

conn.close()
server.close()

```
---
# Some lines of code
---
`stdin` is a reference to the standard input stream. Another is server. And it is to handle both console input and network communication simultaneously. So you can both input something to console and see what others print.
```python
sockets_list = [sys.stdin, server]
```
---
This is the list of sockets you want to monitor for events. 
- `read_sockets`: This variable will receive a list of sockets that are ready to be read from.
- write_socket: This variable will receive a list of sockets that are ready to be written to. 
- error_socket: This variable will receive a list of sockets that have encountered an error.
```python
read_sockets,write_socket, error_socket = select.select(sockets_list,[],[])
```
---
# Some snippets 
---
To handle inputs and outputs by client
```python
for socks in read_sockets:
	if socks == server: # this part receives some message from server and outputs
		message = socks.recv(2048)
		print (message)
	else: # this part receives input from console by a user (by you)
		message = sys.stdin.readline() # inputs
		server.send(message.encode('utf-8')) # sends message to server
		sys.stdout.write("<You>")
		sys.stdout.write(message) # writes to console
		sys.stdout.flush() # ensures that the message is immediately displayed on the console
```
---
# Full code for client side that this code snippets was taken from
---
```python
import socket
import select
import sys

server = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
if len(sys.argv) != 3:
	print ("Correct usage: script, IP address, port number")
	exit()
IP_address = str(sys.argv[1])
Port = int(sys.argv[2])
server.connect((IP_address, Port))

while True:

	sockets_list = [sys.stdin, server]

	read_sockets,write_socket, error_socket = select.select(sockets_list,[],[])

	for socks in read_sockets:
		if socks == server:
			message = socks.recv(2048)
			print (message)
		else:
			message = sys.stdin.readline()
			server.send(message.encode('utf-8'))
			sys.stdout.write("<You>")
			sys.stdout.write(message) 
			sys.stdout.flush()
server.close()
```
---
problem part! needs to be async without these two lines:
```python
sockets_list = [sys.stdin, server]
read_sockets,write_socket, error_socket = select.select(sockets_list,[],[])
```
---
# Some Sources
[Simple Chat Room using Python - GeeksforGeeks](https://www.geeksforgeeks.org/simple-chat-room-using-python/?ref=ml_lbp)
https://github.com/dvatsav/Chat-Room-server.git
