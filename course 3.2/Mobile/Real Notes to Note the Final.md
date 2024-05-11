# S11
- Security Issues
	- Physical Security
	- Strong Authentication with Poor Keyboards (keylogging)
	- Multiple-User Support 
	- Safe Browsing Environment (links are not safe, Scams are more effective)
	- Secure Operating Systems. (more secure less user experience)
	- Application Isolation
	- Information Disclosure (date on phone has more value, phone can connected to corparate network)
	- Virus, Worms, Trojans, more
	- Difficult Patching/Update Process (because of other vendors like LG, XIAOMI, who has addons on Android)
	- Strict Use and Enforcement of SSL
	- Phishing
	- CSRF
	- Location Privacy/Security
	- Insecure Device Drivers
	- Multifactor Authentication (can be spoofed)
- In Development
	- Leverage TLS/SSL
	- Secure programming practices
	- input sanitization and validation
	- permission model
		- all permission to app is bad
	- least priv model
	- store Sensitive Information encrypted
	- Sign the Application’s Code
		- in google store for having appropirate permission
	- Understand the Mobile Browser’s Security Strengths and Limitations
		- mobile and web are not the same
	- Secure and Intuitive URLs to not confuse
# S12
- Requirements for GSM Security:
	- **mobile user’s privacy**
	- **data integrity protection**
- it is required for following activities:
	- call setup
	- voice-based services protection
	- privacy of location
	- privacy of calling patterns
	- privacy of user identity
	- protection of data
- in call-setup, mobile terminal sends these information to GSM network. 
	1. calling party number
	2. calling card number
	3. service type requested
- This info should be protected
	- against eavesdropping
	- via encryption 
- Out-leaking of signals from mobile terminal to GSM network can help attackers to track users, collect information about them. 
- It is also important to check if data integrity while transmission 
- Replication
	- There is "replication" that can mess up these GSM systems. 
	- One way attackers do this is by "cloning" your phone. Cloning basically means they figure out info about your phone and make an exact copy of it. They do this by gathering info stored in your SIM card. They could use it as if they were you, use services without paying or do something bad.
	- in order to prevent it Equipment Identifiers are used, which are worlwide unique
- Auth process
	1. **Ku** is the shared secret value stored on SIM card, not accessible to user
	2. In authentication, network sends a random number (RAND) and SIM card uses these 2 value for authentication algorithm, provide a value SRES, and create a session key Ks
	3. The user is authenticated if the provided SRES matches the value of SRES that is computed separately by the GSM network
	4. The encryption is performed using key Ks
	5. It provides anonymity, user authentication, and confidentiality but not network authentication.
- #### Anonymity
	- In GSM, when you turn on your phone, it first uses your **real identity to connect to the network,** but then it gets assigned a **temporary identifier called TMSI for future connections** within a specific area. This TMSI is always encrypted by the network for extra security.
- Authentication
	-  to prove that users are who they claim to be
	- two functional components, the SIM card in the mobile and the Authentication Center (AuC)
	-  This process guarantees that the MS requesting service is a legitimate subscriber and not an intruder or a cloned user.
- #### Confidentiality
	- A8 is used to generate a session key Ks. 
	- Ks is utilized for voice and data encryption before transmission on the radio link
- GSM Security Flaws
	1. No authentication of the network is provided to the user.  it is possible for an attacker to set up a false base station (or RBS, for rogue BS) with the same mobile network code as the subscriber’s network.
	2. Common implementation of A3/A8 is flawed
	3. Vulnerabilities in the subscriber identity confidentiality mechanism
		1. if IMSI is lost, user's real info is requested, and it sent in plain text. Attacer can catch it and learn TMSI for this IMSI.
	4. air cracking of Ku
		1. The attacker can imitate a valid base station
		2. the attacker gets the MS’s IMSI by sending to the MS an identity request 
		3. The attacker collects the (RAND, SRES) pairs until he gains enough information to derive the key Ku
- ##### Impersonation attack
	1. **Impersonating the network** device thinks that it is talking to network but it is attacker's device that impersonates the network
	2. **Impersonating your device**: network thinks that it is your device
	3. **Man-in-the-middle attack**: By doing both of these attacker can sit in the middle of your communication. They can spy on what you're saying, change or delete your messages, or even pretend to be you to someone else.
	- They need a modified device (like a phone) and a modified base station (like a Wi-Fi router or cell tower) to do it
- ##### Attacks on the Authentication Algorithm
	- changing the algorithm used in SIM cards from COMP128 to a stronger one is tricky.
	1. **Old SIM Cards Stick Around:** The algorithm used in SIM cards is stored inside them. So, even if a new, stronger algorithm is introduced, people with existing SIM cards can't switch to it easily. They're stuck with the old algorithm.
	2. **New Subscribers Get the Better Version:** New SIM cards can have the updated, more secure version of COMP128. But this creates a problem. You end up with a mix of old and new SIM cards, which makes the authentication process less efficient.
	3. **COMP128 Isn't as Secure as We'd Like:** Even though the COMP128 algorithm was supposed to be kept secret, people have figured it out. It's been reverse-engineered and analyzed. Because the GSM specification (the standard for SIM cards) is public, all you need to clone a SIM card is the secret key for COMP128 and the IMSI number stored in the card
