#!/bin/bash
set -e

# set toolchains
export PATH=/opt/toolchains/gcc-arm-10.3-2021.07-x86_64-aarch64-none-linux-gnu/bin:$PATH
aarch64-none-linux-gnu-g++ -v

root_path=$(pwd)

build_dir=build/aarch64_linux
# rm -rf ${build_dir}
mkdir ${build_dir}
cd ${build_dir}

cmake \
    -DBUILD_SHARED_LIBS=OFF \
    -DCMAKE_CXX_COMPILER=aarch64-none-linux-gnu-g++ \
    -DCMAKE_C_COMPILER=aarch64-none-linux-gnu-gcc \
    -DCMAKE_TOOLCHAIN_FILE=${root_path}/opencv-4.10.0/platforms/linux/aarch64-gnu.toolchain.cmake \
    -DCMAKE_BUILD_TYPE="Release" \
    ${root_path}/opencv-4.10.0

make -j7
