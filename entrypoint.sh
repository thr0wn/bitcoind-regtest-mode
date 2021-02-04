#!/bin/bash
cd regtest
echo -e "\nStarting both bitcoin nodes...\n"
bitcoind -regtest -deprecatedrpc=accounts -datadir=/regtest/node1
bitcoind -regtest -deprecatedrpc=accounts -datadir=/regtest/node2

function node1(){
    bitcoin-cli -regtest -datadir=/regtest/node1 -rpcuser=root -rpcpassword=root -rpcport=1112 $@
}
function node2() {
    bitcoin-cli -regtest -datadir=/regtest/node2 -rpcuser=root -rpcpassword=root -rpcport=1114 $@
}

export -f node1;
export -f node2;

sleep 3

node1 createwallet "" > /dev/null 2>&1 || true 
node1 generatetoaddress 1 bcrt1qu34xuknwltm7278jkwxetfqfl89q73h2eeyfzv  > /dev/null 2>&1 

echo -e "\Bitcoind regtest started!\n"

/bin/bash "$@"
