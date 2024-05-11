
# Basic things about asyncio
---
program is asynchrony and not waiting `func` to complete. `func` is run when all other tasks are complete, but as `main` is ending `func` cannot be run "fully".
```python
import asyncio

async def main():
	task = asyncio.create_task(func())
	print('A')
	print('B')

async def func():
	print(1)
	await asyncio.sleep(2)
	print(2)

asyncio.run(main())

# Out:
# A
# B
# 1
```
---
program is asynchrony and waiting `func` to complete.
```python
import asyncio

async def main():
	task = asyncio.create_task(func())
	print('A')
	print('B')
	await task
	

async def func():
	print(1)
	await asyncio.sleep(2)
	print(2)

asyncio.run(main())

# Out:
# A
# B
# 1
# 2
```
---
program is asynchrony and not waiting `func` to complete. `func` finds time to run while `main` is sleeping a second, but cannot complete because it ends fast
```python
import asyncio

async def main():
	task = asyncio.create_task(func())
	print('A')
	await asyncio.sleep(1)
	print('B')

async def func():
	print(1)
	await asyncio.sleep(2)
	print(2)

asyncio.run(main())

# Out:
# A
# 1
# B
```
---
program is asynchrony and not waiting `func` to complete, however `func` completes. `func` finds time to run while `main` is sleeping a second, and then a second again
```python
import asyncio

async def main():
	task = asyncio.create_task(func())
	print('A')
	await asyncio.sleep(1)
	print('B')
	await asyncio.sleep(1) # or await task

async def func():
	print(1)
	await asyncio.sleep(2)
	print(2)

asyncio.run(main())

# Out:
# A
# 1
# B
# 2
```
---
program is asynchrony and waiting `func` to complete.
```python
import asyncio

async def main():
	task = asyncio.create_task(func())
	print('A')
	print('B')
	result = await task
	print(result)

async def func():
	print(1)
	await asyncio.sleep(2)
	print(2)
	return "value"

asyncio.run(main())

# Out:
# A
# B
# 1
# 2
# value
```
---
# playing with network programming, basics
---
some basic code snippet that does not actually works, but contains smth useful
```python
import asyncio

async def handler(reader, writer):
    writer.write("smth".encode()) # to send message, I guess it writes it to buffer before sending
    # writer.writelines("smth".encode())
    await writer.drain() # actually sends it

    byte_data = await reader.read() # to receive message
    # byte_line = await reader.readline()

    # writer.close() # server closes
    await writer.wait_closed() # waiting client to close
    # if writer.is_closing(): # checking whether connection is closed or not

async def main():
    server = await asyncio.start_server(handler, '127.0.0.1', 1234) # to start server on given port and ip

asyncio.run(main())

```
---
