#! /bin/bash
set -e
mkdir -p log/$1
make icebprog
cp icebreaker.nplog log/$1
cp icebreaker.log log/$1
screen -L -Logfile log/$1/results.log /dev/ttyUSB1 115200
