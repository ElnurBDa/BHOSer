# Topology
- `10.0.0.0/24` - routers
- `192.168.1.0/24` - network with Tacacs+
- `172.16.1.0/24` - network with DNS
- `200.0.0.0/24` - network with BHOS and GOOGLE servers
- Routing
- Port security sticky for access ports of switches
- Port security maximum between 2 switches
- Tacacs over ssh for all network devices

```ios
int eth 0/1/0
no sh
int fa 0/0
no sh
int fa 0/1
no sh
```
# IPs
## Routers ip
10.0.0.0/30
```ios
int fa 0/0
ip address 10.0.0.1 255.255.255.252
int fa 0/0
ip address 10.0.0.2 255.255.255.252
```

10.0.0.4/30
```ios
int fa 0/1
ip address 10.0.0.5 255.255.255.252
int fa 0/0
ip address 10.0.0.6 255.255.255.252
```

10.0.0.8/30
```ios
int fa 0/1
ip address 10.0.0.9 255.255.255.252
int fa 0/1
ip address 10.0.0.10 255.255.255.252
```
## Network with tacacs+ ip
- Gateway -> `192.168.1.1/24`
```ios
int eth 0/1/0 
ip address 192.168.1.1 255.255.255.0
```
- Tacacs+ -> `192.168.1.2/24`
- Others `192.168.1.3/24`+
## Network with DNS ip
- GW -> `172.16.1.1/24`
```ios
int eth 0/1/0 
ip address 172.16.1.1 255.255.255.0
```
- DNS -> `172.16.1.8/24`
- others -> `172.16.1.2`+
## Network with servers ip
- GW - `200.0.0.1/24`
```ios
int eth 0/1/0 
ip address 200.0.0.1 255.255.255.0
```
- BHOS - `200.0.0.2/24`
- Google - `200.0.0.3/24`
# OSPF
Router 1
```ios
router ospf 1
network 10.0.0.0 0.0.0.3 area 0
network 10.0.0.8 0.0.0.3 area 0
network 200.0.0.0 0.0.0.255 area 0
```
Router 2
```ios
router ospf 1
network 10.0.0.0 0.0.0.3 area 0
network 10.0.0.4 0.0.0.3 area 0
network 172.16.1.0 0.0.0.255 area 0
```
Router 3
```ios
router ospf 1
network 10.0.0.8 0.0.0.3 area 0
network 10.0.0.4 0.0.0.3 area 0
network 192.168.1.0 0.0.0.255 area 0
```
# Port Security
```ios
int fa0/0
switchport mode access
switchport port-security
```

```ios
int fa0/0
 switchport mode trunk
 switchport port-security
 switchport port-security maximum 8
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
