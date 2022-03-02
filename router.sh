# All the packet to port 80 or port 443 are redirected to the http_chain
iptables -A INPUT -p tcp --dport 80 -j http_chain
iptables -A INPUT -p tcp --dport 443 -j http_chain

# All the packet to port 22 (outgoing and incoming) are redirected to the ssh_chain
iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ssh_chain
iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ssh_chain

#change source ip of workstation to 192.168.1.2 when a packet hit the router
iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -j SNAT --to-source 192.168.1.2

# Droping all packet to be forwarded with a tos value equal to 3 (not a standard value can not conflict with standard value)
iptables -t filter -A FORWARD -m tos --tos 0x3 -j REJECT
