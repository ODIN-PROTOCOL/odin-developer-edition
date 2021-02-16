#!/bin/bash

rm -rf ~/.faucet

bandcli config node $2
bandcli config chain-id odin

echo "usage ketchup faculty bench jewel rocket latin absurd decide field party reunion cook entry scout scene miss box memory museum decorate guide few verify" \
    | bandcli keys add $1 --recover --keyring-backend test

faucet config chain-id odin

faucet config port 5005

faucet keys add worker

echo "y" | bandcli tx send $1 $(faucet keys show worker) 1000000000000loki --broadcast-mode block --keyring-backend test