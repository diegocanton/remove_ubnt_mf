#!/bin/bash
# Scans for log directories and creates a single log file
#
# When cleanmf.sh is ran, a log directory is created
# with a log files for every IP address.
# This script consolidates each IP log into 1 file.

for d in */ ; do
  d2=${d::-1}
  awk 'FNR==1{print ""}1' $d*.log > $d2.log
done
