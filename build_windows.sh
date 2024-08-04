#!/bin/bash
set -e

root_path=$(pwd)

build_dir=build/windows
# rm -rf ${build_dir}
mkdir -p ${build_dir}
cd ${build_dir}

# BUILD_SHARED_LIBS=OFF 默认编译为动态库
cmake \
      -DBUILD_SHARED_LIBS=OFF \
      -DCMAKE_TOOLCHAIN_FILE=${root_path}/cmake/mingw-toolchain-x86_64.cmake \
      -DCMAKE_BUILD_TYPE=Release \
      ${root_path}/opencv-4.10.0

make -j7
