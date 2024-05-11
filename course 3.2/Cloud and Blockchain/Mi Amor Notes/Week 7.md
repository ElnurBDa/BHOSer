
# Data security with blockchain

2 main features of blockchain:
1. decentralization
	1. elimination of single points of failure
	2. cascade data theft prevention
2. tamper-resistance
	1. immutability
	2. auditability


Blockchain can securely store:
- records of data
- transactions
	- payments are secure and irreversible (reducing fraud risk)
	- mainly used for 
		- cross-border payments and settlements
		- smart contracts
		- loans and financing
- transfer of assets
- access logs


blockchain is transparent and immutable, so it prevents data tampering in
- supply chain managements
- voting systems
- digital identities




## Blockchain attacks

- 51% attack
- sybil attack
- eclipse attack
- routing attack
- phishing
- replay attack
- race attack
- finney attack

#### 51% attack

One entity or person gains control over half of the computing power (hash rate) in a blockchain network. With the help of that, they can:
- prevent new transactions being confirmed
- stop payments
- reverse transaction, it can help using same coins multiple times for purchase (double-spending)

To mitigate this, increase the participation and diversification among miners, encourage more people in validating and adding transaction to blockchain.


#### Sybil attack

Attacker floods system with a lot of fake identities to gain unfair advantage. By controlling them, they can manipulate the network's operation, especially peer-to-peer communication. 

To prevent it, implement robust identity verification mechanism and trust systems.


#### Eclipse attack

It targets a specific user. Attacker isolates them from the blockchain, filters its incoming and outgoing traffic, and provides them with false information and view of blockchain

Random selection of peers and constantly changing peer connections can prevent it.


#### Routing attack

It exploits the internet routing infrastructure of a blockchain network to intercept and alter the communication.
It can be performed without breaking the cryptographic security, allowing the attacker to delay or block the propagation of blocks and transactions.

Implementing secure and encrypted communication channels, such as VPN.

**Some routing attacks**
1. BGP Hijacking
	1. Border gateway protocol is for routing internet traffic between networks
	2. Attacker can announce false BGP route information
	3. They can redirect traffic through their own network, intercept, modify data
2. Route leaks
	1. It happens when network maliciously sends routing information to another network
	2. It can cause traffic to follow unintended path
3. DDoS attack
	1. Flooding network with overwhelming amount of data
	2. Causing disruption to normal routing
4. Traffic interception
	1. Attackers can intercept and inspect traffic and data being transmitted over network
	2. it causes loss of privacy



#### Phishing attack

Tricking people to send their private keys and cryptocurrency to attacker through email, malicious websites etc.

To prevent this, educate users


#### Replay attack

A replay attack on a blockchain is like a copy-and-paste trick. Here's how it works:

1. **Copying Transactions**: The attacker grabs a valid transaction from the blockchain. It's like copying a piece of text.    
2. **Pasting the Transaction**: Then, the attacker pastes that same transaction onto the network again. It's like pasting that copied text into a document twice.
3. **Potential Problem**: If the blockchain doesn't have protections against replay attacks, it might accept the duplicated transaction as if it were new. This can lead to problems like spending the same cryptocurrency twice or messing up the network's records.


#### Race attacks

1. A person sends a transaction to recipient
2. Attacker simultaneously sends the same coins while the first one is on unconfirmed state, with higher fee, so miners will prioritize the second while confirming transaction
3. The first one will be invalid

To mitigate this, wait for confirmations, monitor mempools, use payment processors



#### Finney attack

- It is sophisticated form of double-spending attack targeting cryptocurrencies
- Requires attacker to have some mining capabilities
- 
1. **Preparation**: The attacker plans two transactions. One is a legitimate payment to a merchant, the other is a duplicate transaction back to the attacker's own wallet.
2. **Mining**: The attacker secretly starts working on adding a block to the blockchain containing the duplicate transaction.
3. **Payment to Merchant**: At the same time, the attacker makes a real payment to a merchant for goods or services.
4. **Timing is Key**: The goal is to get the real payment confirmed first by the network before the duplicate transaction.
5. **Confirmation**: Once the merchant confirms the real payment and provides the goods or services, the attacker quickly releases the block with the duplicate transaction.
6. **Double-Spending**: This results in the duplicate transaction being confirmed, effectively giving the attacker the cryptocurrency back, but they've already received the goods or services from the merchant.

Wait for more confirmation, use advanced monitoring to prevent finney attack



