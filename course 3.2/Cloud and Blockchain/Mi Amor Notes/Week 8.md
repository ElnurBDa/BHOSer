
# Cloud security architecture


- physical infrastructure
	- surveillance, environmental controls, and the physical security of the hardware
- network security
	- encrypting data in transit, ensuring secure communication
	- use of firewalls, intrusion detection/prevention systems (IDS/IPS), secure VPNs, and encryption protocols like TLS/SSL
- data Storage Protections
	- encrypting data at rest
	- securely managing encryption keys
	- Backup and redundancy strategies
- software systems management
	- tools and services used to manage and secure cloud resources, such as IAM systems, SIEM tools, and anti-malware solutions




main principles in cloud security
1. layered security approach
	1. known as defense in depth, involves implementing multiple layers of security measures
	2. even if one layer is breached, there are additional layers to prevent further
	3. reduces the risk of a single point of failure
2. segmentation
	1. dividing your cloud environment into smaller, isolated segments or zones to control and restrict the flow of traffic between them
	2. you can enforce stricter access controls
	3. even if one segment is compromised, the attacker's ability to move laterally within your environment is restricted
3. least privilege 
	1. users, processes, and systems should only have access to the resources and permissions necessary




### IAM

- Identity and Access Management
- it provides **Centralized Management**, **Efficiency and Scalability**, **Security and compliance**
- Cloud IAM solutions provide tools for creating, managing, and deleting user identities, as well as defining their attributes and permissions within the cloud environment
- IAM allows administrators to define granular access policies based on roles, groups, or individual users
- Cloud IAM platforms support multiple authentication methods and provide mechanisms for enforcing strong authentication requirements
- IAM policies are enforced by the cloud provider's infrastructure, ensuring that users can only perform actions that align with their assigned roles and permissions.
- include features for monitoring and auditing user activities within the cloud environment. This includes tracking logins, resource access, and changes to permissions or configurations.


### Encrypting data at rest

- Advanced Encryption Standard (AES) is widely used for encrypting data at rest
- it is a symmetric encryption algorithm that provides high security and performance, even with large volumes of data.
- storing encryption keys separately from the encrypted data, using hardware security modules (HSMs) for high-value keys, and regularly rotating keys to reduce the risk of compromise


### Encrypting data at rest

- ensuring data in transmit cannot be intercepted and read
- •Transport Layer Security (TLS), is a cryptographic protocol designed to provide secure communication over a network. It encrypts data before it is sent and decrypts it upon arrival, using a combination of symmetric and asymmetric encryption.
- SSL/TLS certificates, issued by trusted Certificate Authorities (CAs), are installed on servers to enable secure connections.


### End-to-end encryption

- prevents third parties from accessing data while it's transferred from one end system or device to another.
- cloud service provider does not have the keys to decrypt the data, ensuring that only the communicating users can access and read their data.




## Cloud Security Regulations and Standards 


#### GDPR

- General Data Protection Regulation is a regulation in EU law on data protection and privacy in the European Union and the European Economic Area.
- require businesses to handle personal data very carefully
- it covers:
	- getting permission to use someone's data
	- giving people control over their data
	- telling authorities about data breaches
	- being careful when sending data outside the European Union (EU)
- Businesses using cloud services need to make sure they follow GDPR rules when handling data.
- To comply with GDPR businesses should:
	- Use strong encryption to protect data from being seen by unauthorized people.
	- Have clear and easy ways for people to give their permission for using their data.
	- Provide tools for people to access and delete their data if they want to.


#### HIPAA

- The Health Insurance Portability and Accountability Act (HIPAA) is a law in the United States that's all about keeping your medical information private and secure
- If healthcare organizations use cloud services, they need to make sure they're following HIPAA rules.
- they have to keep your Protected Health Information (PHI) safe while it's stored, processed, and sent through the cloud
- they need to
	- Encrypt your PHI
	- Control who can access it
	- Regularly check the security


#### PCI DSS

- The Payment Card Industry Data Security Standard is for keeping credit card information safe.
- makes sure that any company dealing with credit card information keeps it safe and secure. This applies to businesses that accept, process, store, or send credit card data.
- if business uses cloud services to handle credit card info, cloud infrastructure should meet all the security standards outlined in PCI DSS
- To be compliant with PCI DSS
	- encrypt card data
	- control access
	- keep systems secure








