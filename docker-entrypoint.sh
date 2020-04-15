#!/bin/bash
set -e
GOSU="gosu sperocoin"
# don't use gosu when id is not 0
if [ "$(id -u)" -ne "0" ];then
  GOSU=""
fi

if [[ "$1" == "sperocoin-cli" || "$1" == "sperocoin-tx" ]]; then
	exec $GOSU "$@"
else
  exec $GOSU "sperocoind"
fi