# S13
- 3G is more secure than 2G
- Recap to Architecture 
	- CS is Circuit-Switched and for signals, PS is Packet-Switched (PS)  and for data transfer
	- UMTS architecture has Core Network (CN) and Generic Radio Access Network (GRAN), with CS and PS domains handling voice and data respectively.
	- MS allows access to network services, contains USIM, and operates in CS, PS, or PS/CS modes. 
	- UTRAN includes Node Bs for radio transmission/reception and RNCs for managing radio resources and connecting to transport network.
	- Core Network (CN) transports user data, involves switching entities, gateways, and databases for user profiles and mobility management.
- UMTS Security
	- This architecture comprises five classes focusing on 
		- network access (Security Class 1)
		    - Provides secure access to 3G services.
		    - Protects against attacks on the radio link.
		- network domain (2)
		    - Enables secure exchange of signaling messages between nodes in the operator's network.
		    - Protects against attacks on the wired network targeting UMTS.
		- user domain (3)):
		    - Secures the access of mobile stations to the UMTS network and services.
		- application domain (4)
		    - Facilitates secure exchange of messages between applications implemented at the user domain and provider domain.
		- visibility/configurability (5)
			- users get info about security of the function
			- users check on what security function depend on
- Some Attacks and Mitigations
	- Mitigating 2G Weaknesses
		1. Active attacks using a rogue BTS: 3G networks mitigate this by implementing measures to detect and prevent rogue base stations from launching attacks.
		2. Clear transmission of cipher keys and authentication data: In 3G networks, cipher keys and authentication data are encrypted, ensuring secure transmission between and within networks.
		3. Limited encryption scope: Unlike 2G networks, 3G networks extend encryption beyond the wireless link, ensuring that user and signaling data are encrypted even across microwave links.
		4. Lack of data integrity: 3G networks address this weakness by providing data integrity, which thwarts certain rogue BTS attacks and safeguards against channel hijacking.
		5. Unsecured IMEI: 3G systems enhance security by ensuring that International Mobile Equipment Identity (IMEI) is transmitted and stored securely.
		6. Inflexibility in security upgrades: 3G networks are designed with flexibility to upgrade and improve security functionality over time, ensuring continuous enhancement of security measures.
	- Denial of Service
		- User de-registration request spoofing
			- Intruder uses  a modified mobile station (MS) and spoofs a deregistration request (IMSI detach) to the 2G network, causing the network to de-register the user from the visited location area and instruct the Home Location Register (HLR) to do the same.
		- Location update request spoofing
			- Also requires a modified MS and exploits the same weakness as above.
			- Attacker spoofs a location update request in a different location area from the one in which the user is roaming.
			- The network registers the user in the new location area, making the target user unreachable for mobile terminated services in their actual location.
	- Identity Catching
		- Passive identity catching
			- A passive attack exploiting the weakness of GSM networks sometimes requesting the user's identity in clear form. (in 2G)
		    - Requires a modified mobile station (MS).
			- 3G solves it using temporary identities allocated by the serving network which makes attack inefficient, as attacker may wait for real change in database too long
		- Active identity catching
			- in 2G requesting the MS to send its permanent user identity in clear form.
		    - Requires a modified base station (BS).
			- The intruder attracts the target user to use rogue BS, then requests the user to send their permanent identity in cleartext.
			- in UMTS (or 3G), it is solved by bla-bla-bla:
				- identity confidentiality mechanisms use encryption keys shared by a group of users to protect user identities, countering this attack.
	- Impersonation of the Network Attacks
		- Impersonation by suppressing encryption between target user and intruder
			- attacker makes user to not use encryption (by sending a command)
			- 3G solves it by mandatory requirement for encryption
		- Impersonation by suppressing encryption between target user and legitimate network
			- similar and 3G solves it by implementing a mobile station class-mark with message authentication and replay inhibition.
		- Impersonation by forcing the use of a compromised cipher key
			- 3G is vulnerable to it. 
	- Eavesdropping on User Data (MITM to listen the trafic)
		- Eavesdropping by suppressing encryption between target user and intruder
			- In 3G networks, a mandatory cipher mode command with message authentication and replay inhibition allows the mobile to verify if encryption has been suppressed.
		- Eavesdropping by suppressing encryption between target user and legitimate 2G network
			-  Message authentication and replay inhibition of the mobile's encryption capabilities allow the 3G network to verify if encryption has been suppressed.
		- Eavesdropping by forcing the use of a compromised cipher key
			- 3G is vulnerable to it
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
		1. Physical Access attacks I: Attacker obtains access to the **air interface** using a physical device, impersonating parts of the network or eavesdropping.
		2. Physical Access attacks II: Attacker obtains access to **cables** connecting 3G network switches, disrupting normal transmission of signaling messages.
		3. Physical Access attacks III: Attacker has access to **sensitive components of the 3G network**, causing impairments by editing service logic or modifying subscriber data.
		4. Physical Access attacks IV: Attacker has access to **links connecting the Internet to the 3G network**, disrupting transmission of signaling messages.
		5. Physical Access attacks V: Attacker has access to **Internet or cross-network servers** providing services to mobile subscribers, editing service logic or modifying subscriber data.
