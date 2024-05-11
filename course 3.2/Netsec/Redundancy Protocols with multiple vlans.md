```
172.16.0.0/26
PC | GW | GW2 | GW3| Vlan
4  | 1  | 2   | 3  | 10
12 | 9  | 10  | 11 | 20
20 | 17 | 18  | 19 | 30
28 | 25 | 26  | 27 | 40
/29
255.255.255.248

```
Change GW2 to GW3 and priority for next router
```
int eth0/1/0.10
encapsulation dot1Q 10
ip add 172.16.0.3 255.255.255.248
standby 172.16.0.1
standby 1 priority 101
standby 1 preempt

int eth0/1/0.20
encapsulation dot1Q 20
ip add 172.16.0.11 255.255.255.248
standby 1 ip 172.16.0.9 
standby 1 priority 101
standby 1 preempt

int eth0/1/0.30
encapsulation dot1Q 30
ip add 172.16.0.19 255.255.255.248
standby 1 ip 172.16.0.17
standby 1 priority 101 
standby 1 preempt

int eth0/1/0.40
encapsulation dot1Q 40
ip add 172.16.0.27 255.255.255.248
standby 1 ip 172.16.0.25
standby 1 priority 101
standby 1 preempt
```

on each router
```
ip route 172.16.0.0  255.255.255.248 172.16.0.1
ip route 172.16.0.8  255.255.255.248 172.16.0.9
ip route 172.16.0.16 255.255.255.248 172.16.0.17
ip route 172.16.0.24 255.255.255.248 172.16.0.25

```