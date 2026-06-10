#! /bin/bash
set -e

# cat /dev/ttyUSB1 | tee serial.log 
mkdir -p test_results
stty -F /dev/ttyUSB1 115200 raw -echo

# iterate over each .bin in ./binaries
for bin in ./binaries/*.bin; do
	[ -e "$bin" ] || continue
	echo "Processing: $bin"
    iceprog $bin
    timeout 23s cat /dev/ttyUSB1 | tee test_results/$(basename "$bin" .bin).log
done
