#!/bin/bash

rm -rf ~/.faucet

echo "usage ketchup faculty bench jewel rocket latin absurd decide field party reunion cook entry scout scene miss box memory museum decorate guide few verify" \
    | faucet keys add $1 --recover

faucet config chain-id odin-testnet-vale

faucet config port 5005

faucet config period 12h

faucet config coins 10000000000minigeo,10000000000loki

faucet config max-per-period-withdrawal 10000000000minigeo,10000000000loki