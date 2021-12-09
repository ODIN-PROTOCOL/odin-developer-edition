#!/bin/bash

while ! odind query account odin1nnfeguq30x6nwxjhaypxymx3nulyspsuja4a2x --chain-id odin --node http://172.18.0.13:26657 ; do
    echo "Waiting..."
    sleep 1
done