#!/bin/bash
# This script change your default port HTTP for 81
FILE=/etc/persistent/mf.tar

# Check virus
if [ -e "$FILE" ] ; then
    echo "Infected"
    #Acess folder
    cd /etc/persistent
    #Remove the virus
    rm mf.tar
    rm -R .mf
    rm -R mcuser
    rm rc.poststart
    #Remove mcuser in passwd
    cat /etc/passwd | grep -v mcuser >> /etc/passwd2
    cat /etc/passwd2 >> /etc/passwd
    rm /etc/passwd2
    #Change HTTP port for 81 | Need access http://IP:81
    cat /tmp/system.cfg | grep -v http >> /tmp/system2.cfg
    echo "httpd.https.status=disabled" >> /tmp/system2.cfg
    echo "httpd.port=81" >> /tmp/system2.cfg
    echo "httpd.session.timeout=900" >> /tmp/system2.cfg
    echo "httpd.status=enabled" >> /tmp/system2.cfg
    cat /tmp/system2.cfg >> /tmp/system.cfg
    rm /tmp/system2.cfg
    #Write new config
    cfgmtd -w -p /etc/
    cfgmtd -f /tmp/system.cfg -w
    #Kill process
    killall -9 search
    killall -9 mother
    killall -9 sleep
    echo "Clear Completed"
    reboot
else
    echo "Clear"
    exit
fi

