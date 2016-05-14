This script is used to remove the virus to ubiquiti radios discovered on 05/13/2016 more information at: http://community.ubnt.com/t5/airMAX-General-Discussion/Virus-attack-URGENT-UBNT/td-p/1562940 

- You can run the following command to run on only one device or improve the sample script clearmf.sh

sshpass -p PASS ssh USER@IP "wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect.sh | sh"

- You can run the following command to run directly on a radio

sshpass -p PASS ssh USER@IP "wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect.sh | sh"
