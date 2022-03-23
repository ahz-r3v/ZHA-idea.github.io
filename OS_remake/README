bin/bochs -f bochsrc.disk；在bochs目录下管理员身份运行，进入bochs后输入c开始
nasm -o A.bin A.s
dd if=./mbr.bin of=./bochs/hd60M.img bs=512 count=1 conv=notrunc
sudo dd if=./loader.bin of=./bochs/hd60M.img bs=512 count=2 seek=2 conv=notrunc

先在bochs的配置文件中加入一句话”magic_break: enabled=1”,这句话的作用就是bochs启动时开启魔术断点调试功能，然后在程序开始处添加一句xchg bx,bx。当执行到xchg bx,bx指令时就会自动断到Bochsdbg里。

Ctrl+C中断图形化
xp <addr>查看内存

应该将c程序编写为32位的.o文件：
-m32



