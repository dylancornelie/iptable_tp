# Allowing IP Forward
sysctl -w net.ipv4.ip_forward=1
# or
# echo 1 > /proc/sys/net/ipv4/ip_forward

#Set the default policy for INPUT, FORWARD & OUTPUT chains to DROP instead of ACCEPT
# iptables -t filter --policy INPUT DROP
# iptables -t filter --policy FORWARD DROP
# iptables -t filter --policy OUTPUT DROP

#Flush rules
iptables -t filter -F
iptables -t nat -F

#Accept incomming SSH connection
# iptables -A INPUT -p tcp --dport 22 -m state --state NEW,ESTABLISHED -j ACCEPT
# iptables -A OUTPUT -p tcp --sport 22 -m state --state ESTABLISHED -j ACCEPT

#Forwarding packet from 192.168.1.0/24 

#change source ip of workstation to 192.168.1.2 when a packet hit the router
iptables -t nat -A POSTROUTING -s 192.168.2.0/24 -j SNAT --to-source 192.168.1.2

# Droping all packet to be forwarded with a tos value equal to 3 (not a standard value can not conflict with standard value)
iptables -t filter -A FORWARD -m tos --tos 0x3 -j REJECT
