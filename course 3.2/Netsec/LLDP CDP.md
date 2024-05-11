```ios
lldp run
cdp run

show cdp  neighbors 
show lldp neighbors
```

# Or
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
# but we need
on every device
```
lldp run
cdp run
```

on device interface that S-PC
```
no lldp transmit
no lldp receive
no cdp enable
```