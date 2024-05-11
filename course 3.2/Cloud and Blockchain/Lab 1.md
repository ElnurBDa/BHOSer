# Topic
Blockchain Scalability

# Bitcoin
- an ideal blockchain should have three qualities: decentralization, scalability, and security - trilemma. 
- more and more people started using Bitcoin
	- The blockchain could not process growing number of users
	- it led to slowing down of transactions
- one of solutions for it was starting new copies of Bitcoin such as LiteCoin. 
	- But they are problem cause they do not have interopability. 
- Smart contract network scaling - Ethereum
	- Ethereum started using smart contracts which made it more flexible and used for complex things.
	- Smart contracts is like a program with its own program language (Solidity)
	- the halting problem can occur. It is when infinite loop is written into smart contract. 
		- It starts running forever.
		- it clogs network, and ruins it. 
	- solution for this is gas.
		- so users were rewuired to use gas for any program runned. 
		- so halting problem will not occur. As program stops when gas finishes.
- Sharding
	- Blockchain is divided into multiple mini blockchains. Which are more manageable. 
- What if Bitcoin users simultaneosly sends a lot of transactions in a time
	- transactions will be processed very slow, everyone will wait
- Another solution increasing size of blocks
	- so more information can be stored
	- but if it increases, ordinary user will not be able to use it.
	- blockhain will be very heavy
- Shorten time required to build a new block
- Those were L1 solutions.
- A layer 2 is a separate blockchain that extends Ethereum and inherits the security guarantees of Ethereum.
	- All tx that are done on L2, are also can be done on L1
- L2 solutions are following
	- Grouping transactions.
	- Instead of making transactions separately. Some similar transactions can be grouped.
	- Transcations are stacked up, and after some transcations, they are combined and completed together. 
	- It allows more transactions on one blockchain
	- rollups - transactions combined into one tracnsaction and fee is distributed across users
		- it can be optimistic, which means revertable. (Optimism)
		- Zero knowledge. (zkSync)
	- Demo:
		- L1: `-[tx]-[tx]-[tx]-[tx]-`
		- L2: `-[mini tx]-[mini tx]-[mini tx]-` that is then done on one `[tx]`
- Example of L2 solutions: 
	- Optimism
	- Polygon
	- Avalanche
	- zkSync
	- Starknet
	- Base
- We support L2 solutions
- So, when L1 is congested, user can switch onto L2
- Why there a lot of L2 chains
- How to use: demo

- trilemma
Problems solution:
- sharding 
- smart contract
- increase size of block
- L2

# Sources
- https://medium.com/unstoppabledomains/understanding-the-scalability-issue-of-blockchain-b104c9b6efc1
