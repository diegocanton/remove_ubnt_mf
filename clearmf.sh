#!/bin/bash
# use clearmf.sh USER PASS NETWORK INITIAL_IP LAST_IP

user=$1
pass=$2
network=$3
startip=$4
lastip=$5

if [ -z $1 ]; then
  # Virus USER default
  user=mother
fi
if [ -z $2 ]; then
  # Virus PASS default
  pass=fucker
fi
if [ -z $3 ]; then
  # Network
  network="10.0.0"
fi
if [ -z $4 ]; then
  # Initial IP
  startip=1
fi
if [ -z $5 ]; then
  # Last IP
  lastip=254
fi

# Create log
log_dir=clearmf_$network$ip-$lastip
mkdir $log_dir

# Increment lastip for loop
lastip=`expr $lastip + 1`

while [ $ip -lt $lastip ]; do
  # SSH connection and execution of disinfect.sh
  echo "$network.$ip" > $log_dir/clearmf_$network.$ip.log
  echo "$network.$ip" > $log_dir/clearmf_$network.$ip.err
  sshpass -p $pass ssh -o StrictHostKeyChecking=no $user@$network.$ip "wget -qO- https://raw.githubusercontent.com/zanix/remove_ubnt_mf/master/disinfect.sh | sh" 2>> $log_dir/clearmf_$network.$ip.err >> $log_dir/clearmf_$network.$ip.log &
  ip=`expr $ip + 1`
done
