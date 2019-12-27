
# This file is a part of MRNIU/SimpleKernel (https://github.com/MRNIU/SimpleKernel).
#
# x86_64-elf-gcc.sh for MRNIU/SimpleKernel.

#!/usr/bin/env bash

if ! [ -x "$(command -v gmp)" ]; then
  echo 'Error: gmp is not installed.'
  exit 1
elif ! [ -x "$(command -v i386-elf-binutils)" ]; then
  echo 'Error: x86_64-elf-binutils is not installed.'
  exit 1
elif ! [ -x "$(command -v libmpc)" ]; then
  echo 'Error: libmpc is not installed.'
  exit 1
elif ! [ -x "$(command -v mpfr)" ]; then
  echo 'Error: mpfr is not installed.'
  exit 1
elif ! [ -x "$(command -v wget)" ]; then
  echo 'Error: wget is not installed.'
  exit 1
elif ! [ -x "$(command -v tar)" ]; then
  echo 'Error: tar is not installed.'
  exit 1
else
  wget https://ftp.gnu.org/gnu/gcc/gcc-9.2.0/gcc-9.2.0.tar.xz
  tar zxvf gcc-9.2.0.tar.xz
  cd gcc-9.2.0
  ./configure \
    --target=x86_64-elf \
    --enable-targets=all \
    --enable-multilib \
    --without-isl \
    --disable-werror \
    --without-headers \
    --with-as=x86_64-elf-as \
    --with-ld=x86_64-elf-ld \
    --enable-languages=c,c++
  make all-gcc
  make install-gcc
  make all-target-libgcc
  make install-target-libgcc
fi
