#!/usr/bin/env bash


# =========================================================
# 32 位 RISC-V bare-metal GCC 工具链

# 用途：用于编译不依赖操作系统的程序（裸机程序），比如 xv6-riscv、FPGA 上的 RISC-V 核心实验代码。
# =========================================================



set -e

TAG="rv32i-4.0.0"   # 可按需要换成 riscv64-unknown-elf 的 tag
ASSET="riscv32-unknown-elf.gcc-12.1.0.tar.gz"
URL="https://github.com/stnolting/riscv-gcc-prebuilt/releases/download/${TAG}/${ASSET}"
INSTALL_DIR="/opt/riscv"

echo "Downloading ${ASSET} ..."
wget -O /tmp/${ASSET} "${URL}"

echo "Extracting to ${INSTALL_DIR} ..."
sudo mkdir -p "${INSTALL_DIR}"
sudo tar -xzf /tmp/${ASSET} -C "${INSTALL_DIR}"
sudo chmod -R a+rX "${INSTALL_DIR}"

if ! grep -q "${INSTALL_DIR}/bin" ~/.bashrc; then
  echo "export PATH=${INSTALL_DIR}/bin:\$PATH" >> ~/.bashrc
fi
source ~/.bashrc

echo "Installed. Version:"
riscv32-unknown-elf-gcc --version || riscv64-unknown-elf-gcc --version || true
echo "Done."
