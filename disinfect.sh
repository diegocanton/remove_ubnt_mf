#!/bin/bash
# This script change your default port HTTP for 8081
# Colaboration: Alexandre Jeronimo Correa - Onda Internet
FILE=/etc/persistent/mf.tar
RESET=0

# Check virus file exists
if [ -e "$FILE" ] ; then
    echo -e "	Infected :("
    RESET=1
    # Access folder
    cd /etc/persistent
    # Remove the virus
    rm -Rf .mf
    rm -Rf mcuser
    rm rc.poststart
    rm rc.prestart
    rm mf.tar
    #Remove mcuser in passwd - by Alexandre
    sed -ir '/mcad/ c ' /etc/inittab
    sed -ir '/mcuser/ c ' /etc/passwd
    sed -ir '/mother/ c ' /etc/passwd
    echo -e "   Clear Completed :)"
else
    echo -e "   Not Infected, Clear :)"
fi

# check if the http management port has changed
if ! grep -q "httpd.port=8081" /tmp/system.cfg; then
    echo -e "   Changing management port"
    RESET=1

    #Change HTTP port for 8081 | Need access http://IP:8081
    cat /tmp/system.cfg | grep -v http > /tmp/system2.cfg
    echo "httpd.https.status=disabled" >> /tmp/system2.cfg
    echo "httpd.port=8081" >> /tmp/system2.cfg
    echo "httpd.session.timeout=900" >> /tmp/system2.cfg
    echo "httpd.status=enabled" >> /tmp/system2.cfg
    cat /tmp/system2.cfg > /tmp/system.cfg
    rm /tmp/system2.cfg
fi

if [ $RESET = 1 ]; then
    echo -e "   Saving config and rebooting"
    # Write new config
    cfgmtd -w -p /etc/
    cfgmtd -f /tmp/system.cfg -w

    # Kill process - by Alexandre
    kill -HUP `/bin/pidof init`
    kill -9 `/bin/pidof mcad`
    kill -9 `/bin/pidof init`
    kill -9 `/bin/pidof search`
    kill -9 `/bin/pidof mother`
    kill -9 `/bin/pidof sleep`

    reboot
fi
