![[proj task.png]]
8. SSH

![[proj topology.png]]
# no sh
```
en
conf t
int fa0/0
no sh
int fa0/1
no sh
int eth0/0/0
no sh
int eth0/1/0
no sh
```
# VLANS
## Switches
```
vlan 10
vlan 20
vlan 30
vlan 40
```
For access
```bash
switchport mode access
switchport access vlan <N>
```
For Trunc
```
switchport mode trunc
switchport trunk allowed vlan <N>,<N>
```
## Router
```
interface Ethernet0/0/0.10
 encapsulation dot1Q 10
 ip address 200.0.0.1 255.255.255.252

interface Ethernet0/0/0.20
 encapsulation dot1Q 20
 ip address 201.0.0.1 255.255.255.252
```
# VPN
IP Nerwork `210.0.0.0/24`

### Tunnel1 - 210.0.0.0/30
`.18-.33`
Left
```
interface Tunnel1
 ip address 210.0.0.1 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.33

ip route 200.0.0.0 255.255.255.252 210.0.0.2
ip route 201.0.0.0 255.255.255.252 210.0.0.2
```
Right
```
interface Tunnel1
 ip address 210.0.0.2 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.18

ip route 172.16.0.0 255.255.255.248 210.0.0.1
ip route 172.16.0.8 255.255.255.248 210.0.0.1
ip route 172.16.0.16 255.255.255.248 210.0.0.1
ip route 172.16.0.24 255.255.255.248 210.0.0.1
```
### Tunnel2 - 210.0.0.4/30
`.22-.37`
Left
```
interface Tunnel2
 ip address 210.0.0.5 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.37

ip route 200.0.0.0 255.255.255.252 210.0.0.6
ip route 201.0.0.0 255.255.255.252 210.0.0.6
```
Right
```
interface Tunnel2
 ip address 210.0.0.6 255.255.255.252
 tunnel source fa0/1
 tunnel destination 10.0.0.22

ip route 172.16.0.0 255.255.255.248 210.0.0.5
ip route 172.16.0.8 255.255.255.248 210.0.0.5
ip route 172.16.0.16 255.255.255.248 210.0.0.5
ip route 172.16.0.24 255.255.255.248 210.0.0.5
```
# Redundancy
## 172.16.0.0/29 - v30
PC - 172.16.0.4
### Router Up
```
interface Fa0/1.30
encapsulation dot1Q 30
ip address 172.16.0.2 255.255.255.248
standby 1 ip 172.16.0.1
standby 1 priority 200
standby 1 preempt 
```
### Router Down
```
interface Fa0/1.30
encapsulation dot1Q 30
ip address 172.16.0.3 255.255.255.248
standby 1 ip 172.16.0.1
standby 1 priority 150
standby 1 preempt 
```

## 172.16.0.8/29 - v40
PC - 172.16.0.12
### Router Up
```
interface Fa0/1.40
encapsulation dot1Q 40
ip address 172.16.0.10 255.255.255.248
standby 1 ip 172.16.0.9
standby 1 priority 200
standby 1 preempt 
```
### Router Down
```
interface Fa0/1.40
encapsulation dot1Q 40
ip address 172.16.0.11 255.255.255.248
standby 1 ip 172.16.0.9
standby 1 priority 150
standby 1 preempt 
```
## 172.16.0.16/29 - v50
PC - 172.16.0.20
### Router Up
```
interface Fa0/1.50
encapsulation dot1Q 50
ip address 172.16.0.18 255.255.255.248
standby 1 ip 172.16.0.17
standby 1 priority 200
standby 1 preempt 
```
### Router Down
```
interface Fa0/1.50
encapsulation dot1Q 50
ip address 172.16.0.19 255.255.255.248
standby 1 ip 172.16.0.17
standby 1 priority 150
standby 1 preempt 
```
## 172.16.0.24/29 - v60
PC - 172.16.0.28
### Router Up
```
interface Fa0/1.60
encapsulation dot1Q 60
ip address 172.16.0.26 255.255.255.248
standby 1 ip 172.16.0.25
standby 1 priority 200
standby 1 preempt 
```
### Router Down
```
interface Fa0/1.60
encapsulation dot1Q 60
ip address 172.16.0.27 255.255.255.248
standby 1 ip 172.16.0.25
standby 1 priority 150
standby 1 preempt 
```
# SSH
## Router
```
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

```
## Switch
```
en
conf t

hostname S2
ip default-gateway 172.16.0.1
int vlan 60
ip address 172.16.0.29 255.255.255.0
no sh

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


```
# port sec
```
interface FastEthernet0/3
 switchport mode access
 switchport port-security
 switchport port-security mac-address 0001.43D9.0A54
	```