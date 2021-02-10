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

 # Example request create:
```bash
bandcli tx oracle request [oracle-script-id:uint] [min-reports:uint] [max-reports:uint] -c [obi-encoded-calldata] --chain-id odin --from [key-name] --gas auto --keyring-backend test
``` 
OBI Encoded calldata example:
```json
{"symbol": "BTC", "multiplier": 1000000000} -> 00000003425443000000003b9aca00
```