# S14
- Threats to LTE (4G) Networks
	- General Computer Security Threats
		- LTE infrastructure runs off of commodity hardware & software.
		- Mitigation: Security engineering and a secure system development lifecycle.
	- Renegotiation Attacks
		- Rogue base stations can force a user to downgrade to GSM or UMTS. As they are weaker.
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
		- Mitigation: The ciphering indicator feature (in 3GPP) would alert the user if calls are made over an unencrypted connection
	- Jamming UE Radio Interface
		- Threat: Jamming the LTE radio prevents the phone from successfully transmitting information.
			- Jamming decreases the signal to noise ratio by transmitting static and/or noise at high power levels across a given frequency band.
			- Prevents emergency calls
		- Mitigation: Unclear. Further research is required and may require changes to 3GPP standards to mitigate this attack.
	- Attacks Against the Secret Key (K)
		- Threat: Attackers may be able to steal secret key K from the carrier's HSS/AuC or obtain it from the UICC manufacturer:
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
- Security Tools:
	- **Manifest Explorer**: View `AndroidManifest.xml` for security analysis.
	- **Intent Sniffer**: Monitor runtime routed broadcast Intents.
	- **Intent Fuzzer**: Test applications for vulnerabilities using fuzzing.

| Manifest Explorer | ![[Pasted image 20240428210115.png]] |
| ----------------- | ------------------------------------ |
| Intent Sniffer    | ![[Pasted image 20240428210144.png]] |
| Intent Fuzzer     | ![[Pasted image 20240428210225.png]] |
- Android Security
	- **Openness of Android Platform**: Android is open-source, allowing developers to modify it freely. Third-party apps can run on the platform.
	- **Configuration Options**: Android can limit owner's access, enhancing security in case of device loss.
	- **Locking to Specific Networks**: Devices can be locked to networks, but this can be bypassed by technical users.
	- **Security Implications of Root Access**: Root access doesn't necessarily compromise Android's security model.
- **Android’s Security Model :**
	- **Based on Linux Kernel**: Android uses Linux kernel's security model with added abstractions.
	- **User Accounts**: Applications are isolated using Linux user accounts.
	- **Permissions**: Applications are granted permissions to perform actions, enforced by the kernel.
	- **Protection of Data**: Application data protection relies on UIDs.
	- **Permission Model**: Aims to minimize impact of malicious software by requiring user permission.
- Permissions
	- **Approval Required**: Apps need approval for certain tasks.
	- **Manifest Permissions**: Declared in `AndroidManifest.xml`.
	- **User Agreement**: Users agree to permissions upon installation.
	- **Goal Association**: Permissions should be associated with understandable goals.
- Permission Protection Levels
	- ![[perm prot level.png|500]]
- **Android Permissions Exception :**
	- **SecurityException**: Occurs when necessary permissions are missing.
	- **Logging Errors**: Consider logging errors for diagnosing issues.
	- **Silent Failures**: Permission failures can occur silently.
	- **Internationalization**: Ensure translations are accurate.
- **Creating New Manifest Permissions :**
	- **Purpose**: Define permissions for other apps to access resources.
	- **Exporting Components**: Avoid exporting components unnecessarily.
	- **End User Control**: Allows users to control resource access.
- **Securable IPC Mechanisms :**
	- **Purpose**: Facilitate communication between programs securely.
	- **Key Tools**: Android implements tools for secure IPC.
	- **Intents**: Mainly used for IPC on Android.
- IntentFilters
	- **Security Considerations**: Be cautious of potential malicious Intent callers
- Broadcasts
	- **Secure Broadcast Intents**: Ensure sensitive data is only received by authorized recipients.
- **Services in Android Recap:**
	- **Background Processes**: Long-running processes provided by Android.
	- **Starting Services**: Initiated with Intents.
	- **Securing Services**: Add permission checks in the manifest.
- **Avoiding SQL Injection Recap:**
	- Separate SQL statements from data.
	- **Parameterized Queries**: Use parameterized queries to prevent injection.
	- **Android ContentProvider and Activity Methods**: Support parameterization.
		- use specific functions for the code:  like `query(), update(), delete(), `and` managedQuery()`.They accept a parameter called "`String[] selectionArgs`," which substitutes values into the query string instead of directly including them.
- **Intent Reflection Recap:**
	- **Common Idiom**: Callbacks via Intents are common in Android.
	- **Avoiding Unauthorized Intents**: Prevent unauthorized Intent reflections.
- **Files and Preferences in Android Recap:**
	- **Unix-Style File Permissions**: Android supports Unix-style permissions.
	- **Accessing Application's Directory**: Access app's directory using Context methods.
	- **SharedPreferences**: Backed by a file with permissions.
	- **Security Concerns**: Avoid using world-writeable permissions.
