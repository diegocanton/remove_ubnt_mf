#!/bin/bash
# use clearmf.sh PASS USER
# Runs all IPs in parallel, remove "&" the end of `sshpath` lines to disable
# Collaboration: Joshua Clark (Git User Zanix) - log option and last IP range

# In DNS server
# List with
# tcpdump -v -n port 53 -i eth1 | grep -i nxdomain | cut -f5-8 -d "." | cut -f3 -d " " > /opt/remove_ubnt_mf/iplist2.txt
# cat /opt/remove_ubnt_mf/iplist2.txt | sort -n | uniq > /opt/remove_ubnt_mf/iplist.txt

#In iplist.txt use:
#10.0.0.1
#10.0.0.4
#...

_input=/opt/remove_ubnt_mf/iplist.txt
pass=$1
user=$2

# Create log
log_dir=clearmf_list
mkdir $log_dir

for ip in `grep -v ^# $_input | awk '{print $1}'`; do
        echo "Checking $ip..."
        echo "$ip" > $log_dir/$ip.log

        #Only remove
        sshpass -p $pass ssh -o UserKnownHostsFile=/dev/null -o ConnectTimeout=10 -o StrictHostKeyChecking=no $user@$ip "trigger_url  https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect.sh | sh" >> $log_dir/$ip.log 2>&1 &

        #Only upgrade
        #sshpass -p $pass ssh -o UserKnownHostsFile=/dev/null -o ConnectTimeout=10 -o StrictHostKeyChecking=no $user@$ip "trigger_url  https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/upgrade.sh | sh" >> $log_dir/$ip.log 2>&1 &

done
