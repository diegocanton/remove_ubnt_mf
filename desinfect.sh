#!/bin/bash
FILE=/etc/persistent/mf.tar

#Verifica se ha o virus
if [ -e "$FILE" ] ; then
    #Acessa a pasta
    cd /etc/persistent
    #Remove o virus
    rm mf.tar
    rm -R .mf
    rm -R mcuser
    rm rc.poststart
    #Remover mcuser
    cat /etc/passwd | grep -v mcuser >> /etc/passwd2
    cat /etc/passwd2 > /etc/passwd
    rm /etc/passwd2
    cfgmtd -w -p /etc/
    #Mata os processos
    killall -9 search
    killall -9 mother
    killall -9 sleep
    reboot
fi
