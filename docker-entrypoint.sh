#!/bin/bash
set -e

if [[ "$1" == "sperocoin-cli" || "$1" == "sperocoin-tx" ]]; then
	exec "$@"
else
  sperocoind
  trap "echo signal;exit 0" SIGINT

  while :
  do
    sleep infinity
  done
fi

