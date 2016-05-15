#!/bin/bash
# This script upgrade firmware
# Colaboration: Alexandre Jeronimo Correa - Onda Internet

if [ "$versao" == "XM" ]; then
URL='http://www.ubnt.com/downloads/XN-fw-internal/v5.6.5/XM.v5.6.5.29033.160515.2119.bin'
            wget $URL
            ubntbox fwupdate.real -m /tmp/XM.v5.6.4.28924.160331.1253.bin
    fi
    if [ "$versao" == "XW" ]; then
    URL='http://www.ubnt.com/downloads/XN-fw-internal/v5.6.5/XW.v5.6.5.29033.160515.2108.bin'
        wget $URL
        ubntbox fwupdate.real -m /tmp/XW.v5.6.4.28924.160331.1238.bin
fi
