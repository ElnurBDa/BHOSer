# Teacher Notes
- There will be 5 questions
- You will be expected to complete exam in 120 minutes
- Lectures 11-19 will be covered
- Only theoretical parts of the lectures have been covered
    - no coding related questions
# S11
- Physical Security
	- hardware can be stolen, but information in it is most value
	- fake phone call that can download malware onto phone
	- attacheable MicroSD on device can be easily stolen even if no access to the phone
		- so better store sensitive things locally
- Strong Authentication with Poor Keyboards
	- keyloging on old or some third party keyboard apps. in contrast in desktop experience you have no need to virtual keyboard (most times)
- Multiple-User Support with Security
	- in phones logining in as diffrent user is not restricting access to other user's information (as it is done in desktops)
- Safe Browsing Environment
	- phone's screen is small which means not all things can be displayed
	- so, user may not see entire URL (which makes phishing easier), additionally, links are often opened from phone (no desktop)
- Secure Operating Systems
	- it is hard task, as more developer secures the phone, more user experience gets weakened
- Application Isolation
	- apps should be isolated and have no or limited access to each other
	- so, some gaming app has no access to bank app
-  Information Disclosure
	- data stored on phone has more value than the phone
	- phone can have VPN access to corparate network, so it being stolen is bad
- Virus, Worms, Trojans, more
	- it is known how to defend against old malware, but it is important to keep up with currently emerging new malwares that adjust to environment
- Difficult Patching/Update Process
	- Carriers are those who build on top of Android OS, such as LG, Xiaomi, or other phone distribtors
	- when android patch is released, carriers implement them late or do not at all
		- because their apps may break after a patch
- Strict Use and Enforcement of SSL
	- some problems some problems, some do not implement and it is bad
	- SSL is new, but some use old versions
		- product managers cannot redirect users to SSL websites because they can lose users
	- Some rely on 3G comlpexity and use  clear text
- Phishing
	- users need and want to click
	- entire URL is not displayed
- Cross-Site Request Forgery (CSRF)
	- it is easier on mobile than desktop
	- users  are more careless
- Location Privacy/Security
	- apps use Location information of users for ADs
	- apps always try learn what the owner is where he is etc
	- Apps like Google Latitude, Facebook want to know where are you
- Insecure Device Drivers
	- drivers has system access to the device 
	- if drivers are insecure it can be an attack vector
- Multifactor Authentication
	- MFA can be spoofed by an attacker
- Tips for Secure Mobile Application Development
	- Leverage TLS/SSL
	- Follow Secure Programming Practices
		- developers are in rush and neglect security
		- but they can use secure frameworks
	- Validate Input
	- Leverage the Permissions Model Used by the OS
		- base device may have a good security but an external SD can have other model (FAT), which is weak
		- granting all permissions to an app is bad 
	- Use the Least Privilege Model for System Access
		- give only required permissions to the app, no more
	- Store Sensitive Information Properly
		- do not store clear text on the device, use services with encrpytion
	- Sign the Application’s Code
		- store signs app's code for ensuring some permissions
		- if no sign then app may have no appropriate permissions
	- Understand the Mobile Browser’s Security Strengths and Limitations
		- mobile browser and web browser are not the same and should be treated differently
		- mobile browser has only read-only accesss
	- Use Secure/Intuitive Mobile URLs
		- bla bla bla about hosting website on new domains like `.mobi` which secures mobile experience
		```
		Traditional URL:
		www.isecpartners.com
		
		Common mobile URLs that could be used:
		isecpartners.mobi
		isecpartners.mobilevendor.com
		mobilevendor.com/isecpartners
		Mobile-isecpartners.com
		
		Ideal solution:
		m.isecpartners.com
		
		To mitigate this risk, host the login page under the base “.com” URL and use an “m.” prefix.
		```
# S12
- GSM - Global System for Mobile Telecommunication
	- a standard to describe the protocols for second-generation digital cellular networks used by mobile devices such as mobile phones and tablets.
	- One of the key features of GSM is the Subscriber Identity Module, commonly known as a SIM card. The SIM is a detachable smart card containing a user's subscription information and phone book.
	- Wireless maybe not secure and users can transfer over it confidential information, but GSM's standards are superiour
	- in GSM
		- security is obscure, meaning that none of the security algorithms used by GSM is available to the public
		- communication between user’s mobile terminal and the base transceiver is encrypted, but some protocol messages are transmitted in clear text
		- cryptographic mechanisms are difficult to upgrade
		- mobile subscriber visibility is missing
### GSM Infrastructure and its major components
- ![[gsm.png]]
- the Mobile Station (MS):
	- Two parts: Mobile Equipment (ME) such as phone and Subscriber Identity Module (SIM)
	- SIM is in ME, it allows subscriber to get calls
	- sensitive data stored in SIM is protected by personal identity number (PIN) 
- the Subscriber Identity Module (SIM)
	- contains subscriber's information
	- The International Mobile Subscriber Identity (IMSI): This number uniquely identifies a subscriber like ID.
	- The cryptographic algorithms A3 and A8 and a secret subscriber authentication key Ku: authenticating the mobile user via his SIM card, and generating the session keys for confidentiality needs, respectively.
	- The temporary network related data
	- The Card Holder Verification Information (CHVI): The information authenticates the user to the card and provides protection against the use of stolen cards.
- the Base Station Subsystem (BSS)
	- radio related tasks
	- connectivity via the radio interface
	- It consists of the Base Transceiver Station (BTS) and the Base Station Controller (BSC). 
		- The Base Transceiver Station (BTS) is the equipment that facilitates wireless communication between a mobile device and the network infrastructure. 
		- The Base Station Controller (BSC) is the central control unit that manages and coordinates multiple BTSs within a cellular network.
- the Mobile Services Switching Center (MSC)
	- main component that controls a large number of BSCs and acts like a switching node
	- provides all the management functions for terminal mobility including registration, authentication, location, handover, and call routing. 
- The Operation and Support System (OMC)
	- It's a system used by network operators to monitor and manage the GSM network.
- the Transcoding Rate and Adaptation Unit (TRAU)
- the Home Location Register (HLR)
	- It's a database that stores information about subscribers, like their phone numbers and services.
	- the shared authentication key Ku and the IMSI is stored here
- the Visitor Location Register (VLR)
	- It's a temporary database that stores information about subscribers who are currently roaming in a different area.
- Authentication Center (AuC)
	- It's a component responsible for verifying the identity of subscribers and ensuring secure communication over the network.
	- this database include the subscriber’s IMSI, secret key K, LAI, and TMSI.
- the Equipment Identity Register (EIR)
	- It's a database that stores information about mobile devices, like their unique identifiers, to prevent the use of stolen or unauthorized devices.
- Together, all these components constitute a Public Land Mobile Network (PLMN). It's the entire GSM network covering a specific geographic area.
### GSM Security

- **mobile user’s privacy**
- **data integrity protection**

is required for following activities:
- call setup
- voice-based services protection
- privacy of location
- privacy of calling patterns
- privacy of user identity
- protection of data


in call-setup, mobile terminal sends these information to GSM network:
1. calling party number
2. calling card number
3. service type requested
These must be protected and secured against eavesdroppers. All communication must be encrypted.
Out-leaking of signals from mobile terminal to GSM network can help attackers to track users, collect information about them. It is also important to check if data integrity while transmission 

There is "replication" that can mess up these GSM systems. 
One way attackers do this is by "cloning" your phone. Cloning basically means they figure out info about your phone and make an exact copy of it. They do this by gathering info stored in your SIM card. They could use it as if they were you, use services without paying or do something bad.

In GSM systems information about your account is kept separate from your actual phone. So if phone is stolen, it can used again by other user
to prevent it, each phone must have a unique identification number that's recognized worldwide. it becomes harder for someone else to use it again because it's linked to that specific identification number.
These identification numbers are usually built into the phone in a way that makes them very difficult to tamper with.

#### Auth process
1. **Ku** is the shared secret value stored on SIM card, not accessible to user
2. In authentication, network sends a random number (RAND) and SIM card uses these 2 value for authentication algorithm, provide a value SRES, and create a session key Ks
3. The user is authenticated if the provided SRES matches the value of SRES that is computed separately by the GSM network
4. The encryption is performed using key Ks
5. It provides anonymity, user authentication, and confidentiality but not network authentication.


#### Anonymity
In GSM, when you turn on your phone, it first uses your real identity to connect to the network, but then it gets assigned a temporary identifier called TMSI for future connections within a specific area. This TMSI is always encrypted by the network for extra security.

#### Confidentiality
A8 is used to generate a session key Ks. 
Ks is utilized for voice and data encryption before transmission on the radio link
Algorithm A5 uses Ks and the current publicly known frame number to produce a key stream of 228 bits, decomposed into two halves. While the first half encrypts the downlink frame (going from the base station to the MS), the second half is used to encrypt the uplink frame (going from the MS back to the base station)

### GSM Security Flaws

1. No authentication of the network is provided to the user.  it is possible for an attacker to set up a false base station (or RBS, for rogue BS) with the same mobile network code as the subscriber’s network.
2. Common implementation of A3/A8 is flawed
3. Vulnerabilities in the subscriber identity confidentiality mechanism
	1. If the network somehow loses track of a particular TMSI, it must ask the subscriber to submit its IMSI over the radio link, using a special mechanism for identity request. Thus, the IMSI is sent in plaintext
	2. attacker can use this to map a TMSI to its IMSI
4. air cracking of Ku
	1. The attacker can imitate a valid base station
	2. the attacker gets the MS’s IMSI by sending to the MS an identity request 
	3. The attacker collects the (RAND, SRES) pairs until he gains enough information to derive the key Ku

##### Impersonation attack

1. **Impersonating the network**: This sneaky person pretends to be the network to your device. So, your device thinks it's talking to the real network, but it's actually talking to the sneaky person.
2. **Impersonating your device**: Now, this sneaky person also pretends to be your device to the network. So, the network thinks it's talking to your device, but it's actually talking to the sneaky person.
3. **Man-in-the-middle attack**: By doing both of these tricks, the sneaky person can sit in the middle of your communication. They can spy on what you're saying, change or delete your messages, or even pretend to be you to someone else.

