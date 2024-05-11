## Static
```ios
interface FastEthernet0/2
 switchport mode access
 switchport port-security
 switchport port-security mac-address 0001.43D9.0A54
```
## Sticky
```ios
interface FastEthernet0/2
 switchport mode access
 switchport port-security
 switchport port-security mac-address sticky 
```
## Dynamic
```ios
interface FastEthernet0/3
 switchport mode access
 switchport port-security
```
## Maximum 8
```ios
interface FastEthernet0/4
 switchport mode trunk
 switchport port-security
 switchport port-security maximum 8
```
