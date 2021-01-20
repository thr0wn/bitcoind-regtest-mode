# Bitcoin daemon ready for tests on [regtest mode](https://developer.bitcoin.org/examples/testing.html#regtest-mode)

## ⚙ Build
```bash
docker build -t bitcoind-regtest-mode .
```

<hr>

## 🚀 Run
```bash
docker run -d -it -p 1111:1111 -p 1112:1112 bitcoind-regtest-mode
```

<hr>

## ☢ Test
```bash
curl --data-binary '{"jsonrpc":"1.0","id":"curltext","method":"getnetworkinfo","params":[]}' -H 'content-type:text/plain;' http://root:root@localhost:1112
```
