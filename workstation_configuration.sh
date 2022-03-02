# Setting the default gateway for the workstation
ip route add default via 192.168.2.1

# Install syslog if not installed
apt-get install rsyslog 
# Start the service if not started
service rsyslog start

# install ssh server
apt-get install openssh-server -y

# Active ssh service
service ssh start

# Configure the log location
# add the following after #RULES : kern.warning          /var/log/iptables.log
nano /etc/syslog.conf
