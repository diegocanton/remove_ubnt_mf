#!/bin/bash
# Scans directories and creates a single log file from IP range
#
# When cleanmf.sh and upgrade.sh are ran, log directories
# are created with 2 log files for every IP address.
# This script consolidates those logs into 2 files.

for d in */ ; do
  d2=${d::-1}
  cat $d*.log >> $d2.log
  cat $d*.err >> $d2.err
done
