# Flush all the rules
iptables -t filter -F
iptables -t mangle -F

iptables -A OUTPUT -o eth0 -m owner --uid-owner 998 -j MARK --set-mark 2
iptables -A OUTPUT -o eth0 -m owner --uid-owner 0 -j MARK --set-mark 0
iptables -A OUTPUT -o eth0 -m owner --uid-owner 999 -j MARK --set-mark 1

iptables -A OUTPUT -o eth0 -m mark --mark 0 -m limit --limit 1/min -j LOG --log-prefix "UID 0 : " --log-level 4
iptables -A OUTPUT -o eth0 -m mark --mark 1  -m limit --limit 1/min -j LOG --log-prefix "UID 999 : " --log-level 4
iptables -A OUTPUT -o eth0 -m mark --mark 2 -m limit --limit 1/min -j LOG --log-prefix "UID 998 : " --log-level 4

iptables -t mangle -A POSTROUTING -o eth0 -m mark --mark 2 -j TOS --set-tos 3
