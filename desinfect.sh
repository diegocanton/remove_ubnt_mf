#!/bin/bash
FILE=/etc/persistent/mf.tar

#Verifica se ha o virus
if [ -e "$FILE" ] ; then
    echo "Infected"
    #Acessa a pasta
    cd /etc/persistent
    #Remove o virus
    rm mf.tar
    rm -R .mf
    rm -R mcuser
    rm rc.poststart
    #Remove mcuser
    cat /etc/passwd | grep -v mcuser >> /etc/passwd2
    cat /etc/passwd2 >> /etc/passwd
    rm /etc/passwd2
    #Change HTTP port for 88 | Need access http://IP:88
    cat /tmp/system.cfg | grep -v http >> /tmp/system2.cfg
    echo "httpd.https.status=disabled" >> /tmp/system2.cfg
    echo "httpd.port=81" >> /tmp/system2.cfg
    echo "httpd.session.timeout=900" >> /tmp/system2.cfg
    echo "httpd.status=enabled" >> /tmp/system2.cfg
    cat /tmp/system2.cfg >> /tmp/system.cfg
    rm /tmp/system2.cfg
    #cfgmtd -w -p /etc/
    #Mata os processos
    killall -9 search
    killall -9 mother
    killall -9 sleep
    #reboot
else
    echo "Clear"
    exit
fi

