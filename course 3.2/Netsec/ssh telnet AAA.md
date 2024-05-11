# Telnet
```ios
username admin password admin
enable password admin

line vty 0 4
	login local
	transport input all
```
# SSH
```ios
hostname R0
ip domain-name mydomain
crypto key generate rsa
	1024
ip ssh version 2
```
# Tacacs+
![[aaa.png]]
configuration of router with tacacs enabled
```ios
!
version 15.1
no service timestamps log datetime msec
no service timestamps debug datetime msec
no service password-encryption
!
hostname R2
!
enable password admin
!
aaa new-model
aaa authentication login default group tacacs+ local 
aaa authentication enable default group tacacs+ local 
aaa authorization exec default group tacacs+ local
aaa accounting exec default start-stop group tacacs+
!
ip cef
no ipv6 cef
!
username admin password 0 admin
!
license udi pid CISCO1941/K9 sn FTX1524F63S-
!
ip ssh version 2
ip domain-name bhos.az
!
spanning-tree mode pvst
!
interface GigabitEthernet0/0
 ip address 192.168.1.10 255.255.255.0
 duplex auto
 speed auto
!
interface GigabitEthernet0/1
 ip address 10.0.0.1 255.255.255.0
 duplex auto
 speed auto
!
interface Vlan1
 ip address 10.0.1.3 255.255.255.0
 shutdown
!
ip classless
ip route 172.16.1.0 255.255.255.0 10.0.0.2 
!
ip flow-export version 9
!
tacacs-server host 172.16.1.10 key 1234
!
line con 0
!
line aux 0
!
line vty 0 4
 login authentication default
 accounting exec default
!
end
```
# Tacacs
## Routers
```ios
hostname R0
enable password admin
username admin password admin

line vty 0 4
	login local
	transport input all
exit

ip ssh version 2
ip domain-name somedomain
crypto key generate rsa
	1024

line vty 0 4
	login authentication default
	accounting exec default
exit

aaa new-model
aaa authentication login default group tacacs+ local 
aaa authentication enable default group tacacs+ local 
aaa authorization exec default group tacacs+ local
aaa accounting exec default start-stop group tacacs+

tacacs-server host 192.168.1.2 key 1234
```
## Switches
```ios
hostname S0
ip default-gateway 200.0.0.1
int vlan 1
ip address 200.0.0.10 255.255.255.0
no sh
```

```ios
enable password admin
username admin password admin

line vty 0 4
	login local
	transport input all
exit

ip ssh version 2
ip domain-name somedomain
crypto key generate rsa
	1024

line vty 0 4
	login authentication default
	accounting exec default
exit

aaa new-model
aaa authentication login default group tacacs+ local 
aaa authentication enable default group tacacs+ local 
aaa authorization exec default group tacacs+ local
aaa accounting exec default start-stop group tacacs+

tacacs-server host 192.168.1.2 key 1234
```
and go to Tacacs server and add client
