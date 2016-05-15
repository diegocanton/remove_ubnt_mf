#!/bin/bash
# use clearmf.sh PASS USER NETWORK INITIAL_IP
# use ./clearmf.sh fucker mother 10.0.0 1
# Use in clearmf_net.sh 
#/opt/remove_ubnt_mf/clearmf.sh fucker mother 10.0.0 1
#/opt/remove_ubnt_mf/clearmf.sh fucker mother 10.0.1 1

pass=$1
user=$2
network=$3
ip=$4

if [ -z $1]; then
        #YOURPASS / Vírus PASS default
        pass=fucker
fi
if [ -z $2]; then
        #YOURUSER / Vírus USER default
        user=mother
fi
if [ -z $3]; then
        #Network
        network="10.0.0"
fi
if [ -z $4]; then
        #Initial IP
        ip=1
fi

while [ $ip -lt 255 ]; do
  #SSH connection and execution of desinfect.sh in GIT
        #Only remove
        #sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$network.$ip "wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect.sh | sh"
        
        #Only upgrade
        #sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$network.$ip "wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/upgrade.sh | sh"
        
        # Remove and upgrade - Default Option
        sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$network.$ip "wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect_upgrade.sh | sh"
        ip=`expr $ip + 1`
done
