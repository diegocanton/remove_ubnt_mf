#!/bin/bash

mca_status=`mca-status | head -n 1 | awk -F, '{print $3}'`
# firmwareVersion=XM.ar7240.v5.6.5.29033.160515.2119
firmware=""
fw_xm="XM.v5.6.5.29033.160515.2119.bin"
fw_xw="XW.v5.6.5.29033.160515.2108.bin"

cd /tmp

# Clear bad downloads, etc..
if [ -e "/tmp/fwupdate.bin" ] ; then
  rm /tmp/fwupdate.bin
fi
if [ -e "/tmp/$fw_xm" ] ; then
  rm /tmp/$fw_xm
fi
if [ -e "/tmp/$fw_xw" ] ; then
  rm /tmp/$fw_xw
fi

if ! echo $mca_status | grep -q "v5.6.5"; then
  echo "	Not on v5.6.5 :("

  # XM Radio
  if echo $mca_status | grep -q "firmwareVersion=XM"; then
    echo "	XM Radio Detected"
    firmware=$fw_xm
  fi

  # XW Radio
  if echo $mca_status | grep -q "firmwareVersion=XW"; then
    echo "	XM Radio Detected"
    firmware=$fw_xw
  fi

  if [ ! -z "$firmware" ]; then
    wget -q http://redstonelabs.net/$firmware
    if [ $? -ne 0 ]; then
      echo "  Download failed, stopping"
      rm /tmp/$firmware
    else
      mv $firmware fwupdate.bin

      # Update firmware
      if [ -e "/tmp/fwupdate.bin" ] ; then
        echo "  Upgrading firmware"
        ubntbox fwupdate.real -m /tmp/fwupdate.bin
      fi
    fi
  fi
else
  echo "	Already on v5.6.5 :)"
fi
