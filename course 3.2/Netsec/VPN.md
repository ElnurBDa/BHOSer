# GRE Tunnel
![[gre_vpn.png]]
R0 sees R3, but PC0 does not see PC1. After enabling VPN PCs will see each other through tunnel.
## R0
```
interface GigabitEthernet0/0/0
 ip address 192.168.1.1 255.255.255.0

interface GigabitEthernet0/0/1
 ip address 10.0.0.1 255.255.255.252

router ospf 1
 network 10.0.0.0 0.0.0.3 area 0


interface Tunnel1
 ip address 172.16.1.1 255.255.255.0
 tunnel source GigabitEthernet0/0/1
 tunnel destination 10.0.0.10

ip route 192.168.2.0 255.255.255.0 172.16.1.2 
```
## R1
```
interface GigabitEthernet0/0/0
 ip address 10.0.0.2 255.255.255.252

interface GigabitEthernet0/0/1
 ip address 10.0.0.5 255.255.255.252

router ospf 1
 network 10.0.0.0 0.0.0.3 area 0
 network 10.0.0.4 0.0.0.3 area 0
```
## R2
```
interface GigabitEthernet0/0/0
 ip address 10.0.0.6 255.255.255.252

interface GigabitEthernet0/0/1
 ip address 10.0.0.9 255.255.255.252

router ospf 1
 network 10.0.0.4 0.0.0.3 area 0
 network 10.0.0.8 0.0.0.3 area 0
```
## R3
```
interface GigabitEthernet0/0/0
 ip address 10.0.0.10 255.255.255.252

interface GigabitEthernet0/0/1
 ip address 192.168.2.1 255.255.255.0

router ospf 1
 network 10.0.0.8 0.0.0.3 area 0


interface Tunnel1
 ip address 172.16.1.2 255.255.255.0
 tunnel source GigabitEthernet0/0/0
 tunnel destination 10.0.0.1

ip route 192.168.1.0 255.255.255.0 172.16.1.1 
```
