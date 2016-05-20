#!/bin/bash
# use clearmf.sh PASS USER NETWORK INITIAL_IP LAST_IP
# use ./clearmf.sh fucker mother 10.0.0 1
# Use in clearmf_net.sh
#/opt/remove_ubnt_mf/clearmf.sh fucker mother 10.0.0 1 254
#/opt/remove_ubnt_mf/clearmf.sh fucker mother 10.0.1 1 254
# Runs all IPs in parallel, remove "&" the end of `sshpath` lines to disable
# Collaboration: Joshua Clark (Git User Zanix) - log option and last IP range

pass=$1
user=$2
network=$3
ip=$4
lastip=$5

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
if [ -z $5]; then
        #Last IP
        lastip=254
fi

# Create log
log_dir=clearmf_$network.$ip-$lastip
mkdir $log_dir

# Increment lastip for loop
lastip=$((lastip+1))

while [ $ip -lt $lastip ]; do
        #SSH connection and execution of desinfect.sh in GIT
        echo "$network.$ip" > $log_dir/$network.$ip.log

        #Only remove
        sshpass -p $pass ssh -o UserKnownHostsFile=/dev/null -o ConnectTimeout=10 -o StrictHostKeyChecking=no $user@$network.$ip "trigger_url https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/disinfect.sh | sh" >> $log_dir/$network.$ip.log 2>&1 &

        #Only upgrade
        #sshpass -p $pass ssh -o UserKnownHostsFile=/dev/null -o ConnectTimeout=10 -o StrictHostKeyChecking=no $user@$network.$ip "trigger_url https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/upgrade.sh | sh" >> $log_dir/$network.$ip.log 2>&1 &

        ip=$((ip+1))
done
