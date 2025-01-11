#!/bin/bash
# works for ubuntu2204
# clone with sub module and not clone git history,only clone for build riscv-gnu-toolchain
git clone --depth 1 https://github.com/riscv/riscv-gnu-toolchain
cd riscv-gnu-toolchain
git submodule init
git submodule update --depth 1
# --depth 1 option only the latest commit in the history.
cd ./riscv-gnu-toolchain
sudo apt-get install autoconf automake autotools-dev curl python3 python3-pip libmpc-dev libmpfr-dev libgmp-dev gawk build-essential bison flex texinfo gperf libtool patchutils bc zlib1g-dev libexpat-dev ninja-build git cmake libglib2.0-dev -y
sudo mkdir -p /opt/riscv/bin
sudo chmod 777 /opt/riscv/bin
echo 'export PATH=$PATH:/opt/riscv/bin' >>~/.bashrc
source ~/.bashrc
# above not good.

# do this: will let make qemu work.
sudo apt-get install git build-essential gdb-multiarch qemu-system-misc gcc-riscv64-linux-gnu binutils-riscv64-linux-gnu -y

# quit qemu:
If you are running with nographic options below option worked for me

step 1:

Cntrl + a
Step 2

press c

Step 3

write quit
#


这个也行： 
```
sudo apt install binutils-riscv64-linux-gnu gcc-riscv64-linux-gnu gdb-multiarch qemu-system-misc opensbi u-boot-qemu qemu-utils -y 
```