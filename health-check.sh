 
#!/bin/bash
NOW=$(date +"%b-%d %H:%M")
if (ps -ef | grep -i node1 | grep -v grep) ; then
#    echo 'Node1 is running '$NOW''
#    uncomment the next line for testing purposes
#    echo 'Node1 is running '$NOW'' >> ~/swissdlt/servercheck.txt
sleep 1
else
#please choose if you want to mine or not uncomment one of the following lines
cd ~/swissdlt/
#put your mining node command here
#eg screen -dSm screen node1 geth --dadatir node1 etc
#~/swissdlt/start-node.sh

#archvie node only
screen -S node1 geth --datadir node1/ --syncmode 'full' --gcmode=archive  --port 30311 --rpc --rpcaddr 'localhost' --rpcport 8545 --rpcapi 'personal,eth,net,web3,txpool,miner' --networkid 999 --gasprice '1'

#validating node (don't use this option for unlocking !)
#screen -dSm node1 geth --datadir node1/ --syncmode 'full' --port 30311 --rpc --rpcaddr 'localhost' --rpccorsdomain "*" --rpcport 8540 --rpcapi 'personal,eth,net,web3,txpool,miner' --networkid 99 --gasprice '1' -unlock 'VALIDATING-ADDRESS-withouth-0x' --password passwort.txt --mine --allow-insecure-unlock


sleep 3
#    cho "node1 is NOT running!"
     echo 'dead node1 restarted '$NOW'' >> ~/swissdlt/servercheck.txt;
fi
