# Allowing IP Forward
sysctl -w net.ipv4.ip_forward=1
# or
# echo 1 > /proc/sys/net/ipv4/ip_forward
