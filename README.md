This script is used to remove the virus to ubiquiti radios discovered on 05/13/2016 more information at: http://community.ubnt.com/t5/airMAX-General-Discussion/Virus-attack-URGENT-UBNT/td-p/1562940 

UBIQUITI OFFICIAL TOOL >>> http://community.ubnt.com/t5/airMAX-General-Discussion/Malware-Removal-Tool-05-15-2016/m-p/1564953#U1564953

I want to make my special thanks to Alexandre Jeronimo Correa - Onda Internet and PVi1 (Git user) by collaboration with improvements in code and some users who alerted me little mistakes.

Beware, this will change the HTTP port is 81

The exploit uses USER: mother and PASSWORD: fucker recommend trying to use this username and password before your own password, in our tests it is working. The mother user is removed during disinfection.

These are examples, you need to download them (examples clearmf.sh) on a Linux for execution, are two separate scripts, one clean and the other updates activating Compilance Test. We have not succeeded in implementing the three tasks simultaneously. So I suggest that first option to upgrade the entire network running the script with the online upgrade without comment and line disinfect commented in second run make clean, so you can enjoy the mother user the virus.

The ubiquiti firmware WGET does not support HTTPS connections as RAW GitHub link, so we use a function of UBNT, tirgger_url.

- Log generation added by Joshua Clark (Git user Zabbix). Thanks man.
- Upgrade firmware added by Alexandre Jeronimo Correa. Thanks man,

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

sshpass -p PASS ssh -o UserKnownHostsFile=/dev/null -o ConnectTimeout=10  -o StrictHostKeyChecking=no USER@IP "trigger_url  https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/disinfect.sh | sh"

- Upgrade

sshpass -p PASS ssh -o UserKnownHostsFile=/dev/null -o ConnectTimeout=10 -o StrictHostKeyChecking=no USER@IP "trigger_url https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/upgrade.sh | sh"


You need install in server SSHPASS
- Debian: apt-get install sshpass
- Centos: yum install sshpass

# Direct in Radio
------------------
You may prefer to run the command only a single radio to this run the following command

- Remove

trigger_url https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/disinfect.sh | sh

- Upgrade

trigger_url https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/upgrade.sh | sh

------------------

------------------
PORTUGUÊS
------------------

Para executar em paralelo, coloque um o "&" do final das linhas de comando de acesso SSH, os exemplos já estão em paralelo. CUIDADO: Ao executar em redes muito grandes, não foi testado com muitas conexões simultaneas.

------------------
Estes scripts são usados para remover o vírus para rádios Ubiquiti descoberto em 13/05/2016, mais informações em: http://community.ubnt.com/t5/airMAX-General-Discussion/Virus-attack-URGENT-UBNT/td-p/1562940 

Quero deixar meus agradecimentos especiais para Alexandre Jeronimo Correa - Onda Internet e PVi1 (Git user) pela colaboração com melhorias no código e alguns usuários que me alertaram em pequenos erros.

Cuidado, isto irá alterar a porta HTTP for 81

O exploit usa USUARIO:mother e SENHA:fucker recomendo tentar usar esse usuário e senha antes da sua própria senha, em nossos testes ele tem funcionando. O usuário mother é removido durante a desinfecção.

Estes são exemplos, você precisará baixa-los (exemplos clearmf.sh) em um Linux para execução, são dois scripts independentes, um limpa e o outro atualiza ativando Compilance Test. Não tivemos sucesso na execução das 3 tarefas em simultaneo. Então sugiro que em primeira opção atualize toda a rede executando o script com a linha do upgrade sem comentário e linha disinfect comentada, em segunda execução faça a limpeza, assim você poderá aproveitar o usuário mother do vírus.

O WGET do firmware da ubiquiti não suporta conexões HTTPs como do link RAW do GITHUB, por isso usamos uma função da UBNT, tirgger_url.

------------------

Para executar em paralelo, coloque o "&" o fim da linha de comando acesso SSH, exemplos já estão em paralelo. CUIDADO: Ao executar em redes muito grandes, não foi testado com muitas conexões simultâneas.

------------------

# Multiplos radios via SSHPASS
------------------
Você pode usar uma simples maquina com SSHPASS instalado para limpar toda sua rede adaptando os scripts clearmf de exemplo.

Ex: ./clearmf.sh PASS USER NETWORK INITIAL_IP

Ou pode criar scripts próprios e inserir o comando abaixo:

- Remover

sshpass -p PASS ssh -o UserKnownHostsFile=/dev/null -o ConnectTimeout=10 -o StrictHostKeyChecking=no USER@IP "trigger_url https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/disinfect.sh | sh"

- Atualizar

sshpass -p PASS ssh -o UserKnownHostsFile=/dev/null -o ConnectTimeout=10 -o StrictHostKeyChecking=no USER@IP "trigger_url  https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/upgrade.sh | sh"


Você irá precisar instalar no linux o SSHPASS
- Debian: apt-get install sshpass
- Centos: yum install sshpass

# Diretamente no Radio
------------------
Se você ocasionalmente tiver poucos equipamentos afetados e queira executar um a um, execute  o comandos abaixo diretamente no terminal do rádio infectado:

- Remover

trigger_url https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/disinfect.sh | sh

- Atualizar

trigger_url https://raw.githubusercontent.com/diegocanton/remove_ubnt_mf/master/upgrade.sh | sh

