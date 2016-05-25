iptables -A INPUT -p tcp -s 187.17.160.4 -j ACCEPT
route add -net 201.49.64.0 netmask 255.255.240.0 gw 10.100.140.1
route add -net 187.17.160.0 netmast 255.255.240.0 gw 10.100.140.1
