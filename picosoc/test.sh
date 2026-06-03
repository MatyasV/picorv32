#! /bin/bash
set -e

mkdir -p log/$1
make icebreaker.bin
cp icebreaker.log log/$1
cp icebreaker2.log log/$1
echo "Copied logs to log/$1"

riscv32-unknown-elf-gcc -DICEBREAKER -mabi=ilp32 -march=rv32im -Wl,-Bstatic,-T,icebreaker_sections.lds,--strip-debug -ffreestanding -nostdlib -S -o $2.s $2.c
riscv32-unknown-elf-gcc -DICEBREAKER -mabi=ilp32 -march=rv32im -Wl,-Bstatic,-T,icebreaker_sections.lds,--strip-debug -ffreestanding -nostdlib -o $2.elf start.s $2.s
riscv32-unknown-elf-objcopy -O verilog $2.elf $2.hex
riscv32-unknown-elf-objcopy -O binary $2.elf $2.bin
rm $2.elf $2.hex
iceprog icebreaker.bin
iceprog -o 1M $2.bin
screen -L -Logfile log/$1/results.log /dev/ttyUSB1 115200
