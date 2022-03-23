#!/bin/bash
dd if=./mbr.bin of=./bochs/hd60M.img bs=512 count=1 conv=notrunc && dd if=./loader.bin of=./bochs/hd60M.img bs=512 count=4 seek=2 conv=notrunc && dd if=build/kernel.bin of=bochs/hd60M.img bs=512 count=200 seek=9 conv=notrunc
