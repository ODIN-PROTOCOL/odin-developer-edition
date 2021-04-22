#!/bin/bash

rm -rf ~/.faucet

echo "usage ketchup faculty bench jewel rocket latin absurd decide field party reunion cook entry scout scene miss box memory museum decorate guide few verify" \
    | bandd keys add $1 --recover --keyring-backend test

faucet config chain-id odin

faucet config port 5005

faucet keys add worker

echo "y" | bandd tx bank send $1 $(faucet keys show worker) 1000000000000loki --broadcast-mode block --keyring-backend test --node $2 --chain-id odin