They need a modified device (like a phone) and a modified base station (like a Wi-Fi router or cell tower) to do it


##### Attacks on the Authentication Algorithm

changing the algorithm used in SIM cards from COMP128 to a stronger one is tricky.
1. **Old SIM Cards Stick Around:** The algorithm used in SIM cards is stored inside them. So, even if a new, stronger algorithm is introduced, people with existing SIM cards can't switch to it easily. They're stuck with the old algorithm.
2. **New Subscribers Get the Better Version:** New SIM cards can have the updated, more secure version of COMP128. But this creates a problem. You end up with a mix of old and new SIM cards, which makes the authentication process less efficient.
3. **COMP128 Isn't as Secure as We'd Like:** Even though the COMP128 algorithm was supposed to be kept secret, people have figured it out. It's been reverse-engineered and analyzed. Because the GSM specification (the standard for SIM cards) is public, all you need to clone a SIM card is the secret key for COMP128 and the IMSI number stored in the card

# S13
## 3G
- a cellular communication technology aimed at enhancing mobile communication capabilities.
- International Mobile Telecommunications 2000 (IMT-2000) has a lot of technical specifications and has improvements 
	1. Offering a wide range of services to mobile subscribers regardless of their location, with improved quality of service through extensive radio coverage and higher bandwidth.
	2. Increasing the variety of services available, overcoming constraints like radio transmission and system economics.
	3. Providing high-speed data rates suitable for different usage scenarios, such as fixed environments, pedestrian, and vehicular traffic.
	4. Maintaining user mobility through mobile terminal registration and SIM card provision.
	5. Enhancing security compared to 2G networks by addressing weaknesses in technologies like GSM.
	6. Supporting international operation and roaming of mobile subscribers
- 3G networks were developed to meet the growing demands of mobile users for faster data transmission, improved services, and better security compared to older cellular networks.
- some advantages of 2G that was saved in 3G
	- (a) the SIM-based authentication;
	- (b) the confidentiality of user traffic on the air interface;
	- (c) the radio interface encryption; and
	- (d) the confidentiality of user identity on the radio interface.
- 3G Network Architecture:
	- Universal Mobile Telecommunications System (UMTS) implements 3G-mobile systems and is compatible with GSM and GPRS networks.
	- Key difference: UMTS supports higher access rates. (compared to GSM and GPRS networks.)
	- UMTS uses Wideband Code Division Multiple Access (WCDMA) for land-based communication (UTRAN).
	- Recent advancements include:
	    - Shift to all-IP network architecture for efficient data transmission.
	    - Integration of open service architecture allowing third-party access.
	- Memorize: UMTS = higher access rates, WCDMA, all-IP network, open service architecture.
	- ![[3g.png|500]]
	- UMTS network is logically divided into two parts: Core Network (CN) and Generic Radio Access Network (GRAN).
	- Core Network (CN):
	    - Reutilizes elements from GPRS and GSM networks.
	    - Consists of Circuit-Switched (CS) domain and Packet-Switched (PS) domain.
	        - CS domain: Allocates dedicated resources for user traffic, controls signal during connections, often handles voice calls.
	        - PS domain: Transports user data as autonomous packets, routed independently, overcomes limitations of 2G networks for efficient data transmission.
	- User can establish connections to/from external packet data networks and other wireless networks.
	- Memorize: UMTS architecture has Core Network (CN) and Generic Radio Access Network (GRAN), with CS and PS domains handling voice and data respectively.
- The Mobile Station (MS)
	- Similar to GSM, the Mobile Station (MS) in UMTS allows users access to network services and contains the Universal Subscriber Identity Module (USIM).
	- The MS is involved in major UMTS procedures, call setup and management, handoff procedures, and mobility management.
	- The USIM within the MS contains functions and data for user identification, authentication, service profile, and security elements for confidentiality and integrity services.
	- UMTS mobile stations can operate in three modes:
	    1. Circuit Switching Mode: MS attached only to the CS domain, operates CS services exclusively.
	    2. Packet Switching Mode: MS attached only to the PS domain, operates PS services exclusively; CS-like services can be offered over the PS domain.
	    3. PS/CS Mode: MS attached to both PS and CS domains, capable of simultaneously operating PS and CS services.
	- Memorize: MS allows access to network services, contains USIM, and operates in CS, PS, or PS/CS modes.
- USIM vs SIM
	- An application stored in a removable smart card, interoperates with mobile equipment for 3G service access.
	- Similar to a SIM card, USIM features:
	    1. Unambiguous identification of a unique mobile subscriber.
	    2. Storage of subscription-related information.
	    3. Mutual authentication with the network.
	    4. Provision of security functions.
	    5. Storage of information elements like preferred language, International Mobile Subscriber Identity (IMSI), and cipher key.
- The Access Network (UTRAN)
	- Manages radio resources and air interface in UMTS.
	- Components:
	    1. Node B: Physical unit for radio transmission/reception with mobile stations within radio cells.
	        - Tasks: Air interface transmission/reception, CDMA physical channel coding.
	    2. Radio Network Controller (RNC): Manages radio resources of Node Bs under its control.
	        - Responsibilities: Connects Node B to transport network, makes handoff decisions requiring signaling to mobile stations, controls Node B resources.
	- Memorize: UTRAN includes Node Bs for radio transmission/reception and RNCs for managing radio resources and connecting to transport network.
- The Core Network (CN)
	- Responsible for transporting user data to its destination.
	- Involves switching entities and gateways (e.g., MSC, Gateway MSC, SGSN, GGSN) to external networks (e.g., Internet).
	- Maintains user access authorizations (e.g., AuC, EIR).
	- Includes databases storing user profiles and mobility management information (e.g., HLR, VLR).
	- Memorize: CN transports user data, involves switching entities, gateways, and databases for user profiles and mobility management.
- UMTS Security Architecture
	- ![[umts.png|500]]
	- The security architecture of UMTS networks is based on security characteristics and protection mechanisms organized into five classes:
		1. Network access security (Class I):
		    - Provides secure access to 3G services.
		    - Protects against attacks on the radio link.
		2. Network domain security (Class II):
		    - Enables secure exchange of signaling messages between nodes in the operator's network.
		    - Protects against attacks on the wired network targeting UMTS.
		3. User domain security (Class III):
		    - Secures the access of mobile stations to the UMTS network and services.
		4. Application domain security (Class IV):
		    - Facilitates secure exchange of messages between applications implemented at the user domain and provider domain.
		5. Visibility and configurability of security (Class V):
		    - Provides users with information about security functions in operation.
		    - Allows users to check if the provision of a service depends on the activation of certain security features.
	- Memorize: UMTS security architecture comprises five classes focusing on network access, network domain, user domain, application domain, and visibility/configurability of security functions.
### Some Attacks and Mitigations
- Mitigating 2G Weaknesses
	1. Active attacks using a rogue BTS: 3G networks mitigate this by implementing measures to detect and prevent rogue base stations from launching attacks.
	2. Clear transmission of cipher keys and authentication data: In 3G networks, cipher keys and authentication data are encrypted, ensuring secure transmission between and within networks.
	3. Limited encryption scope: Unlike 2G networks, 3G networks extend encryption beyond the wireless link, ensuring that user and signaling data are encrypted even across microwave links.
	4. Lack of data integrity: 3G networks address this weakness by providing data integrity, which thwarts certain rogue BTS attacks and safeguards against channel hijacking.
	5. Unsecured IMEI: 3G systems enhance security by ensuring that International Mobile Equipment Identity (IMEI) is transmitted and stored securely.
	6. Inflexibility in security upgrades: 3G networks are designed with flexibility to upgrade and improve security functionality over time, ensuring continuous enhancement of security measures.
	- Memorize: 3G networks mitigate 2G weaknesses by enhancing security measures against rogue base stations, encrypting cipher keys and authentication data, extending encryption scope, providing data integrity, securing IMEI, and allowing flexibility in security upgrades.
- Denial of Service
	1. User de-registration request spoofing:
	    - Exploits the weakness of 2G networks not authenticating messages received over the radio interface.
	    - Requires a modified mobile station (MS).
	    - Intruder spoofs a deregistration request (IMSI detach) to the 2G network, causing the network to de-register the user from the visited location area and instruct the Home Location Register (HLR) to do the same.
	2. Location update request spoofing:
	    - Also requires a modified MS and exploits the same weakness as above.
	    - User spoofs a location update request in a different location area from the one in which the user is roaming.
	    - The network registers the user in the new location area, making the target user unreachable for mobile terminated services in their actual location.
	- Memorize: 3G networks prevent DoS attacks using request spoofing by ensuring integrity and non-replay of signaling requests, thereby mitigating attacks such as user de-registration and location update request spoofing.
- Identity Catching
	1. Passive identity catching:
	    - A passive attack exploiting the weakness of GSM networks sometimes requesting the user's identity in clear form.
	    - Requires a modified mobile station (MS).
	    - In 3G networks, temporary identities allocated by the serving network make passive eavesdropping inefficient. The user's permanent identity is protected, as the intruder must wait for a new registration or a database mismatch to capture the user's identity in plaintext.
	2. Active identity catching:
	    - An attack exploiting the weakness of 2G networks requesting the MS to send its permanent user identity in clear form.
	    - Requires a modified base station (BS).
	    - The intruder attracts the target user to camp on their false BS, then requests the user to send their permanent identity in cleartext.
	    - In UMTS networks, identity confidentiality mechanisms use encryption keys shared by a group of users to protect user identities, countering this attack.
	- Memorize: 3G networks counteract identity catching attacks like passive and active identity catching by using temporary identities, encryption keys, and mechanisms to protect user identities from eavesdropping and interception.
