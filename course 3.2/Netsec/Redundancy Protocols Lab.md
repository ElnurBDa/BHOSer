# Task
![[redund_lab.png]]
- `10.0.0.0/24` for router interconnections in center
- `192.168.1.0/24` for left network
- `172.16.1.0/24` for right network
- HSRP for two edge routers on left and right (separately)
- `213.16.1.0/25` for left network and router interconnections
- `213.16.1.128/25` for right network and router interconnections
- `11.1.1.0/30` for VPN tunnel between left and right network
- ssh for routers and switches
- DNS-BHOS
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
# Redundancy
### left
```
ip address 192.168.1.2 255.255.255.0
standby 1 ip 192.168.1.1 
standby 1 priority 100
standby 1 preempt 
```

```
ip address 192.168.1.3 255.255.255.0
standby 1 ip 192.168.1.1 
standby 1 priority 150
standby 1 preempt 
```
### right
```
ip address 172.16.1.2 255.255.255.0
standby 1 ip 172.16.1.1 
standby 1 priority 100
standby 1 preempt 
```

```
ip address 172.16.1.3 255.255.255.0
standby 1 ip 172.16.1.1 
standby 1 priority 150
standby 1 preempt 
```
# OSPF
```
router ospf 1
 network 10.0.0.0 0.0.0.3 area 0
 network 10.0.0.20 0.0.0.3 area 0
 network 213.16.1.12 0.0.0.3 area 0
 network 213.16.1.0 0.0.0.3 area 0
```

```
router ospf 1
 network 213.16.1.16 0.0.0.3 area 0
 network 10.0.0.8 0.0.0.3 area 0
 network 213.16.1.12 0.0.0.3 area 0
 network 213.16.1.4 0.0.0.3 area 0
```

```
router ospf 1
 network 10.0.0.0 0.0.0.3 area 0
 network 213.16.1.16 0.0.0.3 area 0
 network 10.0.0.4 0.0.0.3 area 0
 network 213.16.1.128 0.0.0.3 area 0
```

```
router ospf 1
 network 10.0.0.4 0.0.0.3 area 0
 network 10.0.0.20 0.0.0.3 area 0
 network 10.0.0.8 0.0.0.3 area 0
 network 213.16.1.132 0.0.0.3 area 0
```

```
router ospf 1
 network 213.16.1.0 0.0.0.3 area 0

router ospf 1
 network 213.16.1.4 0.0.0.3 area 0
 
router ospf 1
 network 213.16.1.128 0.0.0.3 area 0
 
router ospf 1
 network 213.16.1.132 0.0.0.3 area 0
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

hostname S3
ip default-gateway 172.16.1.1
int vlan 1
ip address 172.16.1.51 255.255.255.0
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
# VPN
### Networks to connect:
- 1 - `192.168.1.0/24` - `213.16.1.1/30`
- 2 - `192.168.1.0/24` - `213.16.1.5/30`
- 3 - `172.16.1.0/24` - `213.16.1.129/30`
- 4 - `172.16.1.0/24` - `213.16.1.133/30`
### Network for tunneling:
- Tunnel14 `11.1.1.0/30`
	- 1 - `11.1.1.1/30`
	- 4 - `11.1.1.2/30`
- Tunnel24 `11.1.1.4/30`
	- 2 - `11.1.1.5/30`
	- 4 - `11.1.1.6/30`
- Tunnel23 `11.1.1.16/30`
	- 2 - `11.1.1.17/30`
	- 3 - `11.1.1.18/30`
- Tunnel13 `11.1.1.20/30`
	- 1 - `11.1.1.21/30`
	- 3 - `11.1.1.22/30`
### Tunnel14
1
```
interface Tunnel14
 ip address 11.1.1.1 255.255.255.252
 tunnel source fa0/0
 tunnel destination 213.16.1.133

ip route 172.16.1.0 255.255.255.0 11.1.1.2
```
4
```
interface Tunnel14
 ip address 11.1.1.2 255.255.255.252
 tunnel source fa0/0
 tunnel destination 213.16.1.1

ip route 192.168.1.0 255.255.255.0 11.1.1.1
```
### Tunnel24
2
```
interface Tunnel24
 ip address 11.1.1.5 255.255.255.252
 tunnel source fa0/0
 tunnel destination 213.16.1.133

ip route 172.16.1.0 255.255.255.0 11.1.1.6
```
4
```
interface Tunnel24
 ip address 11.1.1.6 255.255.255.252
 tunnel source fa0/0
 tunnel destination 213.16.1.5

ip route 192.168.1.0 255.255.255.0 11.1.1.5
```
### Tunnel23
2
```
interface Tunnel23
 ip address 11.1.1.17 255.255.255.252
 tunnel source fa0/0
 tunnel destination 213.16.1.129

ip route 172.16.1.0 255.255.255.0 11.1.1.18
```
3
```
interface Tunnel23
 ip address 11.1.1.18 255.255.255.252
 tunnel source fa0/0
 tunnel destination 213.16.1.5

ip route 192.168.1.0 255.255.255.0 11.1.1.17
```
### Tunnel13
1
```
interface Tunnel13
 ip address 11.1.1.21 255.255.255.252
 tunnel source fa0/0
 tunnel destination 213.16.1.129

ip route 172.16.1.0 255.255.255.0 11.1.1.22
```
3
```
interface Tunnel13
 ip address 11.1.1.22 255.255.255.252
 tunnel source fa0/0
 tunnel destination 213.16.1.1

ip route 192.168.1.0 255.255.255.0 11.1.1.21
```
# PoC
![[redundancy lab poc.png]]