- **Mass Storage in Android Recap:**
	- **Limited Internal Memory**: Devices have limited internal memory.
	- **VFAT Format**: Memory cards typically use VFAT format.
	- **Security Considerations**: Users should avoid storing sensitive data on shared memory.
# S16
- **Apple's iOS Security Model:**
    - Comprehensive security measures across various levels.
	1. **Device-Level Security:**
	    - Encompasses security measures at the device level.
	    - Includes PIN or passcode enforcement, remote wipe options, and activation lock features.
	    - Focuses on protecting the physical device from unauthorized access or loss.
	2. **System-Level Security:**
	    - Concerned with security mechanisms implemented within the operating system.
	    - Involves Secure Boot Chain(Boot ROM, Low Level Bootloader (LLB), iBoot, and iOS Kernel), System Software Authorization, Secure Enclave, and Touch ID.
	    - Aims to protect the integrity of the operating system and critical system processes.
	3. **Data-Level Security:**
	    - Deals with securing data stored on the device.
	    - Utilizes encryption techniques and data-protection classes.(`NSFileProtectionComplete...`)
	    - Keychain Protection (`kSecAttrAccessible...`) for password management
	    - Ensures confidentiality and integrity of user data, even when stored locally.
	4. **Network-Level Security:**
	    - Focuses on securing data during transmission over networks.
	    - Utilizes encryption technologies such as TLS. VPN WiFi Bluetooth
	    - Involves secure communication protocols and APIs for network communication.
	    - **CFNetwork Class:** Blocks SSLv3 connections.
	5. **Application-Level Security:**
	    - Concerned with security measures implemented within individual applications.
	    - Includes code signing to verify app authenticity and sandboxing to limit app access to system resources.
	    - Aims to prevent unauthorized access to application data and ensure app integrity.
	6. **Hardware-Level Security:**
	    - Involves security mechanisms implemented at the hardware level.
	    - Utilizes cryptographic support and unique identifiers.
	    - Ensures protection against hardware-level attacks and unauthorized access to device encryption.
- Jailbreaking
	- Technique to remove limitations imposed by iOS through software exploits.
	- Similar to rooting in Android, voids warranty and Apple support.
	- **Reasons to Jailbreak:**
	    - Customize iOS interface.
	    - Access iOS filesystem and remove built-in apps.
	    - Install custom or non-traditional store apps.
	    - Download content for free.
	    - Participation in bounty programs.
	- **Types of Jailbreaks:**
	    - **Untethered Jailbreaks:**
	        - Allows running apps and tweaks after reboot with no consequences.
	    - **Tethered Jailbreaks:**
	        - Requires connecting device to computer to boot due to reliance on external code.
	    - **Semi-tethered Jailbreaks:**
	        - Allows booting device without computer, but jailbroken add-ons and tweaks are inactive until booting with a program like Redsnow. 
- Property Lists
	- XML files used to store application data with `.plist` extension.
	- Commonly used for storing settings information of third-party applications.
	- similar to preferences in android
	- Property lists can be accessed using the `plutil` utility.
- iOS Filesystem:
	- Typically requires jailbreaking for full access.
	- Can be accessed on non-jailbroken devices when paired with a PC.
	- iOS 7 and later versions prompt user to trust the computer when paired.
# S17
- Discoverability modes
	1. **Non-discoverable:** Devices in this mode won't respond to search requests from other devices. However, this doesn't mean they can't be connected to; connection availability is controlled separately by connectability modes.
	2. **Limited discoverable mode:** This mode is for devices that want to be found but only for a specific period. They're visible for a limited time, after which they become non-discoverable again.
	3. **General discoverable mode:** Devices in this mode are always available to be discovered by other devices. They continuously listen for search requests and respond with information needed to establish a connection.
- #### Connectivity
	1. **Non-connectable mode**:
	    - Devices in this mode never actively listen for connection requests. They won't acknowledge or respond to any requests to connect.
	2. **Connectable mode**:
	    - Devices in this mode periodically listen for connection requests. They enter a state where they're actively scanning for incoming connection requests.
- #### Pairability/Bondability
	1. **Non-bondable mode**: Devices in this mode won't respond to connection requests and can't pair with other devices. They essentially stay invisible or closed off to connection attempts.
	2. **Bondable mode**: Devices in bondable mode are open to pairing with other Bluetooth devices. However, it's important to note that some devices in bondable mode might require extra security measures, like entering a PIN or some form of authentication, before they establish a connection.
- ### Security
	- as it is easy to use the Bluetooth, it is easier to hack, and it important to give attention to security while devloping an app integrated with it
- #### Pairing
	- During pairing, the devices create special keys (like secret passwords) that they both agree on. These keys aren't just for recognizing each other; they're also used to create even more keys. These extra keys are used to verify that the devices are who they say they are (authentication) and to keep their communication private (encryption). So, pairing isn't just about connecting devices—it's also about making sure that connection is safe and secure.
