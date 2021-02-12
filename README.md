```bash
# To start
docker-compose up -d
# To see the status
docker-compose logs -f
```

#### Notes

* 1 Odin token equals 10^6 loki

# Example create data source:
```bash
bandcli tx oracle create-data-source --name "some name" --description "some description" --script path/to/script/script.py --owner [owner-acc-address] --from [key-name] --chain-id odin --keyring-backend test 
```

# Example create oracle script:
```bash
 bandcli tx oracle create-oracle-script --name "some name" --description "some description" --script path/to/script/script.wasm --owner [owner-acc-address] --from [key-name] --chain-id odin --keyring-backend test
 ```

# Example become Oracle validator:
```bash
bandcli tx oracle activate --from [key-name] --chain-id odin --keyring-backend test
```

# Example become system validator:
```bash
bandcli tx staking create-validator --amount 100000000loki --commission-max-change-rate 0.010000000000000000 --commission-max-rate 0.200000000000000000 --commission-rate 0.100000000000000000 --chain-id odin --from supplier --moniker oracle-validator --pubkey odinvalconspub1addwnpepqge86lvslkpfk0rlz0ah9tat0vntx8yele36hhfpflehfehydlutkvdvhfm --min-self-delegation 1 --keyring-backend test
```

 # Example request create:
```bash
bandcli tx oracle request [oracle-script-id:uint] [min-reports:uint] [max-reports:uint] -c [obi-encoded-calldata] --chain-id odin --from [key-name] --gas auto --keyring-backend test
``` 
OBI Encoded calldata example:
```json
{"symbol": "BTC", "multiplier": 1000000000} -> 00000003425443000000003b9aca00
```

# Example configuring reporters:
```bash
bandcli tx multi-send 1000000loki $(yoda keys list -a) --from supplier --keyring-backend test --chain-id odin
bandcli tx oracle add-reporters $(yoda keys list -a) --from supplier --keyring-backend test --chain-id odin
```

# Example edit data source:
```bash
bandcli tx oracle edit-data-source 1 --script /home/stepan/Projects/band/GeoDB-Limited/odin-developer-edition/data-source-scripts/geo-data-v1.py --owner odin1nnfeguq30x6nwxjhaypxymx3nulyspsuja4a2x --from supplier --chain-id odin --keyring-backend test
```

# Example query report:
```bash
bandcli query oracle request 2 --chain-id odin --output json --indent
```