- Impersonation of the Network Attacks
	1. Impersonation by suppressing encryption between target user and intruder:
	    - Attack aims to impersonate a legitimate network by hiding encryption.
	    - 3G networks provide a mandatory cipher mode command with message authentication and replay inhibition.
	    - Mobile verifies encryption integrity to detect if it has been tampered with by an attacker.
	2. Impersonation by suppressing encryption between target user and legitimate network:
	    - Attack aims to impersonate a legitimate network by hiding encryption.
	    - 3G networks use a mobile station class-mark with message authentication and replay inhibition.
	    - Network verifies encryption integrity to detect if it has been suppressed by an attacker.
	3. Impersonation by forcing the use of a compromised cipher key:
	    - Attack exploits compromised authentication vectors intercepted between generation in the authentication center and their use.
	    - Despite 3G networks' security measures, they remain vulnerable to attacks using compromised authentication vectors.
	- Memorize: 3G networks mitigate impersonation of the network attacks by implementing measures such as mandatory cipher modes, message authentication, replay inhibition, and mobile station class-marks. However, they are still vulnerable to attacks using compromised authentication vectors.
- Eavesdropping on User Data
	1. Eavesdropping by suppressing encryption between target user and intruder:    
	    - In 3G networks, a mandatory cipher mode command with message authentication and replay inhibition allows the mobile to verify if encryption has been suppressed.
	2. Eavesdropping by suppressing encryption between target user and legitimate 2G network:
	    - Message authentication and replay inhibition of the mobile's encryption capabilities allow the 3G network to verify if encryption has been suppressed.
	3. Eavesdropping by forcing the use of a compromised cipher key:
	    - Similar to the previous attack, the architecture does not protect against the forced use of compromised authentication vectors, which have not yet been used to authenticate the USIM.
	- Memorize: Eavesdropping attacks in GSM networks involve suppressing encryption between target user and intruder or legitimate network, and forcing compromised cipher keys. In 3G networks, measures like message authentication and replay inhibition are employed to verify encryption integrity.
- Classification of Attacks on 3G Networks
	- (a) Classification by Type:
		1. Interception: Attacker intercepts information or reads signaling messages on a cable without modifying them.
		2. Fabrication/Replay: Attacker inserts false signaling messages, fake service logic, or fake subscriber data into the system.
		3. Modification of Resources: Attacker modifies signaling messages, service logic, or subscriber data in the network.
		4. Denial of Service: Attacker causes overload or disruption in network resources or applications.
		5. Interruption: Attacker causes an interruption of operation by destroying resources or deleting signaling messages or subscriber data.
	- (b) Classification by Means:
		1. Data-based attacks: Attacker targets data stored in the 3G communication system, causing damage by modifying, inserting, or dropping data.
		2. Messages-based attacks: Attacker targets signaling messages, inserting, modifying, replaying, or dropping them.
		3. Service Logic attacks: Attacker attacks service logic running in 3G network entities, causing significant damage.
	- (c) Classification by Physical Access:
		1. Physical Access attacks I: Attacker obtains access to the air interface using a physical device, impersonating parts of the network or eavesdropping.
		2. Physical Access attacks II: Attacker obtains access to cables connecting 3G network switches, disrupting normal transmission of signaling messages.
		3. Physical Access attacks III: Attacker has access to sensitive components of the 3G network, causing impairments by editing service logic or modifying subscriber data.
		4. Physical Access attacks IV: Attacker has access to links connecting the Internet to the 3G network, disrupting transmission of signaling messages.
		5. Physical Access attacks V: Attacker has access to Internet or cross-network servers providing services to mobile subscribers, editing service logic or modifying subscriber data.
# S14

| 2G  | 2.5G | 3G   | 3.5G | 4G  |
| --- | ---- | ---- | ---- | --- |
| GSM | EDGE | UMTS | HSPA | LTE |
![[the basics.png]]
- the basics
	- A device (UE) connects to a network of base stations (E-UTRAN)
	- The E-UTRAN connects to a core network (Core)
	- The Core connects to the internet (IP network).
- User equipment (UE): Cellular device containing the following
	- UICC: Known as SIM card
	- IMEI: Equipment Identifier
	- IMSI: Subscriber Identifier
- The Evolved Universal Terrestrial Radio Access Network (E-UTRAN)
	- ![[eutran.png]]
	- eNodeB: Radio component of LTE network
		-  De-modulates RF signals & transmits IP packets to core network
		- Modulates IP packets & transmits RF signals to UE
	- E-UTRAN: mesh network of eNodeBs
	- X2 Interface: connection between eNodeBs
- Evolved Packet Core (EPC)
	- Mobility Management Entity (MME)
		- Primary signaling node - does not interact with user traffic
		- Functions include managing & storing UE contexts, creating temporary IDs, sending pages, controlling authentication functions, & selecting the S-GW and P-GWs
	-  Serving Gateway (S-GW)
		- Router of information between the P-GW and the E-UTRAN
		- Carries user plane data, anchors UEs for intra-eNodeB handoffs
	- Packet Data Gateway (P-GW)
		- Allocates IP addresses and routes packets
		- Interconnects with non 3GPP networks
	- Home Subscriber Server (HSS)
		- Houses subscriber identifiers and critical security information
- LTE Network
	- ![[lte.png|500]]
- Communications Planes
	- LTE uses multiple planes of communication
	- Different logical planes are multiplexed into same RF signal
	- Routed to different end points
	- ![[planes eutran.png|500]]
- LTE Protocols
	- ![[lte protocols.png|550]]
	- TCP/IP sits on top of the cellular protocol stack:
		1. **Radio Resource Control (RRC)**:
		    - **Function**: Handles control signaling between the UE (User Equipment) and the network.
		    - **Tasks**:
		        - Transfers NAS (Non-Access Stratum) messages.
		        - Includes AS (Access Stratum) information.
		        - Manages signaling and ECM (Error Correction Mechanism).
		2. **Packet Data Convergence Protocol (PDCP)**:
		    - **Function**: Manages the transmission of IP packets over the radio interface.
		    - **Tasks**:
		        - Performs header compression to reduce overhead.
		        - Handles radio encryption to secure data transmission.
		3. **Radio Link Control (RLC)**:
		    - **Function**: Prepares packets for transfer over the air interface.
		    - **Tasks**:
		        - Readies data packets for transmission, ensuring they are properly formatted and error-checked.
		4. **Medium Access Control (MAC)**:
		    - **Function**: Controls access to the radio channel, managing multiplexing and quality of service (QoS).
		    - **Tasks**:
		        - Handles multiplexing of data from different users onto the same channel.
		        - Ensures QoS by prioritizing data based on user requirements.
- LTE Security Architecture
	- Backhaul Protection
		- Confidentiality protection of traffic running over S1 Interface (Backhaul)
		- Hardware security appliances are used to implement this standard
		- Security Gateways (SEG) 
		- IPSEC tunnel created between eNodeB and SEG
		- ![[backhaul.png|500]]
- Threats to LTE Networks
	- General Computer Security Threats
	- Renegotiation Attacks
		- Threat: Rogue base stations can force a user to downgrade to GSM or UMTS.
			- Significant weaknesses exist in GSM cryptographic algorithms.
		- Mitigation: 
			- Ensure LTE network connection. Most current mobile devices do not provide the ability to ensure a user's mobile device is connected to an LTE network. 
			- A ‘Use LTE only’ option is available to the user
			- Use a rogue base station detector
	- Device & Identity Tracking
		- Threat: The IMEI and IMSI can be intercepted and used to track a phone and/or user.
			- Rogue base stations can perform a MiM attack by forcing UEs to connect to it by transmitting at a high power level
			- The phone may transmit its IMEI or IMSI while attaching or authenticating.
		- Mitigation: 
			- UEs should use temporary identities and not transmit them in over unencrypted connections. 
			- IMSI-catcher-catcher
	- Call Interception
		- Threat: Renegotiation attacks may also allow MitM attacks to establish an unencrypted connection to a device making a phone call
		- Mitigation: The ciphering indicator feature discussed in 3GPP TS 22.101 would alert the user if calls are made over an unencrypted connection
	- Jamming UE Radio Interface
		- Threat: Jamming the LTE radio prevents the phone from successfully transmitting information.
			- Jamming decreases the signal to noise ratio by transmitting static and/or noise at high power levels across a given frequency band.
			- Research suggests that, due to the small amount of control signaling in LTE, this attack is possible.
			- Prevents emergency calls
		- Mitigation: Unclear. Further research is required and may require changes to 3GPP standards to mitigate this attack.
	- Attacks Against the Secret Key (K)
		- Threat: Attackers may be able to steal K from the carrier's HSS/AuC or obtain it from the UICC manufacturer:
			- Card manufacturers may keep a database of these keys within their internal network
		- Mitigation(s): 
			- Physical security measures from UICC manufacturer
			-  Network security measures from carrier
	- Physical Base Station Attacks
		- Threat: The radio equipment and other electronics required to operate a base station may be physically destroyed
		- Mitigation: Provide adequate physical security measures such as video surveillance, gates, and various tamper detection mechanisms
	- Availability Attacks on eNodeB & Core
		-  Threat: A large number of simultaneous requests may prevent eNodeBs and core network components (e.g., HSS) from functioning properly.
			- Simulating large numbers of fake handsets
		- Mitigation: Unclear
# S15
## S15 in full chatgpt mode for first read 
scroll down to see shortened version
- Android security
	- **Openness of Android Platform**: Android is considered "open" because its source code can be viewed and modified by developers without restrictive licenses or fees. This openness extends to allowing third-party applications to run on the platform.
	- **Configuration Options**: Android distributions can be configured to limit owner's access, such as restricting root access or changing system settings. This configuration can help users feel secure in case of device loss and reassure carriers regarding licensed content protection.
	- **Locking to Specific Networks:** Devices can be "locked" to specific networks, which supports carriers' business models by encouraging subscriptions. However, these configurations can often be bypassed by technical individuals with physical access to the device.
	- **Security Implications of Root Access:** While breaking root access on a device may seem to compromise security, it shouldn't harm the overall security model of Android. Users generally expect to have full control over their devices.
- Development on Android
	- **Application Developers**: Create software using Android SDK.
	- **System Developers**: Customize Android for devices or contribute to the platform.
	- Distribution: System developers usually work for Google or phone manufacturers. Application developers outnumber system developers and receive better support.
