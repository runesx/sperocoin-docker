#!/bin/bash
set -e

if [[ "$1" == "sperocoin-cli" || "$1" == "sperocoin-tx" ]]; then
	exec "$@"
else
  exec "sperocoind"
fi