- **Device Pairing Prior to Bluetooth v2.1 + EDR**
	- Before Bluetooth version 2.1 + EDR, which came out in July 2007, when devices paired with each other, they had to **establish a connection by entering a PIN or passkey**. There were two kinds of passkeys: variable and fixed.
		- **Variable passkeys** could be chosen when pairing by using some kind of input method. For instance, a Bluetooth-enabled phone with a keyboard and screen might allow you to enter a passkey of your choice during pairing.
		- **Fixed passkeys**, on the other hand, were already set and couldn't be changed. These were usually used for devices that didn't have input or display capabilities to enter or verify a passkey themselves, like Bluetooth-enabled mice.
- **Secure Simple Pairing with Bluetooth v2.1 + EDR**
	- easier pairing with better security
	-  It requires newer devices to use a method called Secure Simple Pairing, which utilizes Elliptic Curve Diffie-Hellman (ECDH) for key exchange and link key generation.
	- There are four ways devices can be paired under Secure Simple Pairing:
		1. **Numeric Comparison**: Both devices display a six-digit number. The user confirms if the numbers match. Unlike the older PIN method, the displayed number isn't used for further key generation, so even if observed, it doesn't compromise security.
		2. **Just Works**: One device lacks a display or number input. The pairing process is similar to Numeric Comparison but lacks protection against man-in-the-middle attacks. How the user accepts the connection depends on the device's design.
		3. **Out of Band (OOB)**: An external method (like NFC) is used for pairing. For example, devices may be tapped together physically. The user confirms the pairing request after the devices are tapped. OOB mechanisms should protect against man-in-the-middle attacks.
		4. **Passkey Entry**: One device has a display, the other has number input. A six-digit number is shown on the display, which the user enters on the other device. If the numbers match, the devices are paired.