- Debugging on Android:
	- **Built-in Support**: Android has built-in debugging support, making it easy to debug both on a physical device and the emulator.
	- **Debugging Daemon**: Android's debugging support primarily relies on a debugging daemon (/sbin/adbd), which facilitates connection between the development machine and the device.
	- **Two Methods**: Debugging can be done for native code and code running in the Dalvik virtual machine.
	- **Functionality**: Adbd runs as the user "shell" and allows data stream forwarding services, executing commands, installing packages, and copying files to and from the device.
- Android’s Security Model:
	- **Based on Linux Kernel**: Android utilizes the security model provided by the Linux kernel but also incorporates unique abstractions specific to the Android platform.
	- **User Accounts**: Android leverages Linux user accounts to isolate applications, each application being assigned a unique user identifier (UID) upon installation, similar to Unix UIDs.
	- **Permissions**: Applications are granted permissions to perform various actions such as taking pictures, using GPS, or making phone calls. These permissions are essential for controlling access to resources and are enforced by the kernel based on the application's UID.
	- **Protection of Data**: An application's UID is crucial for protecting its data, and developers must explicitly define how data can be shared with other applications.
	- **Permission Model**: Android's permission model aims to minimize the impact of malicious software by requiring users to grant specific permissions to applications. However, it ultimately relies on users making informed choices.
	- **Extensibility**: The permission model is extensible, and developers need to consider what is reasonable for users to understand when defining new permissions. Confusing users may lead to poor choices.
	- **Necessity of Permissions**: Permissions are required for programs to perform potentially dangerous operations, such as directly dialing calls, accessing private data, or altering address books and emails.
	- **Preventing Abuse**: Permissions help minimize abuse by restricting access to sensitive operations, ensuring that only authorized applications can perform certain actions on the device.
- Android Permissions Review:
	- **Approval Required**: Apps need approval to perform certain tasks like sending SMS, using the camera, or accessing contacts.
	- **Manifest Permissions**: Permissions are declared in the `AndroidManifest.xml` file of the app.
	- **User Agreement**: Users agree to permissions upon installation (up to Android 6.0) or grant runtime permissions in newer versions.
	- **Goal Association**: Permissions should be associated with understandable goals for users. For example, `READ_CONTACTS` permission is necessary for accessing the address book.
- Manifest Permission Protection Levels
	- ![[perm prot level.png|500]]
- Android Permissions Exception:
	- **SecurityException**: Attempting to use an interface without necessary permissions may result in a SecurityException. Error messages logged indicate the required permission.
	- **Logging Errors**: If your app enforces permissions, consider logging errors upon failure to aid developers in diagnosing issues.
	- **Silent Failures**: Permission failures can sometimes occur silently without any visible indication to users. The platform does not alert users about permission checks or allow granting permissions after installation.
	- **Internationalization**: Ensure that the label and description properties of new permissions are internationalized for users of different languages. Have technical and language experts review translations for accuracy.
- Creating New Manifest Permissions:
	- **Purpose**: Applications can define their own permissions if they want other apps to programmatically access their resources or functionalities.
	- **Exporting Components**: If an app doesn't intend for other apps to call it, it should avoid exporting any Activities, BroadcastReceivers, Services, or ContentProviders.
	- **End User Control**: Defining a manifest permission allows end users to decide which programs have access to certain resources or functionalities.
	- **Example**: For instance, a shopping list app could define a permission like `com.isecpartners.ACCESS_SHOPPING_LIST` to control access to its exclusive `ShoppingList` object.
	- **Controlled Access**: With proper implementation, only apps that declare the use of this permission can access the resource, giving users the choice to consent or deny access.
- Securable (interprocess communication) IPC Mechanisms:
	- **Purpose**: Android provides secure mechanisms for communication and coordination between programs, allowing background processes, service offering, data sharing, program launching, and component reuse.
	- **Key Tools**: Android implements several key tools for secure IPC, facilitating various functionalities for applications.
	- **Intents**: Much of the IPC on Android involves the use of Intents, which are data structures containing information. These Intents have expected properties that help the system determine where to route them if the developer hasn't specified.
-   Intents in Android:
	- **Starting Activities**: Intents are used to start activities, such as browsing a web page, by coordinating with other programs. Example: Using Context's `startActivity()` method.
	- **Broadcasts**: Intents are used as broadcasts to inform interested programs of changes or events. Example: Using Context's `sendBroadcast()`, `sendStickyBroadcast()`, and `sendOrderedBroadcast()` methods.
	- **Interacting with Services**: Intents are used to start, stop, or communicate with background services. Example: Using Context's `startService()`, `stopService()`, and `bindService()` methods.
	- **Callbacks**: Intents serve as callbacks to handle events, such as returning results or errors asynchronously, using `PendingIntents` provided by clients to servers through their Binder interfaces.
- `IntentFilters` in Android: (bullshit, cannot understand in ant way)
	- **Dispatching Intents**: Intents can be dispatched by the Android Activity Manager based on how they are sent. For example, starting an activity using `Context.startActivity(Intent intent)` triggers the Activity Manager to find the matching activity by comparing the Intent against registered `IntentFilters` of all activities on the system.
	- **Intent Matching**: `IntentFilters` are used by the Activity Manager to find the best match for the Intent. However, it can be overriden.
	- **Exported Activities**: Any `exported` activity can be started with any Intent values. Activities are exported explicitly via the `android:exported="true"` attribute in the manifest file.
	- **Security Considerations**: Intent recipients (`Activities`, `Services`,` BroadcastReceivers`) need to handle potentially hostile callers. `IntentFilters` do not filter malicious Intents and are not a security boundary. They cannot be associated with permissions.
	- **Categories in Intents**: Adding a category to an Intent restricts its resolution. For instance, an `IntentFilter` with the `android.intent.category.BROWSABLE` category is safe to be called from the web browser. However, adding categories should be carefully considered to ensure compliance with any undocumented contracts associated with them.
- Broadcasts in Android:
	- **Communication Mechanism**: Broadcasts enable secure and efficient communication between applications and system components. Messages are sent as Intents, and the system handles their dispatching, including starting receivers and enforcing permissions.
	- **BroadcastReceivers**: Applications can register `BroadcastReceiver` components in their `AndroidManifest.xml` file to receive broadcasts. The Activity Manager uses the `IntentFilter` to determine which program should handle a particular broadcast.
	- **Registration of BroadcastReceivers**: `BroadcastReceivers` are registered using the `<receiver>` tag in the `AndroidManifest.xml`. By default, they are not exported, but they can be easily exported by adding an `<intent-filter>` tag or setting `android:exported="true"`.
	- **Secure Broadcast Intents**: When sending sensitive data via broadcasts, developers should ensure that only authorized recipients can receive it. This can be achieved by requiring receivers to have a specific permission, which is passed as the `receiverPermission` parameter in the Context's `broadcastIntent()` methods.
	- **Sticky Broadcasts**: Sticky broadcasts are informational and persist after being sent. They require the `BROADCAST_STICKY` privilege to send or remove them. However, they cannot require permissions, so they should not be used for exchanging sensitive information.
	- **Security Concerns**: Sticky broadcasts should be avoided for sharing sensitive information as they cannot be secured like regular broadcasts. Additionally, any application with the `BROADCAST_STICKY` privilege can remove a sticky Intent created by another application, so their persistence should be carefully considered.
- Services in Android:
	- **Background Processes**: Services are long-running background processes provided by Android for tasks like playing music or running game servers.
	- **Starting Services**: Services can be started with an Intent and communicated with over a Binder interface via Context's `bindService()` method.
	- **Similarity to Components**: Services, like `BroadcastReceivers` and `Activities`, can be started independently of their `IntentFilters` by specifying a Component (if they are exported).
	- **Securing Services**: Services can be secured by adding a permission check to their `<service>` tag in the `AndroidManifest.xml`.
	- **Calling Services**: When making sensitive calls to a Service, it's essential to validate that the Service being connected to is the correct one. This can be done by explicitly specifying the component in the Intent or verifying it against the name provided to the `ServiceConnection`'s `onServiceConnected()` implementation.
- ContentProviders in Android:
	- **Sharing Raw Data**: Android provides the `ContentProvider` mechanism for applications to share raw data, such as SQL data, images, or sounds.
	- **Implementation**: `ContentProviders` can be implemented to expose data to the system. The `<provider>` tag in the `AndroidManifest.xml` file registers a provider and defines permissions for accessing it.
	- **SQL Backend**: `ContentProviders` are designed to work with SQL backends, and one is provided by default.
	- **Permissions**: Permissions for accessing `ContentProviders` can be defined directly in the `AndroidManifest.xml` file using `android:readPermission` and `android:writePermission` attributes in the` <provider>` tag.
	- **Power and Simplicity**: `ContentProviders` are powerful but may not always be necessary. Consider simpler ways of coordinating data access where appropriate.
- Avoiding SQL Injection:
	- **Clear Delineation**: To prevent SQL injection, it's crucial to clearly separate the SQL statement from the data it includes. Misinterpreting data as part of the SQL statement can lead to serious security vulnerabilities.
	- **Parameterized Queries**: Modern platforms like Android offer parameterized queries as a solution to SQL injection. These queries explicitly distinguish between data and query logic.
	- **Android ContentProvider and Activity Methods**: Methods like `query(), update(), delete(), `and` managedQuery()` support parameterization in Android. They accept a parameter called "`String[] selectionArgs`," which substitutes values into the query string instead of directly including them.
	- **Separation of SQL Statement and Data**: By using `selectionArgs`, there is a clear separation between the content of the SQL statement in the "selection" parameter and the data being included. This ensures that even if the data contains characters meaningful in SQL, the database won't be confused, thereby preventing SQL injection attacks.
