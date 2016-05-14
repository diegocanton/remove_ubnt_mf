#!/bin/bash
# use clearmf.sh PASS USER NETWORK INITIAL_IP

if ["$1"]; then
	pass=YOURPASS
fi
if ["$2"]; then
	user=YOURUSER
fi
if ["$3"]; then
	#Network
	network="10.100.7."
fi
if ["$4"]; then
	#Initial IP
	ip=1
fi

while [ $ip -lt 255 ]; do
  #SSH connection and execution of desinfect.sh in GIT
	sshpass -p $pass ssh $user@$network$ip "wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect.sh | sh"
done
