This script is used to remove the virus to ubiquiti radios discovered on 05/13/2016 more information at: http://community.ubnt.com/t5/airMAX-General-Discussion/Virus-attack-URGENT-UBNT/td-p/1562940 

# Multiple radios via SSHPASS
------------------
You can use a single Linux machine with SSHPASS installed to clear all your network equipment improving the sample script clearmf.sh ou criando seu script com o comando abaixo

sshpass -p PASS ssh USER@IP "wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect.sh | sh"

You need install in server SSHPASS
- Debian: apt-get install sshpass
- Centos: yum install sshpass

# Direct in Radio
------------------
You may prefer to run the command only a single radio to this run the following command

wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect.sh | sh