- Intent Reflection:
	- **Common Idiom**: A common practice in Android communication involves receiving callbacks via Intents. An example is the Location Manager, where the `addProximityAlert()` method takes a `PendingIntent` to specify how to notify callers.
	- **Usage in IPC**: Callbacks via Intents are frequently used in Activities, Services, `BroadcastReceivers`, or Binder interfaces during `interprocess` communication.
	- **Avoiding Unauthorized Intents**: It's crucial to prevent callers from tricking your program into sending Intents they wouldn't be allowed to. This practice, called intent reflection, is addressed by the `android.app.PendingIntent` class introduced in Android SDK 0.9.
	- **Role of PendingIntent**: `PendingIntent` class plays a key role in preventing intent reflection by providing a way to specify the sender's identity and permissions when sending Intents. This helps ensure that only authorized senders can trigger certain actions.
	- **Recommended Approach**: If your application allows its caller to be notified by receiving an Intent, consider changing it to accept a `PendingIntent` instead.
	- **PendingIntents**: `PendingIntents` are sent as the process that created them. This ensures that the server making the callback is treated as the caller, not itself, shifting the risk to the caller.
	- **Trust Shift**: With `PendingIntent`, the caller needs to trust the service with the ability to send the Intent as itself. However, this shouldn't be difficult as the caller controls the Intent's properties.
	- **setComponent() Method**: The PendingIntent documentation advises locking the PendingIntent to the specific component it was intended for using `setComponent()`. This ensures controlled dispatching of the Intent.
- Files and Preferences in Android:
	- **Unix-Style File Permissions**: Android supports Unix-style file permissions for file systems that are formatted to support them, such as the root file system. Each application has its own area on the file system, similar to having a home directory for user IDs.
	- **Accessing Application's Directory**: The Context object of an Activity or Service provides access to the application's directory using methods like `getFilesDir(), getDir(), openFileOutput(), openFileInput(), and getFileStreamPath()`. 
	- **Considerations for World-Accessible Data**: Any code that creates data accessible to the world must be carefully reviewed. Consider whether the data written to the file is sensitive and whether allowing world-writeable access could lead to antisocial behavior or blame on the application.
	- **SharedPreferences**: `SharedPreferences` is a system feature backed by a file with permissions like any other. The mode parameter for `getSharedPreferences(String name, int mode)` uses the same file modes defined by Context.
	- **Security Concerns**: It's unlikely that preferences are unimportant enough to allow other programs to change them. It's recommended to avoid using `MODE_WORLD_WRITEABLE` as it can be a potential security weakness in the application.
- Mass Storage in Android:
	- **Limited Internal Memory**: Android devices typically have limited internal memory on the internal file system. Some devices may support larger add-on file systems mounted on memory cards.
	- **VFAT Format**: Memory cards mounted on Android devices typically use the VFAT format to facilitate data transfer between cameras, computers, and Android devices. However, VFAT does not support the access controls of Linux, making data stored here unprotected and accessible by any program on the device.
	- **Security Considerations**: Users should be informed that bulk storage is shared with all programs on their device, and they should avoid storing really sensitive data there.
	- **Encryption for Confidential Data**: If confidential data needs to be stored, it can be encrypted with the key stored in the application's file area and the ciphertext stored on the shared memory card. However, if the user wants to move the data onto another system using the storage card, a mechanism to decrypt the data and communicate the key to the user may be necessary.
- Android Security Tools:
	1. **Manifest Explorer**:
	    - Purpose: Helps users find and view the `AndroidManifest.xml` policy file for Android distributions and installed applications.
	    - Importance: Crucial for analyzing system security as it defines permissions enforced by the system and applications.
	    - Functionality: Allows reviewing of `AndroidManifest.xml` file, security policies, permissions of applications and system, and IPC channels defining attack surface of applications.
	2. **Intent Sniffer**:
	    - Purpose: Monitors runtime routed broadcast Intents sent between applications on the system.
	    - Importance: Common way of communication between Android applications, hence critical for security analysis.
	    - Features: Observes mostly unprivileged broadcast Intents, option to see recent tasks' Intents, dynamically updates Actions and Categories scanned for Intents.
	3. **Intent Fuzzer**:
	    - Purpose: Testing tool that sends unexpected or incorrect input (fuzzing) to applications via Intents, aiming to find bugs and performance issues.
	    - Importance: Helps identify vulnerabilities and improve robustness of applications.
	    - Features: Can fuzz single components or all installed components, suitable for `BroadcastReceivers` but less coverage for Services. Can also start instrumentations, but `ContentProviders` cannot be fuzzed as they are not Intent-based IPC mechanisms.

| Manifest Explorer | ![[Pasted image 20240428210115.png]] |
| ----------------- | ------------------------------------ |
| Intent Sniffer    | ![[Pasted image 20240428210144.png]] |
| Intent Fuzzer     | ![[Pasted image 20240428210225.png]] |
## S15 Shortened
**Android Security Recap:**

- **Openness of Android Platform**: Android is open-source, allowing developers to modify it freely. Third-party apps can run on the platform.
- **Configuration Options**: Android can limit owner's access, enhancing security in case of device loss.
- **Locking to Specific Networks**: Devices can be locked to networks, but this can be bypassed by technical users.
- **Security Implications of Root Access**: Root access doesn't necessarily compromise Android's security model.

**Development on Android Recap:**

- **Application Developers**: Use Android SDK to create software.
- **System Developers**: Customize Android for devices or contribute to the platform.
- **Distribution**: System developers usually work for Google or phone manufacturers.

**Debugging on Android Recap:**

- **Built-in Support**: Android has built-in debugging support for both physical devices and emulators.
- **Debugging Daemon**: Adbd facilitates connection between development machine and device.
- **Two Methods**: Debugging for native code and code running in Dalvik virtual machine.

**Android’s Security Model Recap:**

- **Based on Linux Kernel**: Android uses Linux kernel's security model with added abstractions.
- **User Accounts**: Applications are isolated using Linux user accounts.
- **Permissions**: Applications are granted permissions to perform actions, enforced by the kernel.
- **Protection of Data**: Application data protection relies on UIDs.
- **Permission Model**: Aims to minimize impact of malicious software by requiring user permission.

**Android Permissions Recap:**

- **Approval Required**: Apps need approval for certain tasks.
- **Manifest Permissions**: Declared in `AndroidManifest.xml`.
- **User Agreement**: Users agree to permissions upon installation.
- **Goal Association**: Permissions should be associated with understandable goals.

**Manifest Permission Protection Levels Recap:**

- ![Pasted image 20240428192742.png](Pasted image 20240428192742.png)

**Android Permissions Exception Recap:**

- **SecurityException**: Occurs when necessary permissions are missing.
- **Logging Errors**: Consider logging errors for diagnosing issues.
- **Silent Failures**: Permission failures can occur silently.
- **Internationalization**: Ensure translations are accurate.

**Creating New Manifest Permissions Recap:**

- **Purpose**: Define permissions for other apps to access resources.
- **Exporting Components**: Avoid exporting components unnecessarily.
- **End User Control**: Allows users to control resource access.
- **Example**: Define permissions for specific resources.

**Securable IPC Mechanisms Recap:**

- **Purpose**: Facilitate communication between programs securely.
- **Key Tools**: Android implements tools for secure IPC.
- **Intents**: Mainly used for IPC on Android.

**Intents in Android Recap:**

- **Starting Activities**: Intents start activities.
- **Broadcasts**: Inform programs of changes.
- **Interacting with Services**: Start, stop, or communicate with services.
- **Callbacks**: Handle events asynchronously.

**IntentFilters in Android Recap:**

- **Dispatching Intents**: Activity Manager dispatches Intents based on how they're sent.
- **Intent Matching**: Matching Intents with registered components.
- **Exported Activities**: Activities can be exported explicitly.
- **Security Considerations**: Be cautious of potential malicious Intent callers.

**Broadcasts in Android Recap:**

- **Communication Mechanism**: Efficient communication between apps.
- **BroadcastReceivers**: Register receivers to handle broadcasts.
- **Registration**: Done using `<receiver>` tag.
- **Secure Broadcast Intents**: Ensure sensitive data is only received by authorized recipients.

**Services in Android Recap:**

- **Background Processes**: Long-running processes provided by Android.
- **Starting Services**: Initiated with Intents.
- **Securing Services**: Add permission checks in the manifest.

**ContentProviders in Android Recap:**

- **Sharing Raw Data**: Facilitate sharing of raw data.
- **Implementation**: Define permissions in manifest.
- **SQL Backend**: Designed to work with SQL backends.

**Avoiding SQL Injection Recap:**

- **Clear Delineation**: Separate SQL statements from data.
- **Parameterized Queries**: Use parameterized queries to prevent injection.
- **Android ContentProvider and Activity Methods**: Support parameterization.

**Intent Reflection Recap:**

- **Common Idiom**: Callbacks via Intents are common in Android.
- **Avoiding Unauthorized Intents**: Prevent unauthorized Intent reflections.
- **Role of PendingIntent**: Specify sender's identity and permissions.
- **Recommended Approach**: Use PendingIntent for security.

**Files and Preferences in Android Recap:**

- **Unix-Style File Permissions**: Android supports Unix-style permissions.
- **Accessing Application's Directory**: Access app's directory using Context methods.
- **SharedPreferences**: Backed by a file with permissions.
- **Security Concerns**: Avoid using world-writeable permissions.

**Mass Storage in Android Recap:**

- **Limited Internal Memory**: Devices have limited internal memory.
- **VFAT Format**: Memory cards typically use VFAT format.
- **Security Considerations**: Users should avoid storing sensitive data on shared memory.

**Android Security Tools Recap:**

- **Manifest Explorer**: View AndroidManifest.xml for security analysis.
- **Intent Sniffer**: Monitor runtime routed broadcast Intents.
- **Intent Fuzzer**: Test applications for vulnerabilities using fuzzing.
# S16
- iOS Architecture:
	1. **Hardware Management**: iOS manages the hardware device and provides necessary technologies for app development.
	2. **Default System Apps**: iOS comes with default system apps like Mail, Calendar, Calculator, Phone, and Safari, commonly used by users.
	3. **Exclusive to Apple Hardware**: iOS is restricted to Apple hardware only, not available for use on other mobile devices for security and commercial reasons.
	4. **Jailbreaking**: Jailbreaking allows users to bypass iOS restrictions, leading to security vulnerabilities.
	5. **App Store**: iOS has a vast ecosystem with over 1 million applications available on the App Store (as of 2016), increasing the attack surface for potential security threats.
