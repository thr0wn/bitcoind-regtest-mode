#!/bin/bash
mkdir regtest
cd regtest
echo -e "\nStarting both bitcoin nodes...\n"
bitcoind -datadir=/regtest/node1
bitcoind -datadir=/regtest/node2

function node1(){
    bitcoin-cli -regtest -datadir=/regtest/node1 -rpcport=1112 $@
}
function node2() {
    bitcoin-cli -regtest -datadir=/regtest/node2 -rpcport=2223 $@
}

export -f node1;
export -f node2;

sleep 3

node1 -rpcuser=root -rpcpassword=root generatetoaddress 1 bcrt1qu34xuknwltm7278jkwxetfqfl89q73h2eeyfzv

echo -e "\nNodes started!\n"

/bin/bash "$@"
