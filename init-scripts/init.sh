#!/bin/bash

bandd init $1 --chain-id odin --timeout-commit 5000

cp ./$1/priv_validator_key.json ~/.band/config/priv_validator_key.json
cp ./$1/node_key.json ~/.band/config/node_key.json
cp /genesis.json ~/.band/config/genesis.json

sed -i 's/enable = false/enable = true/' ~/.band/config/app.toml
sed -i 's/enabled-unsafe-cors = false/enabled-unsafe-cors = true/' ~/.band/config/app.toml

cat ~/.band/config/app.toml