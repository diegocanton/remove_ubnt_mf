This script is used to remove the virus to ubiquiti radios discovered on 05/13/2016 more information at: http://community.ubnt.com/t5/airMAX-General-Discussion/Virus-attack-URGENT-UBNT/td-p/1562940 

UBIQUITI OFFICIAL TOOL >>> http://community.ubnt.com/t5/airMAX-General-Discussion/Malware-Removal-Tool-05-15-2016/m-p/1564953#U1564953

This script change default port HTTP for 81

The exploit use USER:mother and PASS:fucker try it before your user and pass, in test it's work. This script remove this user.

These are examples of the firmware WGET ubiquiti does not support HTTPS connections as the RAW link GitHub. You will need to host the file on a disinfection your server.

------------------

Check in your DNS IPs infected via TCPDUMP, DNS querys, print IP query xxx.xxx.xxx.xxx. (query by mf infection)

tcpdump -vvv -n port 53 -i eth0 | grep -i nxdomain | grep -i "ns: . " | cut -f5-8 -d "." | cut -f3 -d " " | grep -v "ns" | grep -v "0x"

------------------

To run in parallel, put the "&" the end of SSH access command line, examples are already in parallel. CAUTION: When running in very large networks, has not been tested with many simultaneous connections.

# Multiple radios via SSHPASS
------------------
You can use a single Linux machine with SSHPASS installed to clear all your network equipment improving the sample script clearmf.sh 

Ex: ./clearmf.sh PASS USER NETWORK INITIAL_IP

Or or create a script with the following command

- Remove

sshpass -p PASS ssh  -o ConnectTimeout=10  -o StrictHostKeyChecking=no USER@IP "wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect.sh | sh"

- Upgrade

sshpass -p PASS ssh -o ConnectTimeout=10 -o StrictHostKeyChecking=no USER@IP "wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/upgrade.sh | sh"

- Remove and Upgrade

sshpass -p PASS ssh -o ConnectTimeout=10 -o StrictHostKeyChecking=no USER@IP "wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect_upgrade.sh | sh"

You need install in server SSHPASS
- Debian: apt-get install sshpass
- Centos: yum install sshpass

# Direct in Radio
------------------
You may prefer to run the command only a single radio to this run the following command

- Remove

wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect.sh | sh

- Upgrade

wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/upgrade.sh | sh

- Remove and Upgrade

wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect_upgrade.sh | sh

------------------
PORTUGUÊS
------------------

Para executar em paralelo, coloque um o "&" do final das linhas de comando de acesso SSH, os exemplos já estão em paralelo. CUIDADO: Ao executar em redes muito grandes, não foi testado com muitas conexões simultaneas.

------------------
Estes scripts são usados para remover o vírus para rádios Ubiquiti descoberto em 13/05/2016, mais informações em: http://community.ubnt.com/t5/airMAX-General-Discussion/Virus-attack-URGENT-UBNT/td-p/1562940 

Cuidado, isto irá alterar a porta HTTP for 81

O exploit usa USUARIO:mother e SENHA:fucker recomendo tentar usar esse usuário e senha antes da sua, em nossos testes ele tem funcionando. O usuário mother é removido durante a desinfecção.

Estes são exemplos, o WGET do firmware da ubiquiti não suporta conexões HTTPs como do link RAW do GITHUB. Você precisará hospedar o arquivo de desinfecção em um servidor seu.

# Multiplos radios via SSHPASS
------------------
Você pode usar uma simples maquina com SSHPASS instalado para limpar toda sua rede adaptando os scripts clearmf de exemplo.

Ex: ./clearmf.sh PASS USER NETWORK INITIAL_IP

Ou pode criar scripts próprios e inserir o comando abaixo:

- Remover

sshpass -p PASS ssh -o ConnectTimeout=10 -o StrictHostKeyChecking=no USER@IP "wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect.sh | sh"

- Atualizar

sshpass -p PASS ssh -o ConnectTimeout=10 -o StrictHostKeyChecking=no USER@IP "wget -qO-  https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/upgrade.sh | sh"

- Remover e Atualizar

sshpass -p PASS ssh -o ConnectTimeout=10 -o StrictHostKeyChecking=no USER@IP "wget -qO-  https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect_upgrade.sh | sh"

Você irá precisar instalar no linux o SSHPASS
- Debian: apt-get install sshpass
- Centos: yum install sshpass

# Diretamente no Radio
------------------
Se você ocasionalmente tiver poucos equipamentos afetados e queira executar um a um, execute  o comandos abaixo diretamente no terminal do rádio infectado:

- Remover

wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect.sh | sh

- Atualizar

wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect.sh | sh

- Remover e Atualizar

wget -qO- https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/desinfect_upgrade.sh | sh
