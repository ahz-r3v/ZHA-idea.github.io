#!/bin/bash
gcc -m32 -I lib/kernel/ -I lib/ -I kernel/ -c -fno-builtin -fno-stack-protector -o build/timer.o device/timer.c && \
gcc -m32 -I lib/kernel/ -I lib/ -I kernel/ -c -fno-builtin -fno-stack-protector -o build/main.o kernel/main.c && \
nasm -f elf -o build/print.o lib/kernel/print.s && \
nasm -f elf -o build/kernel.o kernel/kernel.s && \
gcc -m32 -I lib/kernel/ -I lib/ -I kernel/ -c -fno-builtin -fno-stack-protector -o build/interrupt.o  kernel/interrupt.c && \
gcc -m32 -I lib/kernel/ -I lib/ -I kernel/ -c -fno-builtin -fno-stack-protector -o build/init.o kernel/init.c && \
ld -m elf_i386 -Ttext 0xc0001500 -e main -o build/kernel.bin build/main.o build/init.o build/interrupt.o build/print.o build/kernel.o build/timer.o
