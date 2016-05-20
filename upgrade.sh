#!/bin/bash
# This script upgrade firmware
# Author: Alexandre Jeronimo Correa - Onda Internet
# Collaboration: Diego Canton, PVi1 (Git user) and Joshua Clark (Git User Zanix) - Improvements

FILE=/bin/ubntbox

# Check if device is Ubiquiti Radio
if [ -e "$FILE" ] ; then
    echo "Enable compilance test..."

    # Ativa Compilance Test
    #touch /etc/persistent/ct
    
    #/bin/cfgmtd -w -p /etc/

    echo "Upgrade firmware"

    #detect version of fw - Colaboration PVi1 (Git user)
    versao=`mca-status  | grep firmware | cut -d, -f3 | cut -d= -f2 | cut -d. -f1`
    if [ "$versao" == "XM" ]; then
        echo "Device XM"
        #URL='http://dl.ubnt.com/firmwares/XN-fw/v5.6.4/XM.v5.6.4.28924.160331.1253.bin'
        # 5.6.4 licensed
        URL='http://dl.ubnt.com/XN-fw-internal/v5.6.4/XM.v5.6.4-licensed.28998.160428.1051.bin'
        #URL='http://dl.ubnt.com/firmwares/XN-fw/v5.6.5/XM.v5.6.5.29033.160515.2119.bin'
        wget $URL -O /tmp/firmware.bin
        ubntbox fwupdate.real -m /tmp/firmware.bin
    elif [ "$versao" == "XW" ]; then
        echo "Device XW"
        #URL='http://dl.ubnt.com/firmwares/XW-fw/v5.6.4/XW.v5.6.4.28924.160331.1238.bin'
        # 5.6.4 licensed
        URL='http://dl.ubnt.com/XN-fw-internal/v5.6.4/XW.v5.6.4-licensed.28998.160428.1038.bin'
        #URL='http://dl.ubnt.com/firmwares/XW-fw/v5.6.5/XW.v5.6.5.29033.160515.2108.bin'
        wget $URL -O /tmp/firmware.bin
        ubntbox fwupdate.real -m /tmp/firmware.bin
    else
        echo "Device Unknown"
    fi
fi
