#/bin/sh

# activate forwarding
# FIXME: should move this into nftables
iptables -P FORWARD ACCEPT

# initialize bridge
brctl addbr tunit
ifconfig tunit 10.1.0.254 netmask 255.255.255.0 mtu 1450

service rsyslog start
service vtun start

tail -F /var/log/syslog

