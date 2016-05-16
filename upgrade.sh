#!/bin/bash
# This script upgrade firmware
# Colaboration: Alexandre Jeronimo Correa - Onda Internet

    #detect version of fw - Colaboration PVi1 (Git user)
    versao=`mca-status  | grep firmware | cut -d, -f3 | cut -d= -f2 | cut -d. -f1`
    if [ "$versao" == "XM" ]; then
        URL='http://dl.ubnt.com/firmwares/XN-fw/v5.6.4/XM.v5.6.4.28924.160331.1253.bin'
        wget $URL -O /tmp/firmware.bin
        touch /etc/persistent/ ct
        ubntbox fwupdate.real -m /tmp/firmware.bin
    fi
    if [ "$versao" == "XW" ]; then
        URL='http://dl.ubnt.com/firmwares/XW-fw/v5.6.4/XW.v5.6.4.28924.160331.1238.bin'
        wget $URL -O /tmp/firmware.bin
        touch /etc/persistent/ ct
        ubntbox fwupdate.real -m /tmp/firmware.bin
    fi