- #### Security services
	1. **Bluetooth Security Services**: Bluetooth provides basic security services including Authentication, Authorization, and Confidentiality. However, it *lacks integrity protections and nonrepudiation services*.
	2. **Authentication**: This process verifies the identity of Bluetooth devices before and during connection and communication. It's a one-way process, meaning only one device's identity is verified at a time. Authentication involves a claimant device (whose identity is being verified) and a verifier device (which verifies the claimant's identity) using a challenge-response mechanism.
	3. **Authorization**: Bluetooth allows selected access to resources based on permissions. It includes decision-making about resource access and connection configuration. Authorization is implemented through device trust levels (trusted or untrusted) and service security levels (1, 2, or 3).
	4. **Device Trust Levels**: Devices can be trusted or untrusted based on whether they have been paired previously. Trusted devices have full access to services, while untrusted devices have restricted access.
	5. **Service Security Levels**: Bluetooth services have three security levels: Service Level 1 requires authentication and authorization, Service Level 2 requires only authentication, and Service Level 3 has no security.
	6. **Confidentiality**: Bluetooth provides confidentiality through encryption. There are three encryption modes: Mode 1 (no encryption), Mode 2 (encryption for individual endpoints but not broadcast traffic), and Mode 3 (encryption for all traffic using the same key, accessible to all nodes in the network).
	7. **Encryption Mode 3**: This mode encrypts both broadcast and point-to-point traffic with the same encryption key. It assumes that all nodes in the network are trusted because they have access to the encrypted data
- **Frequency hopping**: Bluetooth uses a method called frequency hopping to transmit data. However, this method alone doesn't make it secure against eavesdropping. Here's why:
    - The sequence of channels used for hopping isn't kept secret.
    - Bluetooth only operates across 79 channels.
    - Someone could potentially monitor all these channels using multiple receivers, enabling them to eavesdrop on the communication without being detected. This is called an offline attack.
- **Device proximity**: Bluetooth devices typically have a limited range, usually up to around 330 feet with Class 1 radios. Some might think this limited range provides security because an attacker would need to be physically close to intercept signals. However:
    - Attackers can overcome this limitation by using high gain antennas, which extend the range significantly.
    - So, relying solely on limited signal strength as a security measure isn't reliable because attackers can bypass it with better equipment.
- ### Threats to Bluetooth Devices and Networks
	1. **Location Tracking**: Bluetooth devices emit radio signals with unique device addresses, making them susceptible to being tracked based on these signals. Essentially, someone could potentially monitor the movement of a Bluetooth device by tracking its emitted signals.
	2. **Key Management Issues**: Just like any technology using cryptography for authentication and encryption, Bluetooth devices can face threats related to how they manage cryptographic keys. This includes issues like accidentally revealing keys or tampering with them, which could compromise the security of the device or the data it transmits.
	3. **Bluejacking**: This involves sending unsolicited messages to a Bluetooth device without the recipient's consent. It can be used as a form of social engineering attack, taking advantage of vulnerabilities in Bluetooth devices that accept messages from unknown sources.
	4. **Implementation Issues**: Sometimes, *manufacturers incorrectly implement the Bluetooth specification in their devices*. This can create security vulnerabilities that wouldn't exist if the specification was correctly followed. Several well-known Bluetooth security issues, such as Bluesnarfing, Bluebugging, and Car Whispering, have stemmed from these implementation flaws.
	    - **Bluesnarfing**: This attack exploits flaws in device firmware to gain unauthorized access to a victim's Bluetooth device, allowing the attacker to retrieve various data, including sensitive information like the device's International Mobile Equipment Identity (IMEI).
	    - **Bluebugging**: By exploiting firmware flaws in certain mobile phones, this attack enables an attacker to access data, make calls, and eavesdrop on conversations.
	    - **Car Whispering**: This attack targets Bluetooth-enabled hands-free automobile kits, taking advantage of flaws in their implementation to send or receive audio, potentially compromising the privacy and security of conversations within the car.
- ### Vulnerabilities
	1. **Bluetooth Versions Prior to v1.2:**
	   - **Issue:** The unit key, which is a type of link key generated during device pairing, is reusable and becomes public when used. This key has been deprecated since Bluetooth v1.2.
	   - **Implication:** This vulnerability allows any device with access to the unit key to eavesdrop on communications.
	2. **Bluetooth Versions Prior to v2.1:**
	   - **Issue 1:** Short PINs are permitted for pairing. Because PINs are used to generate encryption keys, if users choose short PINs, it can weaken Bluetooth's encryption mechanisms.
	   - **Issue 2:** The encryption keystream repeats after approximately 23.3 hours of use. This means that the same encryption keystream is used again, making it easier for attackers to decipher communication.
	   - **Implication:** These vulnerabilities lower the overall security provided by Bluetooth's encryption.
	3. **All Versions:**
	   - **Issue 1:** The strength of the random number generator (RNG) used for challenge-response during Bluetooth authentication is unknown. Weaknesses in this RNG could compromise authentication and security.
	   - **Issue 2:** The Bluetooth specification allows negotiation of the encryption key down to a very small size, potentially as small as one byte.
	   - **Issue 3:** The encryption key used for encrypted broadcast communications in a Bluetooth network is shared among all devices in that network.
	   - **Issue 4:** The E0 stream cipher used in Bluetooth is vulnerable to a theoretical known-plaintext attack, which could lead to faster recovery of encryption keys.
	   - **Issue 5:** Bluetooth offers a limited set of security services, excluding services like integrity protection and nonrepudiation.
	   - **Implication:** These vulnerabilities collectively weaken Bluetooth security, making it easier for attackers to intercept communications or compromise device integrity.
- #### Recommendations
	1. **Don't rely solely on Bluetooth's built-in security**: Bluetooth's default security measures are primarily focused on securing connections between devices, rather than specific users. Therefore, they may not be robust enough for sensitive applications where access control is crucial.
	2. **Use complex PINs**: When pairing Bluetooth devices, use strong and complex Personal Identification Numbers (PINs) to add an extra layer of security against unauthorized access.
	3. **Limit Bluetooth radio power**: In environments where security is paramount, adjust the power settings of Bluetooth devices to minimize their signal range, reducing the likelihood of unauthorized access from distant devices.
	4. **Avoid "Just Works" association**: This refers to a simplified pairing method in Bluetooth v2.1 and Enhanced Data Rate (EDR) devices. Instead, opt for more secure pairing methods that involve user authentication.
	5. **Restrict available services and profiles**: Disable unnecessary Bluetooth services and profiles to minimize potential entry points for attackers.
	6. **Configure devices as non-discoverable except during pairing**: By making devices invisible to other Bluetooth devices except during the initial pairing process, you reduce the chances of unauthorized devices trying to connect.
	7. **Avoid Security Mode 1**: Security Mode 1 in Bluetooth refers to a mode with limited security features. It's recommended to use more secure modes to better protect data.
	8. **Enable mutual authentication**: Ensure that both devices involved in a Bluetooth connection authenticate each other to prevent impersonation attacks.
	9. **Set maximum allowable encryption key size**: Configure Bluetooth devices to use the maximum allowable size for encryption keys to enhance the security of data transmission.
- Geolocation methods
	- Tower Triangulation
	- GPS
	- Assisted GPS (A-GPS)
	- 802.11 (Wi-Fi)
- Permissions
	1. **Android Geolocation Permissions**: On Android devices, apps need permission to use geolocation features. This permission is requested through the app's manifest file and is granted by the user either during the app's installation (for older versions of Android up to version 6) or during runtime. The app can request either coarse (less precise) or fine (more precise) location using permissions like `ACCESS_COARSE_LOCATION` for cell triangulation or Wi-Fi and `ACCESS_FINE_LOCATION` for GPS.
	2. **iPhone Geolocation Permissions**: On iPhones, user approval is required every time an app that uses geolocation APIs is launched. When requesting location data, developers can specify the desired accuracy level using constants like `kCLLocationAccuracyBest`, `kCLLocationAccuracyNearestTenMeters`, etc.
- **Mobile Device Location Exposure**: Mobile devices inherently expose location data, even when turned on. They trust cellular networks and providers, which receive real-time location information every time the device connects to the network. This allows providers to track users. Moreover, location data can be obtained without provider cooperation using commercially available rogue base stations. These stations can trick devices into connecting to them, revealing real-time location data.
	- location exposure is bad for privacy 
-  **Storage of Location Data**: Location data is also stored on the mobile device itself. Past location information can be used to predict future locations. Websites can use techniques like browser fingerprinting, and Wi-Fi access points and Bluetooth sensors can reveal location information.
- **Location Services**: Mobile devices offer location services to apps, allowing them to access location data. Users can disable these services in the device settings, but this doesn't completely eliminate the risk of location exposure. Disabling location services limits app access to GPS and location data, but it doesn't prevent the operating system from using or communicating location data to the network.
- **GPS and Location Services**: Disabling location services doesn't turn off GPS, and it doesn't significantly reduce the risk of location exposure. Even without GPS or cellular data, a mobile device can still calculate location using Wi-Fi and/or Bluetooth. Apps and websites can also use other sensor data and web browser information to obtain or infer location information, sometimes without requiring explicit user permission.
- Other Apps and considerations
	1. **Even if you turn off cellular service on your phone, it can still be tracked**: Even when your phone's cellular service is off, it can still be located using Wi-Fi and Bluetooth signals. Special equipment can pick up these signals, measure their strength, and figure out where you are, even if you're not using Wi-Fi or Bluetooth at the moment.
	2. **Your phone's sensors can reveal your location**: Even if you turn off all wireless functions on your phone, like Wi-Fi and Bluetooth, the phone's sensors can still give away your location. For example, motion sensors or GPS can reveal where you are. And sometimes, even if you try to turn off Bluetooth completely, it might still be active without your knowledge.
	3. **Compromised phones can't be trusted**: If your phone has been hacked or compromised, you can't trust the settings or indicators that tell you whether wireless functions are on or off. A compromised phone might still be sending out your location data without your knowledge.
	4. **Other devices can also reveal your location**: It's not just phones that can give away your location. Things like fitness trackers, smart watches, medical devices, and smart home devices can all transmit wireless signals that reveal where you are. These devices often have weak security measures and can't always be turned off completely.
	5. **Cloud accounts can expose your location**: If your devices sync data to the cloud, that data could be accessed if the cloud account is hacked. So, even if you think your location data is safe on your device, it might still be at risk if it's stored in the cloud.
	6. **Apps can track your location**: Many apps ask for permission to access your location, even if it's not necessary for the app's function. This means they could be collecting and sharing your location data without your knowledge. Be careful about what information you share on social media too, as it could inadvertently reveal your location.
	7. **Be wary of pictures**: Pictures posted online can sometimes contain hidden location data, known as metadata. Even if you don't explicitly tag your location in a picture, it could still give away where you are through the content of the picture itself.
- ### Risks
	- The very feature that makes these services appealing—the ability to personalize software based on location—also makes them a*ttractive to various parties, including law enforcement, lawyers, and malicious individuals.*
	- When user location data is stored on remote servers and linked to individuals, it opens up new avenues for data theft. A **breach** of such sensitive information not only exposes personal and financial data but also reveals details about users' past locations, potentially spanning a considerable period. This not only violates user privacy but could also be exploited in legal proceedings.
	- Users of geolocation technologies should *consider several factors,* including whether the service has a privacy policy regarding location information, how long data is retained, under what circumstances it may be shared with law enforcement, third parties, or other users, and whether users have control over who can access their location.
	- Service providers that retain extensive location records expose themselves to various risks, including *negative publicity from data breaches, legal subpoenas, and potential misuse by allowing third parties to track individuals.* Often, retaining such data isn't essential for providing the required service functionality. Additionally, in many jurisdictions, there are legal obligations to adhere to privacy guidelines, such as informing users about who is tracking them, the purposes of data collection, and whether data will be shared with third parties.
- ### Best Practices
1. **Turn off Location Services**
2. **Manage Radios**: Turn off Bluetooth and Wi-Fi when you're not using them, and use Airplane Mode when your device is idle. 
3. **Limit App Permissions**: 
4. **Limit Advertising Permissions**: 
5. **Disable Tracking Settings**: 
6. **Minimize Web Browsing**: 
7. **Use a VPN**
8. **Minimize Cloud Storage**
9. **Use Precise Data Measurement**
10. **Discard Data**
11. **Keep Data Anonymous**
12. **Notify Users**
13. **Opt-in Model** Require explicit consent from users before using their geolocation data. Allow users to disable this feature and manually specify their location if possible.
14. **Have a Privacy Policy**: Be transparent.
15. **Know Local Laws**: 
# S18
- SMS is just message, MMS is SMS with media and audio. 
- #### Protocol Attacks
	- two subcategories. 
		- The first of these subcategories is **abusing legitimate functionality**. These attacks do not exploit a previously undiscovered flaw in the implementation of software on a target mobile phone, but rather misuse legitimate functionality purposely built into the mobile phone.
			- Voicemail notifications occur after a voicemail has been left for a mobile subscriber. Attacker can send SMS in the way to trick user that voicemail is sent by legitimate organization.
		- The second of these subcategories involves attempting to find **vulnerabilities in the implementations**
			- sending corrupted messages with false headers
			- length of message header can be changed to cause an error
- ### Attacks
	- ##### Battery-Draining Attack
		- tricking your phone into constantly staying connected to their server, which uses up a lot of battery power.
		- They send you a message that looks like a regular one, but it's actually designed to keep your phone connected to their server for as long as possible. 
	- ##### Silent Billing Attack
		- your mobile phone has some prepaid credits
		- goal is silently drain the credits
		- in MMS to send a whole message some background messages are sent that are not visible normally. 
		- those messages are inored, but are billed
		-  By bombarding the victim’s phone with any of the background messages not displayed to the victim/user (for example, a Send Confirmation), the attacker is able to rapidly wipe out the credit balance on the victim’s account.
	- ##### OTA Settings Attack
		- Over the air settings - getting updates or changes on your phone without having to physically do anything. 
		- Your phone company can send new stuff directly to your phone, like updates for your internet browser or even the basic software that runs your phone.
		- it can be abused
		- Attacker may send malicious browser settings to the phone
		- If they succeed, your phone could start sending all your internet traffic through their sneaky server instead of directly to the websites you want to visit. This means they could spy on what you're doing online or even mess with the websites you're trying to visit.
# S19
- Voice communication
	- packet switched - data sent using some packets like in internet network
	- circuit switched - signals 
	- VoIP is packet switched, and it is better
	- ![[voip.png|500]]
- VoIP Problems
	- Bandwidth Limitations
	- Security Concerns - more security less performance
	- IP Address Management
		- Mobile subscribers often change IP addresses as they move between areas, disrupting VoIP calls since current solutions rely on fixed IP addresses for call continuity.
- VoIP Signaling Protocols: 
	- SIP and H.323
		1. **SIP (Session Initiation Protocol)**:
		    - Simple, scalable, and extensible.
		    - Requires four packets to establish a call.
		    - Runs on UDP, offering simplicity and efficiency.
		2. **H.323**:
		    - Requires longer setup time, needing 12 packets for call setup.
		    - Uses both TCP and UDP during call setup.
		    - Provides session control for coordinating conferences.
		- **Advantages of SIP over H.323**:
			- **Efficiency**: SIP requires fewer packets for call setup compared to H.323.
			- **Protocol Usage**: SIP uses UDP for call setup, while H.323 utilizes both TCP and UDP. UDP offers lower protocol overhead but does not guarantee data delivery.
- Real-time protocol (RTP)
	- TCP requires resending if packet sent not properly. It increases time and overhead. 
	- RTP does not resend lost packets to avoid such inefficiency
	- Many VoIP implementations use RTP in addition to H.323
- SIP - establishing, modifying, and terminating calls in IP based communication system with QoS
	- User Agents - can be client (UAC) which makes SIP requests and server (UAS) which responds to them
	- **Network Server Types**: Proxy, Redirect, Registrar
	- **Proxy and Redirect Servers**: Accept registrations from users and can store user locations locally or in a dedicated location server.
	- **Registration**: Users must register with a SIP Registration Server (Registrar) when they come online, binding their ID with an IP address. Registrations are not permanent.
- H.323
	- This Standard facilitates real-time information transmission over packet-based networks without guaranteed quality of service.
	- H.323 supports five types of information streams: Audio, Video, Data, communications control data, and call control data.
	- Streams are transmitted and controlled using Real Time Transport Protocol (RTP) and Real Time Control Protocol (RTCP) over UDP.
- Comparison
	- H.323 v2: Based on RTP, involves TCP connection and call connection.
	- H.323 v3 and SIP: Support both TCP and UDP, simplifying call setup.
	- Tear down: H.323 uses RELEASE COMPLETE, while SIP uses BYE messages.
- QoS - Quality of Service for both protocols
	- **Jitter**: Non-uniform packet delays, often caused by low bandwidth. Controlled using routers and network elements supporting QoS.
	- **Packet Loss**: Result of excess latency or jitter, challenging to mitigate in real-time due to VoIP's time constraints, making TCP unreliable for retransmission.
- Security Issues in VoIP
	- security constraints increases bandwidth usage, leading to more latency and jitter, thus reducing overall Quality of Service (QoS).
	- Voice and data streams sharing limited bandwidth can lead to congestion, affecting VoIP traffic delivery within QoS time constraints.
	- **Potential Risks**:
		- **Signaling and Voice Data Attacks**: Attacks targeting integrity, confidentiality, authentication, or non-repudiation of transported data.
		- **Eavesdropping and Modification**: Sensitivity of audio payload data and signaling information to eavesdropping, jamming, and active modification.
		- **Competition Among Service Providers**: Challenges in maintaining security in an open environment with competition among service providers.
		- **Identity Compromise**: Compromising the identity of an end system or infrastructure component can lead to invasion of privacy, misuse of services, and potential routing of incoming calls to attackers.
- **Security Provided by H.323**
	- **Characteristics**:
	    - **Elliptic Curve Cryptography**
	    - **Advanced Encryption System (AES)**
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