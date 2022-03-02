# Setting the default gateway for the workstation
ip route add default via 192.168.2.1

iptables -t filter -F
iptables -t mangle -F

# DROPING packet send with a specific user
# Not working with ping because always executing with root
# but working with lynx
iptables -A OUTPUT -o eth0 -m owner --uid-owner 998 -j MARK --set-mark 2
iptables -A OUTPUT -o eth0 -m owner --uid-owner 0 -j MARK --set-mark 0
iptables -A OUTPUT -o eth0 -m owner --uid-owner 999 -j MARK --set-mark 1
# iptables -A OUTPUT -o eth0 -m owner --uid-owner 998 -j MARK --set-mark 2
# iptables -A OUTPUT -o eth0 -m mark --mark 2 -j DROP
# iptables -t mangle -A POSTROUTING -o eth0 -m mark --mark 2 -j DSCP --set-dscp 1
iptables -t mangle -A POSTROUTING -o eth0 -m mark --mark 2 -j TOS --set-tos 3



iptables -A OUTPUT -o eth0 -m mark --mark 0 -m limit --limit 1/min -j LOG --log-prefix "UID 0 : " --log-level 4
iptables -A OUTPUT -o eth0 -m mark --mark 1  -m limit --limit 1/min -j LOG --log-prefix "UID 999 : " --log-level 4
iptables -A OUTPUT -o eth0 -m mark --mark 2 -m limit --limit 1/min -j LOG --log-prefix "UID 998 : " --log-level 4

# Install syslog if not installed
apt-get install rsyslog 
# Start the service if not started
service rsyslog start

# Configure the log location
nano /etc/syslog.conf
# kern.warning          /var/log/iptables.log

