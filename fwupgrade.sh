#!/bin/bash

mca_status=`mca-status | head -n 1 | awk -F, '{print $3}'`
# firmwareVersion=XM.ar7240.v5.6.5.29033.160515.2119
firmware=""

cd /tmp

# Clear bad downloads, etc..
if [ -e "/tmp/fwupdate.bin" ] ; then
  rm /tmp/fwupdate.bin
fi

if ! echo $mca_status | grep -q "v5.6.5"; then
  echo "	Not on v5.6.5 :("

  # XM Radio
  if echo $mca_status | grep -q "firmwareVersion=XM"; then
    echo "	XM Radio Detected"
    firmware="http://www.ubnt.com/downloads/XN-fw-internal/v5.6.5/XM.v5.6.5.29033.160515.2119.bin"
  fi

  # XW Radio
  if echo $mca_status | grep -q "firmwareVersion=XW"; then
    echo "	XW Radio Detected"
    firmware="http://www.ubnt.com/downloads/XN-fw-internal/v5.6.5/XW.v5.6.5.29033.160515.2108.bin"
  fi

  if [ ! -z "$firmware" ]; then
    wget -q $firmware -O /tmp/fwupdate.bin
    if [ $? -ne 0 ]; then
      echo "  Download failed, stopping"
      rm /tmp/$firmware
    else
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
