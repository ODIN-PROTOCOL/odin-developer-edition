#!/bin/bash

echo "usage ketchup faculty bench jewel rocket latin absurd decide field party reunion cook entry scout scene miss box memory museum decorate guide few verify" \
    | odind keys add $1 --recover --keyring-backend test

echo "y" | odind tx oracle activate --from $1 --chain-id odin --keyring-backend test --node $2 --broadcast-mode block

# Create system validator
echo "y" | odind tx staking create-validator \
  --amount 100000000loki \
  --commission-max-change-rate 0.010000000000000000 \
  --commission-max-rate 0.200000000000000000 \
  --commission-rate 0.100000000000000000 \
  --from $1 \
  --moniker oracle-validator \
  --pubkey odinvalconspub1addwnpepqge86lvslkpfk0rlz0ah9tat0vntx8yele36hhfpflehfehydlutkvdvhfm \
  --min-self-delegation 1 \
  --broadcast-mode block \
  --keyring-backend test \
  --node $2 \
  --chain-id odin

# Create data source and oracle script
echo "y" | odind tx oracle create-data-source \
  --name "mock data source" \
  --description "mock data source with 'Hello, World!'" \
  --script /data-source-scripts/mock.py \
  --fee 0loki \
  --owner odin1nnfeguq30x6nwxjhaypxymx3nulyspsuja4a2x \
  --from $1 \
  --gas auto \
  --broadcast-mode block \
  --keyring-backend test \
  --node $2 \
  --chain-id odin

echo "y" | odind tx oracle create-oracle-script \
  --name "mock oracle script" \
  --description "mock oracle script with 'Hello, World!' going on 1 DS" \
  --script /oracle-scripts/mock.wasm \
  --owner odin1nnfeguq30x6nwxjhaypxymx3nulyspsuja4a2x \
  --from $1 \
  --gas auto \
  --broadcast-mode block \
  --keyring-backend test \
  --node $2 \
  --chain-id odin

/init-scripts/yoda.sh $1 $2