#/bin/sh

# activate forwarding
# XXX: now handled in host and also using nftables 
#iptables -P FORWARD ACCEPT

# initialize bridge
# XXX: Bridge is now initialized in host via docker network command
#brctl addbr tunit
#ifconfig tunit 10.1.0.254 netmask 255.255.255.0 mtu 1450

service rsyslog start
service vtun start

tail -F /var/log/syslog