- iOS Software Stack
	- ![[ios stack.png]]
	1. **Layered Architecture**: iOS architecture is organized into layers.
	2. **Frameworks**: Technologies are encapsulated within frameworks, which include necessary libraries and resources.
	3. **Abstraction Layers**:
	    - **Cocoa Touch**: Provides essential frameworks for building iOS applications, including UIKit for the user interface.
	    - **Media**: Handles multimedia functionality like audio, video, and graphics.
	    - **Core Services**: Offers fundamental services such as networking, file management, and data storage.
	    - **Core OS**: Provides low-level functionalities such as security, multitasking, and hardware abstraction.
- Stack Components
	1. **Cocoa Touch:**
	    - Frameworks written in Objective-C based on Mac OS X Cocoa API.
	    - Responsible for the appearance and functionality of iOS apps.
	    - Supports notifications, multitasking, touch-specific inputs, and other system services.
	    - Key Frameworks: Address Book UI, Event Kit UI, Game Kit, Map Kit, Message UI, etc.
	2. **Media:**
	    - Handles multimedia functionalities like audio, video, graphics, and AirPlay.
	    - Provides frameworks for multimedia experiences.
	    - Key Frameworks: Assets Library, AV Foundation, Core Audio, Core Graphics, Core Image, Core MIDI, Core Text, Core Video, etc.
	3. **Core Services:**
	    - Offers fundamental services for all applications.
	    - Provides various frameworks for essential functionalities.
	    - Key Frameworks: Accounts, Address Book, Ad Support, CFNetwork, Core Data, Core Foundation, Core Location, Core Media, Core Motion, Event Kit, etc.
	4. **Core OS:**
	    - Low-level fundamental services and technologies.
	    - Interfaces with device hardware.
	    - Provides low-level networking, memory management, filesystem access, etc.
	    - Key Frameworks: Accelerate, Core Bluetooth, External Accessory, Generic Security Services, Security, etc.
- iOS SDK & Xcode:
	1. **iOS SDK:**
	    - Resources and tools for iOS app development.
	    - Released by Apple in February 2008.
	    - Formerly iPhone SDK.
	2. **Xcode:**
	    - Apple's IDE for iOS app development.
	    - Includes coding, testing, and debugging tools.
	- **Restrictions:**
		- Only installable on Mac OS X.
		- No license required for non-Apple hardware.
-   iOS Application Programming Languages
	1. **Objective-C:**
	    - Object-oriented language developed in the early 1980s.
	    - A strict superset and augmentation of C.
	    - Adds Smalltalk-style messaging to C.
	    - Used for developing native iOS apps.
	    - Compiles to native code and links against iOS SDK and Cocoa Touch frameworks.
	2. **Swift:**
	    - New programming language created by Apple Inc. for iOS, OS X, and watchOS.
	    - Released on June 2, 2014, with a stable release on September 15, 2015.
	    - Replaces Objective-C for iOS app development.
- Apple's iOS security model
	- ![[ios sec.png|550]]
- Device-Level Security:
	1. **Device Locks:**
	    - Enforces PIN or passcode to prevent unauthorized access.
	    - Provides options for remote wipe through Mobile Device Management (MDM).
	    - Activation lock and "Find My Phone" features enhance security.
	2. **Configuration Profiles:**
	    - Allows signing of configuration profiles for secure distribution.
	    - Enables centralized distribution of configurations to devices.
	    - Configurations can restrict device functionalities, e.g., blocking jailbroken devices from opening certain applications.
- System-level security
	- ![[system level sec.png]]
	1. **Secure Boot Chain:**
	    - Maintains integrity from firmware initialization to iOS loading.
	    - Ensures trusted, tamper-proof code execution on valid devices.
	    - Apple signs each step in the boot chain.
	    - Components include Boot ROM, Low Level Bootloader (LLB), iBoot, and iOS Kernel. 
	        - The Boot ROM initiates the secure boot chain by executing trusted code upon device startup, ensuring the integrity of subsequent boot components. The Low Level Bootloader (LLB) verifies and loads iBoot, which in turn loads the iOS Kernel, forming a critical chain of trust in the iOS device's boot process.
	2. **System Software Authorization:**
	    - Prevents downgrading iOS ==versions==.
	    - Ensures security during software updates via iTunes or over-the-air.
	3. **Secure Enclave:**
	    - Hardware-level protection against kernel-level attacks.
	    - Independent from the application processor.
	    - Unique IDs on A7 or A8 processors not known to Apple.
	    - Responsible for Touch ID functionality and access approval.
	4. **Touch ID:**
	    - Fingerprinting technology for device security.
	    - Allows users to protect devices from unauthorized access.
	    - Can be unlocked with a valid PIN or passcode even if Touch ID is enabled.
- Data-level security
	1. **Encryption Techniques:**
	    - Protects data at rest using hardware and software encryption.
	    - Allows remote wiping of data after a predefined number of unlock attempts.
	2. **Data-Protection Classes:**
	    - ![[data sec classes.png|500]]
	    - **NSFileProtectionComplete:** Requires passcode or Touch ID for file access.
	    - **NSFileProtectionCompleteUnlessOpen:** Protects file unless open.
	    - **NSFileProtectionCompleteUntilFirstUserAuthentication:** Protects file until first opened.
	    - **NSFileProtectionNone:** No protection, but files are encrypted by default.
	3. **Keychain Data Protection:**
	    - Keychain manages basic password management.
	    - Protection classes include:
	        - `kSecAttrAccessibleAfterFirstUnlock`: Keychains can be accessed while the device is locked but in the case of a reboot, it requires an unlock before allowing access to data
	        - `kSecAttrAccessibleWhenUnlocked`: All the keychain data will be accessible when the device is unlocked
	        - `kSecAttrAccessibleAlways`: All the data is accessible at any point of time
	        - `kSecAttrAccessibleWhenPasscodeSetThisDeviceOnly`: This is similar to `kSecAttrAccessibleWhenUnlocked`
	        - `kSecAttrAccessibleAfterFirstUnlockThisDeviceOnly`: This similar to `kSecAttrAccessibleAfterFirstUnlock`, but data migration between devices through backups is not possible
	        - `kSecAttrAccessibleAlwaysThisDeviceOnly`: This is similar to `kSecAttrAccessibleAlways`, but data migration is not possible through backups
- Network-level security
	1. **Encryption Technologies:**
	    - Secures data over VPN, Wi-Fi, Bluetooth, etc., using encryption.
	2. **Transport Layer Security (TLS):**
	    - Default encryption in apps like Mail and Safari, usually TLS 1.0 to 1.2.
	3. **Key Classes and APIs:**
	    - **CFNetwork Class:** Blocks SSLv3 connections.
	    - **NSURLConnection and NSURLSessionCFURL APIs:** Used for network communication.
	4. **App Transport Security (ATS):**
	    - Automatically enforced in iOS 9+ apps for secure network communication.
- Application-level security
	- ![[app level sec.png|500]]
	1. **Code Signing:**
	    - Ensures apps are from trusted sources and haven't been tampered with.
	    - Similar to Android's code-signing mechanism.
	    - Only allows apps signed by the App Store.
	    - Runtime checks verify app signatures.
	2. **Purpose of Code Signing:**
	    - Verifies app origin and authenticity.
	    - Involves digital identification with developer-signed public and private keys.
	    - Only signed apps can be installed on iOS devices.
	3. **Code Sign Identity:**
	    - Credentials issued by Apple for developers to sign their apps.
- iOS App Sandbox
	- ![[iOS App Sandbox.png|500]]
	1. **Sandboxing Technique:**
	    - Similar to Android, iOS apps run in a sandbox controlled by iOS.
	    - Limits app's access to files, hardware, and preferences.
	    - Entire app and its data reside in its own sandbox directory during installation.
	    - Jailbreaking can bypass sandbox restrictions.
	2. **iOS Isolation:**
	    - iOS isolates each app from others and the operating system.
	    - Prevents apps from accessing each other's data or the kernel.
	    - Two Types of Isolation:
		    - **Process Isolation:**
		        - Restricts inter-app communication.
		        - Apps run in their own sandboxes.
		    - **Filesystem Isolation:**
		        - Apps cannot detect each other's existence.
		        - iOS filesystem has a publicly readable, but read-only, section.
- Hardware-Level Security:
	1. **Cryptographic Support:**
	    - Apple A8 or A7 processors integrate cryptographic support.
	    - Utilizes AES 256 cryptographic engine.
	    - Built into Direct Memory Access (DMA) path between flash and main system memory.
	2. **Unique Identifiers:**
	    - Devices are assigned a Unique Identifier (UID) and a Device Group ID (GID) at the processor level.
	    - UID and GID are compiled into the hardware.
	    - Provides enhanced security by preventing direct access to encryption and decryption techniques.
- **Apple's iOS Security Model:** (RECAP)
    - Comprehensive security measures across various levels.
	1. **Device-Level Security:**
	    - Encompasses security measures at the device level.
	    - Includes PIN or passcode enforcement, remote wipe options, and activation lock features.
	    - Focuses on protecting the physical device from unauthorized access or loss.
	2. **System-Level Security:**
	    - Concerned with security mechanisms implemented within the operating system.
	    - Involves Secure Boot Chain, System Software Authorization, Secure Enclave, and Touch ID.
	    - Aims to protect the integrity of the operating system and critical system processes.
	3. **Data-Level Security:**
	    - Deals with securing data stored on the device.
	    - Utilizes encryption techniques and data-protection classes.
	    - Ensures confidentiality and integrity of user data, even when stored locally.
	4. **Network-Level Security:**
	    - Focuses on securing data during transmission over networks.
	    - Utilizes encryption technologies such as TLS.
	    - Involves secure communication protocols and APIs for network communication.
	5. **Application-Level Security:**
	    - Concerned with security measures implemented within individual applications.
	    - Includes code signing to verify app authenticity and sandboxing to limit app access to system resources.
	    - Aims to prevent unauthorized access to application data and ensure app integrity.
	6. **Hardware-Level Security:**
	    - Involves security mechanisms implemented at the hardware level.
	    - Utilizes cryptographic support and unique identifiers.
	    - Ensures protection against hardware-level attacks and unauthorized access to device encryption.
