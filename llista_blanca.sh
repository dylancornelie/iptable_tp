# Creating a new chain to allow http requests
iptables -N ssh_chain

# workstation-n3 can access the router via ssh
iptables -A ssh_chain -s 192.168.2.33 -j ACCEPT
iptables -A ssh_chain -d 192.168.2.33 -j ACCEPT

# Deny all request that do not match
iptables -A ssh_chain -j DROP
