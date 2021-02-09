```bash
# To start
docker-compose up -d
# To see the status
docker-compose logs -f
```

#### Notes

* 1 Odin token equals 10^6 loki

# Example create data source:
bandcli tx oracle create-data-source --name "sources list" --description "receives no input and returns sources list" --script path/to/script/geo-data-v1.py --owner odin13jr8uchhtqmrzw77xwvme5qgw8t9qqdsu3amxu --keyring-backend test --from supplier --chain-id odin