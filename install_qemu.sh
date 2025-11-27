#!/bin/bash
set -e

python3 -m pip install --user distlib


# 2. 安装编译依赖
sudo apt install -y git libglib2.0-dev libfdt-dev libpixman-1-dev zlib1g-dev \
    ninja-build python3 python3-pip libcapstone-dev libspice-server-dev

# 3. 下载 QEMU 源码（这里以 8.1.0 为例，你可以换成最新稳定版）
QEMU_VER=8.1.0
wget https://download.qemu.org/qemu-$QEMU_VER.tar.xz
tar xf qemu-$QEMU_VER.tar.xz
cd qemu-$QEMU_VER

# 4. 配置编译选项
./configure --prefix=/usr/local --target-list=riscv64-softmmu,riscv32-softmmu,aarch64-softmmu,arm-softmmu, x86_64-softmmu --enable-debug

# 5. 编译安装
make -j$(nproc)
sudo make install

# 6. 检查版本
qemu-system-riscv64 --version
