#!/bin/bash
# This script upgrade firmware
# Colaboration: Alexandre Jeronimo Correa - Onda Internet

#detect version of fw - Colaboration PVi1 (Git user)
    versao=`mca-status  | grep firmware | cut -d, -f3 | cut -d= -f2 | cut -d. -f1`

if [ "$versao" == "XM" ]; then
            URL='http://www.ubnt.com/downloads/XN-fw-internal/v5.6.5/XM.v5.6.5.29033.160515.2119.bin'
            wget $URL -O /tmp/XM.v5.6.5.29033.160515.2119.bin
            ubntbox fwupdate.real -m /tmp/XM.v5.6.5.29033.160515.2119.bin
fi
if [ "$versao" == "XW" ]; then
            URL='http://www.ubnt.com/downloads/XN-fw-internal/v5.6.5/XW.v5.6.5.29033.160515.2108.bin'
            wget $URL /tmp/XW.v5.6.5.29033.160515.2108.bin
            ubntbox fwupdate.real -m /tmp/XW.v5.6.5.29033.160515.2108.bin
fi
