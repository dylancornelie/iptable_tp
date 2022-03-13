# Creating a new chain to allow http requests
iptables -N http_chain

# workstation-n3 can not access the http server
iptables -A http_chain -s 192.168.2.33 -j REJECT