- The iOS application structure
	- ![[iOS application structure.png]]
	1. **Payload Folder:**
	    - Contains all application data.
	    - Subfolders:
	        - **Application.app:** Contains:
	            - Binary executable.
	            - Bundle resources including images.
	            - Original provisioning file (`Embedded.mobileprovision`) for re-signing.
	            - `CodeSignature` folder for verification of app integrity.
	2. **iTunesArtwork:**
	    - Optional file used for displaying app logo in `iTunesConnect`.
	3. **iTunesMetadata.plist:**
	    - Contains application metadata:
	        - Developer's name.
	        - Bundle identifier.
	        - Copyright information.
-  Jailbreaking:
	1. **Definition:**
	    - Technique to remove limitations imposed by iOS through software exploits.
	    - Similar to rooting in Android, voids warranty and Apple support.
	2. **Reasons to Jailbreak:**
	    - Customize iOS interface.
	    - Access iOS filesystem and remove built-in apps.
	    - Install custom or non-traditional store apps.
	    - Download content for free.
	    - Participation in bounty programs.
	3. **Types of Jailbreaks:**
	    - **Untethered Jailbreaks:**
	        - Allows running apps and tweaks after reboot with no consequences.
	    - **Tethered Jailbreaks:**
	        - Requires connecting device to computer to boot due to reliance on external code.
	    - **Semi-tethered Jailbreaks:**
	        - Allows booting device without computer, but jailbroken add-ons and tweaks are inactive until booting with a program like Redsnow. 
- Property Lists:
	1. **Definition:**
	    - XML files used to store application data with `.plist` extension.
	    - Commonly used for storing settings information of third-party applications.
	2. **Usage:**
	    - `NSDefaults` class is used to interact with property lists.
	    - Stored in` /Library/Preferences` folder in the iOS filesystem.
	3. **Accessing:**
	    - Property lists can be accessed using the `plutil` utility.
- Exploring the iOS Filesystem:
	1. **Accessing the Filesystem:**
	    - Typically requires jailbreaking for full access.
	    - Can be accessed on non-jailbroken devices when paired with a PC.
	    - iOS 7 and later versions prompt user to trust the computer when paired.
	2. **Important File Locations:**
```
/Applications: All the system applications are stored in this location
/var/mobile/Applications: Third-party applications are stored here; this has been replaced by the Containers folder in iOS 8 and later versions
(/private/var/mobile/Containers/Bundle/Applications)
/private/var/mobile/Library/Voicemail: This contains voicemail details
/private/var/mobile/Library/SMS: This has SMS data Exploring the iOS filesystem
/private/var/mobile/Media/DCIM: This contains photos
/private/var/mobile/Media/Videos: Videos are stored here
/var/mobile/Library/AddressBook/AddressBook.sqlitedb: This is the contacts
database
/private/var/mobile/Library/Notes: This contains notes information; sometimes, this
includes passwords and usernames in plaintext
/private/var/mobile/Library/CallHistory: This has the call history backup
/private/var/mobile/Library/Mail: This contains the entire mail history
/private/var/mobile/Library/Calendar/: This has calendar information
```
# S17
![[S17]]

# S18
![[S18]]
# S19
- Voice communication
	- Voice communication has traditionally been the core service of mobile networks, but with the shift towards **packet-switched** networks, it's becoming outdated to rely solely on **circuit-switched** services. **Packet-switched** networks transport various types of data via packets, making them more scalable and cost-effective. Here are the key points:
		- **Transition to Packet-Switched Networks**: Mobile networks are evolving towards packet-switched networks, where data is transmitted in packets rather than dedicated circuits.
		- **Advantages of Packet-Switched Networks**:
		    - **Scalability**: Packet-switched networks allow for more flexible scaling compared to dedicated infrastructures.
		    - **Cost-Effectiveness**: Implementing voice services on packet-switched networks is more economical.
		    - **Resource Utilization**: Packet-switched networks optimize resource usage, experiencing fewer unnecessary reservations during service access.
		    - **Better Quality of Service**: Packet-switched networks can provide better quality of service, especially for multimedia services that require close synchronization and user interaction.
- VoIP (Voice over IP)
	- ![[voip.png|500]]
	- VoIP refers to voice-oriented services where voice is transmitted as streams of IP packets. Here's how it works:
		- **Sender Side**:
		    - Voice sound is sampled using a microphone.
		    - Sampled traffic is converted into a digital representation by an analog-to-digital converter (ADC) to obtain a bit stream.
		    - The bit stream is packed into IP packets and sent over an IP network.
		- **Receiver Side**:
		    - Samples are extracted from IP packets.
		    - Samples are placed in a playback buffer to compensate for network jitter.
		    - A digital-to-analog converter (DAC) converts the bit stream back into an analog signal.
		- **Two-Way Communication**:
		    - VoIP replicates this process in reverse for two-way communication between sender and receiver.
- VoIP problems
	- Despite its benefits, mobile VoIP presents several challenges that need to be addressed:
		1. **Bandwidth Limitations**:
		    - Wireless environments may have limited bandwidth and other network constraints, affecting the performance of mobile VoIP services.
		2. **Security Concerns**:
		    - Implementing security mechanisms for mobile VoIP can decrease performance and flexibility of mobile devices, impacting the system's efficiency.
		3. **IP Address Management**:
		    - Mobile subscribers often change IP addresses as they move between areas, disrupting VoIP calls since current solutions rely on fixed IP addresses for call continuity.
- **VoIP Signaling Protocols**
	- Two widely used signaling protocols in VoIP solutions are:
		1. **SIP (Session Initiation Protocol)**:
		    - Recommended by the Internet Engineering Task Force.
		    - Simple, scalable, and extensible.
		    - Requires four packets to establish a call.
		    - Runs on UDP, offering simplicity and efficiency.
		2. **H.323**:
		    - Recommended by the International Telecommunications Union.
		    - Requires longer setup time, needing 12 packets for call setup.
		    - Uses both TCP and UDP during call setup.
		    - Provides session control for coordinating conferences.
		- **Advantages of SIP over H.323**:
			- **Efficiency**: SIP requires fewer packets for call setup compared to H.323.
			- **Protocol Usage**: SIP uses UDP for call setup, while H.323 utilizes both TCP and UDP. UDP offers lower protocol overhead but does not guarantee data delivery.
- Real-time protocol (RTP)
	- TCP requires resending if packet sent not properly. It increases time and overhead. 
	- RTP does not resend lost packets to avoid such inefficiency
	- Many VoIP uses RTP in addition to H.323
- **SIP Overview**
	- **Protocol Type**: SIP (Session Initiation Protocol) is an application layer control protocol used for *establishing, modifying, and terminating calls* in IP-based communication systems.
	- **Architectural Elements**:
	    - **User Agent (UA)**: Implemented at SIP end stations, responsible for receiving incoming SIP messages and sending SIP messages upon user actions or incoming messages. It includes:
	        - **User Agent Client (UAC)**: Issues SIP requests.
	        - **User Agent Server (UAS)**: Responds to SIP requests and starts appropriate applications based on established sessions.
	- **Network Server Types**:
	    - **Proxy Server**: Relays SIP messages, allowing the use of domain names to find users instead of IP addresses. It can hide the user's location.
	    - **Redirect Server**: Returns the location of the host without participating in the entire transaction.
	    - **Registrar**: Handles user registrations with their provider's servers. When a SIP device comes online, it registers with a Registrar by sending a REGISTER message. Registrations bind the user's ID with an IP address where the user can be reached.
	- **Functionality**:
	    - **Proxy and Redirect Servers**: Accept registrations from users and can store user locations locally or in a dedicated location server.
	    - **Registration**: Users must register with a SIP Registration Server (Registrar) when they come online, binding their ID with an IP address. Registrations are not permanent.
- **SIP Setup**
	- ![[sip setup.png]]
	- **Overview**:
	    - SIP (Session Initiation Protocol) facilitates call establishment, modification, and termination in IP-based communication systems.
	- **Example Setup**:
	    - **Caller**: Initiates call to another user (answerer or callee) using their SIP identity, known as a SIP URI (similar to an email address).
	    - **Format**: SIP URI contains user name and host identifier (e.g., caller-ID@host-ID).
	    - **Process**:
	        1. Caller sends an INVITE request to the answerer's provider SIP server proxy (SPA) via the caller's provider's SIP server.
	        2. If the answerer accepts the call, a media session is established between the parties.
- H.323 Overview
	- **Standard Definition**:
	    - H.323 Standard facilitates real-time information transmission over packet-based networks without guaranteed quality of service.
	- **Components**:
	    1. **Terminals**:
	        - Client endpoints on IP-based networks enabling real-time, two-way communications.
	        - Functions include signaling and control, real-time communication using RTP, and codecs for audio/video compression.
	    2. **Gateways**:
	        - Inter-connect packet-switched networks with switched circuit networks (SCN).
	        - Responsible for call setup/control, format translation, and communication procedure translation.
	    3. **Gatekeepers**:
	        - Compulsory functions: address translation, admission control, bandwidth control, and zone management.
	        - Optional functions: call control signaling, authorization, management, and bandwidth management.
	    4. **Multipoint Control Units (MCU)**:
	        - Support conferencing using a set of endpoints.
	        - Consists of a multipoint controller (MC) and multipoint processors (MP).
	        - MC is for negotiating between terminals, and deetermining common capabilities, while MP processes media streams for conferencing.
	- **Information Streams**:
	    - H.323 supports five types of information streams: Audio, Video, Data, communications control data, and call control data.
	    - Streams are transmitted and controlled using Real Time Transport Protocol (RTP) and Real Time Control Protocol (RTCP) over UDP.
	- **Channels**:
	    - Channels structure information exchange between entities.
	    - Channels are transport-layer connections, either unidirectional or bi-directional.
- Comparing the Signaling Protocols
	1. **Functionality**:
	    - **Call Setup and Tear Down**:
	        - H.323 v2: Based on RTP, involves TCP connection and call connection.
	        - H.323 v3 and SIP: Support both TCP and UDP, simplifying call setup.
	        - Tear down: H.323 uses RELEASE COMPLETE, while SIP uses BYE messages.
	    - **Call Forwarding**:
	        - SIP: Uses LOCATION header fields for call forwarding, supporting various types like call forwarding busy, no response, and selective call forwarding.
	2. **Quality of Service (QoS)**:
	    - **Parameters**: Bandwidth, latency, delay jitter, packet loss, and call setup delay.
	    - **Jitter**: Non-uniform packet delays, often caused by low bandwidth. Controlled using routers and network elements supporting QoS.
	    - **Packet Loss**: Result of excess latency or jitter, challenging to mitigate in real-time due to VoIP's time constraints, making TCP unreliable for retransmission.
