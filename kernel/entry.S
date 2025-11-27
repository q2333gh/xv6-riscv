        # qemu -kernel loads the kernel at 0x80000000
        # and causes each hart (i.e. CPU) to jump there.
        # hart = Hardware Thread: 直接就是指cpu某个具体物理核心.
        # kernel.ld causes the following code to
        # be placed at 0x80000000.
.section .text #  链接器指令:   this is a text section,its called "text" , but its actually a code(executable) section. linker will make this purpose work~
.global _entry #  链接器指令:   this is a global symbol,and global means it can be used by other files(.global is parse by linker,linker make "global" purpose work~).

# set every cpu's stack pointer:
_entry: #   _entry    # 内核入口点, _  means its sys level.

        # set up a stack for C, and store it on a piece of memory.

        # stack0 is declared in start.c,
        # with a 4096-byte stack per CPU.
        # sp = stack0 + ((hartid + 1) * 4096)
        la sp, stack0
        li a0, 1024*4
        csrr a1, mhartid
        addi a1, a1, 1
        mul a0, a0, a1
        add sp, sp, a0
        # jump to start() in start.c
        # 3. 跳转到C代码并防止返回
        call start            # | 相当于C:
                              # | start();
                              # | if start() return. means its fatal.goto infinite safe loop. not to let cpu do random things. 这是一种防御性编程的实践，确保即使出现异常情况，系统也能保持在一个可控状态。
spin:
        j spin                # | while(1);