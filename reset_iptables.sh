#Flush rules
iptables -t filter -F
iptables -t nat -F
iptables -t mangle -F