- **Security Issues in VoIP**
	- **Bandwidth Usage**: Adding security constraints increases bandwidth usage, leading to more latency and jitter, thus reducing overall Quality of Service (QoS).
	- **Heterogeneous Data Flow**: Voice and data streams sharing limited bandwidth can lead to congestion, affecting VoIP traffic delivery within QoS time constraints.
	- **Potential Risks**:
	    - **Signaling and Voice Data Attacks**: Attacks targeting integrity, confidentiality, authentication, or non-repudiation of transported data.
	    - **Eavesdropping and Modification**: Sensitivity of audio payload data and signaling information to eavesdropping, jamming, and active modification.
	    - **Competition Among Service Providers**: Challenges in maintaining security in an open environment with competition among service providers.
	    - **Identity Compromise**: Compromising the identity of an end system or infrastructure component can lead to invasion of privacy, misuse of services, and potential routing of incoming calls to attackers.
- **Security Provided by H.323**
	- **Characteristics**:
	    - **Elliptic Curve Cryptography**: Supported for enhanced security.
	    - **Advanced Encryption System (AES)**: Utilized as a standard encryption method.
	    - **Security Profiles**: Several security profiles ensure interoperability among products.
	- **Baseline Security Profile**:
	    - Relies on symmetric techniques.
	    - Uses shared secrets for authentication and/or message integrity.
	    - Supported Scenarios:
	        1. Endpoint-to-Gatekeeper
	        2. Gatekeeper-to-Gatekeeper
	        3. Endpoint-to-Endpoint
- **Security Provided by SIP**
	- **Digest Authentication**:
	    - Based on a challenge-response paradigm, ensuring secure authentication.
	    - It's like having a secret code for verifying identities in SIP calls. Helps ensure that only authorized users can access the communication.
	- **RTP Encryption**:
	    - Provides confidentiality for media data, enhancing privacy during communication.
	- **TLS (Transport Layer Security)**:
	    - Recommended by RFC 3261 for protecting SIP signaling.
	    - Protects against integrity loss, confidentiality attacks, and replay attacks.
	    - Offers integrated key-management, mutual authentication, and secure key distribution.
	    - Applicable on a hop-by-hop basis between User Agents (UAs) and proxies or between proxies.
	- **Limitations of TLS in SIP**:
	    - Requires a reliable transport stack, incompatible with UDP-based SIP signaling.
- Security Threats to Mobile VoIP
	- **Loss of Availability and Telephone Fraud**:
	    - Threats include service unavailability and fraudulent usage of VoIP services.
	- **Categories of Threats**:
	    1. **Access Abuse**: Unauthorized access leading to misuse of VoIP services.
	    2. **Denial of Service (DoS)**: Deliberate actions to disrupt or disable VoIP services.
	    3. **Eavesdropping**: Unauthorized interception of VoIP communications.
	    4. **Masquerading**: Pretending to be a legitimate user to gain unauthorized access.
	- **Targets of Attacks**:
	    - Signaling and media transport planes are vulnerable to attacks on data integrity, confidentiality, authentication, and non-repudiation.
	        - **Signaling Plane**:
			    - This refers to the part of the VoIP system that handles the setup, management, and termination of calls. It's responsible for initiating, modifying, and terminating communication sessions between users.
			- **Media Transport Plane**:
			    - This is the part of the VoIP system that actually carries the audio and video data during a call. It's responsible for transporting the voice and video streams between the callers.
	    - Signaling information exchanged between components is sensitive to eavesdropping, jamming, and active modification.
	- **Challenges in Open Environment**:
	    - Increased difficulty in addressing threats due to competition among service providers.
	    - Finding, selecting, and running services are subject to competition, making security measures more crucial.
- Abuse of Access
	- **Definition**:
	    - Malicious mobile users or programs misuse their access to mobile VoIP systems.
	- **Forms of Abuse**:
	    1. **Click-to-Dial Service**:
	        - Users can request calls back via the regular phone system through a web page.
	        - Attackers exploit this to cause financial losses to enterprises.
	    2. **API Access by Phone Applications**:
	        - Phone applications provide APIs for initiating calls or inserting objects in active calls.
	        - Malicious objects can be inserted.
	        - Example: Skype application offers such APIs but typically includes access control mechanisms.
	- **Access Control Mechanisms**:
	    - Typically, APIs are protected by access control mechanisms, asking users to authorize the phone application's control over the API use.
	    - Example: Skype authorizes applications to manage various aspects of its client.
- **Denial of Service (DoS)**
	- **Definition**:
	    - Deliberate attacks aiming to disrupt availability of mobile VoIP services.
	- **Levels of DoS Threats**:
	    1. **Transport/Network-Level**:
	        - Flooding the target with excessive traffic.
	        - Examples include "ping of death" or Smurf attacks.
	    2. **Server-Level**:
	        - Making the server unavailable by modifying stored information or overwhelming it with requests.
	    3. **Signaling-Level**:
	        - Overloading the SIP protocol server with excessive messages, making it unavailable for handling legitimate SIP messages.
	        - Unauthorized users can also cause over-usage issues, degrading QoS for legitimate users.
	- **Specific DoS Attacks Against SIP**:
	    - Spoofed "bye" messages to terminate SIP calls.
	    - Flooding entities involved in SIP signaling with Register or Invite messages.
	    - Sending illegal SIP messages to overload SIP servers, as each receiving entity must fully investigate the message before validating it.
- **Eavesdropping Threats**
	- **Definition**:
	    - Attempts to intercept signaling or data packets by copying legitimate messages between communicating entities.
	- **Privacy Concerns**:
	    - Attacker collects unauthorized information, compromising privacy.
	    - Potential actions include:
	        - Obtaining origin and destination information of calls.
	        - Overhearing private conversations.
	        - Intercepting personal information related to mobile client accounts.
	- **Real Menace in Mobile VoIP**:
	    - Packet-sniffers are readily available for eavesdropping on VoIP traffic, particularly in WLANs.
	- **Manipulation of Media Stream**:
	    - Attacker can use information obtained from eavesdropping to manipulate media stream fields.
	    - Can make fraudulent VoIP calls or inject their own data.
	- **Unencrypted Signaling and Media Streams**:
	    - SIP messages and media streams are typically sent unencrypted for interoperability or ease of execution by wireless networks, despite encryption being possible.
- **Masquerading Threats** (or impersonation as I understood)
	- **Definition**:
	    - Allows an entity to impersonate another entity, leading to call charging fraud, privacy violations, and integrity breaches.
	- **Attack Methods**:
	    1. **Hijacking After Authentication**:
	        - Attacker hijacks a link after authentication or eavesdrops on authentication information and replays it.
	        - Steals the identity of a legitimate user to gain unauthorized access to mobile VoIP services.
	    2. **Reuse of Authentication Information**:
	        - Attacker intercepts username and password and reuses them to masquerade as a legitimate user.
	        - Authentication information obtained through interception can be used for masquerading.
	- **Specific Masquerading in SIP**:
	    - **Reuse of Username and Password**:
	        - Obtained through interception or reverse engineering of passwords in SIP digest authentication.
	        - Attacker sends false challenges to the SIP user agent to generate a list for breaking the cryptographic hash of the password.
	- **Combined Attacks**:
	    - Masquerading attack combined with data modification to gain access to services and place unauthorized calls.
- **Obtaining Control of an End System**
	- **Physical Access to IP Telephone**:
	    - Attacker can reset the IP telephone to default configuration.
	    - Backdoors or weak initial passwords can be provided.
	- **Vulnerabilities in Remote Management Interface**:
	    - Remote management interface of IP telephone is susceptible to attacks.
	- **Plain-text Transmission of Administrator Password**:
	    - Communication of administrator password in plain-text is vulnerable to sniffing attacks.
	- **Automated Brute-force Attacks**:
- **Attacking User's Privacy**
	- **Utilization of VoIP Applications**:
	    - VoIP applications use RTP packets transmitted over UDP protocol to carry audio data streams.
	- **Symmetric Encryption of Audio Payloads**:
	    - Basic mechanisms for symmetrically encrypted audio payloads in RTP packets are employed, as described in an appropriate RTP profile.
	- **Identification of Data Streams**:
	    - Eavesdroppers can identify the data streams constituting audio connections.
	    - Public availability of VoIP protocol stacks and detailed protocol mechanisms facilitate this identification.
	    - Despite dynamic negotiation of ports for these streams, eavesdroppers can still discern and intercept the audio data.
- Security Requirements for Mobile VoIP
	- **End-to-End Authentication**:
	    - Caller and callee must authenticate each other to establish session keys for protecting voice data streams.
	    - Ensures that calls are only established with expected parties, preventing simple redirection attacks.
	- **Protection Against Eavesdropping**:
	    - Voice streams should be encrypted to prevent eavesdropping, especially critical for mobile VoIP due to increased susceptibility.
	    - Session keys can be used to encrypt and maintain integrity of audio streams during calls.
	- **Blocking Undesired Calls and Spam Prevention**:
	    - Authentication handshake during call establishment can automatically reject unwanted calls based on user preferences.
	    - Helps prevent VoIP spamming and unwanted calls similar to email spamming.
	- **Correct Call Charging**:
	    - Ensuring accurate charging for calls, although flat rates are commonly used for Internet calls.
	- **Protection of Caller's Identity**:
	    - Encrypting call setup messages and using TLS transport to prevent eavesdropping and identity exposure.
	    - Callee's identity protection is challenging due to potential other ways for attackers to obtain information.
	- **Anonymous Call Service**:
	    - Ability for caller to hide identity from callee while allowing callee to reject anonymous calls.
	    - Introduction of initial authentication handshake does not preclude caller anonymity.
