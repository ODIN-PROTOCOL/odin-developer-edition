#!/bin/bash

odind init $1 --chain-id odin --timeout-commit 5000

cp ./$1/priv_validator_key.json ~/.odin/config/priv_validator_key.json
cp ./$1/node_key.json ~/.odin/config/node_key.json
cp /genesis.json ~/.odin/config/genesis.json

sed -i 's/enable = false/enable = true/' ~/.odin/config/app.toml
sed -i 's/enabled-unsafe-cors = false/enabled-unsafe-cors = true/' ~/.odin/config/app.toml
sed -i 's/cors_allowed_origins = \[\]/cors_allowed_origins = ["*"]/' ~/.odin/config/config.toml

#cat ~/.odin/config/app.toml