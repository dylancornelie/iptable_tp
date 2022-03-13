# Allowing ftp connection to ftp.rediris.es
iptables -A FORWARD -p tcp -d 130.206.13.2 -s 192.168.2.0/24 --dport 20 -j ACCEPT
iptables -A FORWARD -p tcp -d 130.206.13.2 -s 192.168.2.0/24 --dport 21 -j ACCEPT

iptables -A FORWARD -d 158.109.79.0/24 -s 192.168.2.0/24 -j ACCEPT

iptables -A FORWARD -s 192.168.2.0/24 -j REJECT
