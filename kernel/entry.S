        # qemu -kernel loads the kernel at 0x80000000
        # and causes each hart (i.e. CPU) to jump there.
        # hart = Hardware Thread
        # kernel.ld causes the following code to
        # be placed at 0x80000000.
.section .text #  链接器指令:   this is a text section
.global _entry #  链接器指令:   this is a global symbol
_entry: #   _entry    # 内核入口点, _  means its sys level.

        # set up a stack for C.
        # stack0 is declared in start.c,
        # with a 4096-byte stack per CPU.
        # sp = stack0 + (hartid * 4096)
        la sp, stack0         # |
        li a0, 1024*4         # | 相当于C:
                              # sp = &stack0;
                              # stack_size = 4096;  每个CPU 4KB栈空间
        # 2. 计算当前CPU的栈位置
        csrr a1, mhartid      # |
        addi a1, a1, 1        # | 相当于C:
        mul a0, a0, a1        # | offset = 4096 * (hart_id + 1);
        add sp, sp, a0        # | sp += offset;
        # jump to start() in start.c
        # 3. 跳转到C代码并防止返回
        call start            # | 相当于C:
spin:                 # | start();
        j spin        # | while(1);
