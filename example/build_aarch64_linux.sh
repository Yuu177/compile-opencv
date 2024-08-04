#!/bin/bash
set -e

root_path=$(pwd)

build_dir=build/aarch64_linux
# rm -rf ${build_dir}
mkdir -p ${build_dir}
cd ${build_dir}

cmake \
    -DPLATFORM="aarch64_linux" \
    -DCMAKE_TOOLCHAIN_FILE=${root_path}/../cmake/gcc-toolchain-aarch64-linux.cmake \
    ${root_path}

make -j7
