set confirm off
set architecture riscv:rv64
# target remote 127.0.0.1:25000
symbol-file kernel/kernel
set disassemble-next-line auto
set riscv use-compressed-breakpoints yes
add-auto-load-safe-path /root/code/xv6-riscv/.gdbinit
# 启动立即暂停
starti 
