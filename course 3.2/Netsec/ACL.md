# Basic ACL
only IPs. N is between 1 and 100.
```
access-list <N> <permit/deny> <source-IP-of-single-host>
access-list <N> <permit/deny> <source-Network-IP> <wildcard>
```
# Enable ACL on interface
```
int <interface>
ip access-group <N> <in/out>
```
# Class work Example
in a router
```
access-list 1 permit host 10.1.1.2
access-list 1 deny 10.1.1.0 0.0.0.255
access-list 1 permit 10.0.0.0 0.255.255.255

interface FastEthernet0/0
 ip address 10.0.0.2 255.255.255.252
 ip access-group 1 in
```
# Extended ACL
checks other parts of packet. N is between 100 and 199.
```
access-list <N> <permit/deny> <protocol> <source-IP> <wildcard> <dest-IP> <wildcard> <dest-port>

access-list <N> <permit/deny> <protocol> <source-IP> <wildcard> <source-port> <dest-IP> <wildcard> 

access-list <N> permit ip any any
```
# Class work Example
```
interface FastEthernet0/1
 ip address 10.0.0.1 255.255.255.252
 ip access-group 111 in

interface Ethernet0/1/0
 ip address 10.0.0.5 255.255.255.252
 ip access-group 111 in

access-list 101 remark super text
access-list 101 deny tcp host 172.16.3.10 172.16.1.0 0.0.0.255 eq ftp
access-list 101 deny tcp host 172.16.2.10 host 172.16.1.100 eq www
access-list 101 permit ip any any
```
