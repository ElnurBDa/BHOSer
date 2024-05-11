![[VPN lab task.png]]
![[vpn lab topology.png]]
> [!important] red is VPN connections
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
# ips in central 4 router
```
int fa0/0
ip address 10.0.0.2 255.255.255.252
int fa0/1
ip address 10.0.0.5 255.255.255.252
int eth0/0/0
ip address 10.0.0.17 255.255.255.252
int eth0/1/0
ip address 10.0.0.13 255.255.255.252
```

```
int fa0/0
ip address 10.0.0.10 255.255.255.252
int fa0/1
ip address 10.0.0.6 255.255.255.252
int eth0/0/0
ip address 10.0.0.25 255.255.255.252
int eth0/1/0
ip address 10.0.0.21 255.255.255.252
```

```
int fa0/0
ip address 10.0.0.38 255.255.255.252
int fa0/1
ip address 10.0.0.33 255.255.255.252
int eth0/0/0
ip address 10.0.0.26 255.255.255.252
int eth0/1/0
ip address 10.0.0.18 255.255.255.252
```

```
int fa0/0
ip address 10.0.0.30 255.255.255.252
int fa0/1
ip address 10.0.0.34 255.255.255.252
int eth0/0/0
ip address 10.0.0.14 255.255.255.252
int eth0/1/0
ip address 10.0.0.22 255.255.255.252
```
# ospf
```
router ospf 1
 network 10.0.0.0 0.0.0.3 area 0
 network 10.0.0.4 0.0.0.3 area 0
 network 10.0.0.12 0.0.0.3 area 0
 network 10.0.0.16 0.0.0.3 area 0
```

```
router ospf 1
 network 10.0.0.8 0.0.0.3 area 0
 network 10.0.0.4 0.0.0.3 area 0
 network 10.0.0.20 0.0.0.3 area 0
 network 10.0.0.24 0.0.0.3 area 0
```

```
router ospf 1
 network 10.0.0.12 0.0.0.3 area 0
 network 10.0.0.32 0.0.0.3 area 0
 network 10.0.0.28 0.0.0.3 area 0
 network 10.0.0.24 0.0.0.3 area 0
```

```
router ospf 1
 network 10.0.0.24 0.0.0.3 area 0
 network 10.0.0.32 0.0.0.3 area 0
 network 10.0.0.16 0.0.0.3 area 0
 network 10.0.0.36 0.0.0.3 area 0
```

```
router ospf 1
 network 10.0.0.0 0.0.0.3 area 0
```
# VPN
Networks to connect:
- 1 - `192.168.1.0/24` - `10.0.0.1`
- 2 - `192.168.2.0/24` - `10.0.0.29`
- 3 - `192.168.3.0/24` - `10.0.0.9`
- 4 - `172.16.1.0/26` - `10.0.0.37`
Network for tunneling:
- Tunnel14 `120.1.1.0/30`
	- 1 - `120.1.1.1/30`
	- 4 - `120.1.1.2/30`
- Tunnel24 `120.1.1.4/30`
	- 2 - `120.1.1.5/30`
	- 4 - `120.1.1.6/30`
- Tunnel34 `120.1.1.8/30`
	- 3 - `120.1.1.9/30`
	- 4 - `120.1.1.10/30`
- Tunnel12 `120.1.1.12/30`
	- 1 - `120.1.1.13/30`
	- 2 - `120.1.1.14/30`
- Tunnel23 `120.1.1.16/30`
	- 2 - `120.1.1.17/30`
	- 3 - `120.1.1.18/30`
- Tunnel13 `120.1.1.20/30`
	- 1 - `120.1.1.21/30`
	- 3 - `120.1.1.22/30`

### Tunnel14
1
```
interface Tunnel14
 ip address 120.1.1.1 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.37

ip route 172.16.1.0 255.255.255.192 120.1.1.2
```
4
```
interface Tunnel14
 ip address 120.1.1.2 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.1

ip route 192.168.1.0 255.255.255.0 120.1.1.1
```
### Tunnel24
2
```
interface Tunnel24
 ip address 120.1.1.5 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.37

ip route 172.16.1.0 255.255.255.192 120.1.1.6
```
4
```
interface Tunnel24
 ip address 120.1.1.6 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.29

ip route 192.168.2.0 255.255.255.0 120.1.1.5
```
### Tunnel34
3
```
interface Tunnel34
 ip address 120.1.1.9 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.37

ip route 172.16.1.0 255.255.255.192 120.1.1.10
```
4
```
interface Tunnel34
 ip address 120.1.1.10 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.9

ip route 192.168.3.0 255.255.255.0 120.1.1.9
```
### Tunnel12
1
```
interface Tunnel12
 ip address 120.1.1.13 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.29

ip route 192.168.2.0 255.255.255.0 120.1.1.14
```
2
```
interface Tunnel12
 ip address 120.1.1.14 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.1

ip route 192.168.1.0 255.255.255.0 120.1.1.13
```
### Tunnel23
2
```
interface Tunnel23
 ip address 120.1.1.17 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.9

ip route 192.168.3.0 255.255.255.0 120.1.1.18
```
3
```
interface Tunnel23
 ip address 120.1.1.18 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.29

ip route 192.168.2.0 255.255.255.0 120.1.1.17
```
### Tunnel13
1
```
interface Tunnel13
 ip address 120.1.1.21 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.9

ip route 192.168.3.0 255.255.255.0 120.1.1.22
```
3
```
interface Tunnel13
 ip address 120.1.1.22 255.255.255.252
 tunnel source fa0/0
 tunnel destination 10.0.0.1

ip route 192.168.1.0 255.255.255.0 120.1.1.21
```
# Port Security
```
interface FastEthernet0/1
 switchport mode trunk
 switchport port-security
 switchport port-security maximum 2
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
ip address 172.16.1.10 255.255.255.0
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
