#!/bin/bash

rm -rf ~/.yoda

bandcli config node $2
bandcli config chain-id odin

echo "usage ketchup faculty bench jewel rocket latin absurd decide field party reunion cook entry scout scene miss box memory museum decorate guide few verify" \
    | bandcli keys add $1 --recover --keyring-backend test

# config chain id
yoda config chain-id odin

# add validator to yoda config
yoda config validator $(bandcli keys show $1 -a --bech val --keyring-backend test)

# setup execution endpoint
yoda config executor "rest:https://iv3lgtv11a.execute-api.ap-southeast-1.amazonaws.com/live/master?timeout=10s"

# setup broadcast-timeout to yoda config
yoda config broadcast-timeout "5m"

# setup rpc-poll-interval to yoda config
yoda config rpc-poll-interval "1s"

# setup max-try to yoda config
yoda config max-try 5

echo "y" | bandcli tx oracle activate --from $1 --keyring-backend test

# wait for activation transaction success
sleep 5

for i in $(eval echo {1..$2})
do
  # add reporter key
  yoda keys add reporter$i
done

# send band tokens to reporters
echo "y" | bandcli tx multi-send 1000000loki $(yoda keys list -a) --from $1 --keyring-backend test

# wait for sending band tokens transaction success
sleep 5

# add reporter to bandchain
echo "y" | bandcli tx oracle add-reporters $(yoda keys list -a) --from $1 --keyring-backend test

# wait for addding reporter transaction success
sleep 5

echo "Yoda configured"