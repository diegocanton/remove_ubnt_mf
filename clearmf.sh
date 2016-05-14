#!/bin/bash

pass=YOURPASS
user=YOURUSER
#Initial IP
ip=2

#Network
network="10.100.7."

while [ $ip -lt 255 ]; do
  #SSH connection and execution of desinfect.sh in GIT
	sshpass -p $pass ssh $user@$network$ip "https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect.sh | sh"
done
