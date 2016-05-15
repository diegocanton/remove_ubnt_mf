#!/bin/bash
# This script upgrade firmware
# Colaboration: Alexandre Jeronimo Correa - Onda Internet

if [ "$versao" == "XM" ]; then
URL='http://dl.ubnt.com/firmwares/XN-fw/v5.6.4/XM.v5.6.4.28924.160331.1253.bin'
        wget $URL
        ubntbox fwupdate.real -m /tmp/XM.v5.6.4.28924.160331.1253.bin
fi
if [ "$versao" == "XW" ]; then
URL='http://dl.ubnt.com/firmwares/XW-fw/v5.6.4/XW.v5.6.4.28924.160331.1238.bin'
        wget $URL
        ubntbox fwupdate.real -m /tmp/XW.v5.6.4.28924.160331.1238.bin
fi
