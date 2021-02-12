rm -rf ~/.faucet

sleep 10

bandcli config node $1
bandcli config chain-id odin

echo "usage ketchup faculty bench jewel rocket latin absurd decide field party reunion cook entry scout scene miss box memory museum decorate guide few verify" \
    | bandcli keys add supplier --recover --keyring-backend test

faucet config chain-id odin

faucet config port 5005

faucet keys add worker

echo "y" | bandcli tx send supplier $(faucet keys show worker) 1000000000000loki --keyring-backend test

sleep 5