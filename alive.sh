#!/bin/bash

trap "echo signal;exit 0" SIGINT

while :
do
    sleep 1
done