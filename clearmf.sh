#!/bin/bash
# use clearmf.sh PASS USER NETWORK INITIAL_IP

pass=$1
user=$2
network=$3
ip=$4

if [ -z $1]; then
        pass=YOURPASS
fi
if [ -z $2]; then
        user=YOURUSER
fi
if [ -z $3]; then
        #Network
        network="10.100.7."
fi
if [ -z $4]; then
        #Initial IP
        ip=1
fi

while [ $ip -lt 255 ]; do
  #SSH connection and execution of desinfect.sh in GIT
        sshpass -p $pass ssh $user@$network$ip "wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect.sh | sh"
        i=`expr $ip + 1`
done
