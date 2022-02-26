# Setting the default gateway for the workstation
ip route add default via 192.168.2.1/24

# DROPING packet send with a specific user
# Not working with ping because always executing with root
# but working with lynx
iptables -A OUTPUT -o eth0 -m owner --uid-owner 999 -j MARK --set-mark 1
# iptables -A OUTPUT -o eth0 -m owner --uid-owner 998 -j MARK --set-mark 1
# iptables -A OUTPUT -o eth0 -m mark --mark 1 -j DROP
# iptables -t mangle -A POSTROUTING -o eth0 -m mark --mark 1 -j DSCP --set-dscp 1
iptables -t mangle -A POSTROUTING -o eth0 -m mark --mark 1 -j TOS --set-tos 3



