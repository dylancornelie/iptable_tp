# reject inbound packets traceroutes from udp traceroute packet
iptables -A INPUT -p udp --dport 33434:33523 -j DROP

# reject inbound packets traceroutes from udp traceroute packet
iptables -A INPUT -p ICMP  -j DROP

