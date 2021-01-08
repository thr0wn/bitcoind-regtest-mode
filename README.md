# Bitcoin daemon ready for tests on [regtest mode](https://developer.bitcoin.org/examples/testing.html#regtest-mode)
> Two nodes running on regtest mode and ready for json-rpc api tests

<hr>

## Build
```bash
docker build --no-cache -t bitcoind-regtest .
```

<hr>

## Run
```bash
docker run -d -it -p 1112:1112 bitcoind-regtest
```

<hr>

## Test
```bash
curl --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getnetworkinfo","params":[]}' -H 'content-type:text/plain;' http://root:root@localhost:1112
```