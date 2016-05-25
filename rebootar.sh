versao=`mca-status  | grep firmware | cut -d, -f3 | cut -d= -f2 | cut -d. -f1`
echo $versao
reboot
