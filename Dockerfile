FROM ubuntu:18.04
RUN apt-get update
RUN apt-get install software-properties-common -y
RUN add-apt-repository ppa:luke-jr/bitcoincore
RUN apt-get install -y --no-install-recommends apt-utils
RUN apt-get install software-properties-common -y
RUN apt-add-repository ppa:bitcoin/bitcoin
RUN apt-get install bitcoind -y
ADD entrypoint.sh entrypoint.sh
ADD node1.conf /regtest/node1/bitcoin.conf
ADD node2.conf /regtest/node2/bitcoin.conf
RUN chmod 777 entrypoint.sh

CMD ["./entrypoint.sh"]
