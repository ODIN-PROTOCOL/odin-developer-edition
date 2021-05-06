#!/bin/bash

rm -rf ~/.faucet

echo "usage ketchup faculty bench jewel rocket latin absurd decide field party reunion cook entry scout scene miss box memory museum decorate guide few verify" \
    | faucet keys add $1 --recover

faucet config chain-id odin

faucet config port 5005

faucet config coins geo odin