# Old Knowledge
## Switch
### Switch 1
```ios
lldp run
!
spanning-tree mode pvst
spanning-tree extend system-id
spanning-tree vlan 10 priority 24576
!
interface FastEthernet0/1
 switchport trunk allowed vlan 10,20
 switchport mode trunk
!
interface FastEthernet0/2
 switchport trunk allowed vlan 10,20
 switchport mode trunk
!
interface FastEthernet0/3
 switchport access vlan 10
 no lldp receive
 no lldp transmit
 switchport mode access
 no cdp enable
!
```
### Switch 2
```
lldp run
!
spanning-tree mode pvst
spanning-tree extend system-id
spanning-tree vlan 20 priority 24576
!
interface FastEthernet0/1
 switchport trunk allowed vlan 10,20
 switchport mode trunk
!
interface FastEthernet0/2
 switchport trunk allowed vlan 10,20
 switchport mode trunk
!
interface FastEthernet0/3
 switchport access vlan 20
 no lldp receive
 no lldp transmit
 switchport mode access
 no cdp enable
!
```
### Switch 3
```ios
lldp run
!
spanning-tree mode pvst
spanning-tree extend system-id
!
interface FastEthernet0/1
 switchport trunk allowed vlan 10,20
 switchport mode trunk
!
interface FastEthernet0/2
 switchport trunk allowed vlan 10,20
 switchport mode trunk
!
interface FastEthernet0/3
 switchport trunk allowed vlan 10,20
 switchport mode trunk
!
```
### Multilayer Switch
```ios
lldp run
!
spanning-tree mode pvst
!
interface FastEthernet0/1
 no lldp receive
 no lldp transmit
 switchport access vlan 10
 switchport mode access
 no cdp enable
!
interface FastEthernet0/2
 no lldp receive
 no lldp transmit
 switchport access vlan 20
 switchport mode access
!
interface FastEthernet0/3
 switchport trunk allowed vlan 10,20
 switchport trunk encapsulation dot1q
 switchport mode trunk
```
## Router
## Router 1
```ios

!
lldp run
!
spanning-tree mode pvst
!
interface FastEthernet0/0
 ip address 10.0.0.13 255.255.255.252
 duplex auto
 speed auto
!
interface FastEthernet0/1
 ip address 10.0.0.10 255.255.255.252
 duplex auto
 speed auto
!
interface Ethernet0/0/0
 no ip address
 duplex auto
 speed auto
!
interface Ethernet0/0/0.10
 encapsulation dot1Q 10
 ip address 172.16.1.129 255.255.255.252
!
interface Ethernet0/0/0.20
 encapsulation dot1Q 20
 ip address 172.16.1.133 255.255.255.252
!
interface Ethernet0/1/0
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Vlan1
 no ip address
 shutdown
!
router ospf 1
 log-adjacency-changes
 network 10.0.0.8 0.0.0.3 area 0
 network 10.0.0.12 0.0.0.3 area 0
 network 172.16.1.128 0.0.0.3 area 0
 network 172.16.1.132 0.0.0.3 area 0
!
```
### Router 2
```ios
lldp run
!
spanning-tree mode pvst
!
interface FastEthernet0/0
 ip address 10.0.0.6 255.255.255.252
 duplex auto
 speed auto
!
interface FastEthernet0/1
 ip address 10.0.0.9 255.255.255.252
 duplex auto
 speed auto
!
interface Ethernet0/0/0
 no ip address
 duplex auto
 speed auto
 shutdown
!
interface Ethernet0/1/0
 no ip address
 duplex auto
 speed auto
!
interface Ethernet0/1/0.10
 encapsulation dot1Q 10
 ip address 172.16.1.137 255.255.255.252
!
interface Ethernet0/1/0.20
 encapsulation dot1Q 20
 ip address 172.16.1.141 255.255.255.252
!
interface Vlan1
 no ip address
 shutdown
!
router ospf 1
 log-adjacency-changes
 network 10.0.0.4 0.0.0.3 area 0
 network 10.0.0.8 0.0.0.3 area 0
 network 172.16.1.136 0.0.0.3 area 0
 network 172.16.1.140 0.0.0.3 area 0
!
```
# Router ip route
```ios
ip route <Network to route> <its network mask> <interface to route through>
```
## Servers
### Web Server
- give IP things
### DNS Server 
- give IP things
- configure DNS service
- add record (name-IP)
### DHCP
- give IP things
- configure DHCP service
## Wireless
- Lapt gets adapter
- WLC gets IP things
- login into WLC (errors may arise from using http or https)
# CDP and LLDP
```ios
show cdp neighbors 
show cdp neighbors detail 
no cdp run
no cdp enable

lldp run
show lldp neighbors 
show lldp neighbors detail
no lldp transmit
no lldp receive
```
