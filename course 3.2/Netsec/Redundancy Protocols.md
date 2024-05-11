# HSRP
```
R1
	\
	S0 - PC
	/
R0
```
Virtual IP - `192.168.1.1`

### R1
```ios
int gig 0/0/1
ip address 192.168.1.2 255.255.255.0
standby 1 ip 192.168.1.1 
standby 1 priority 105 
standby 1 preempt 
```

### R0
```ios
int gig 0/0/1
ip address 192.168.1.3 255.255.255.0
standby 1 ip 192.168.1.1 
standby 1 priority 120 
standby 1 preempt 
```

### To see config
```
show standby
show standby brief
```
### To track availibility of interface
```
standby 1 track fa 0/1
```