#!/bin/bash

while true; do
  SHOULD_EXIT=$(wget --post-data "" --server-response http://172.18.0.15:5005/request 2>&1| grep -c 'HTTP/1.1 400 Bad Request')
  if [ ${SHOULD_EXIT} -ne 0 ] ; then
    break
  fi
  echo "Waiting..."
  sleep 1
done