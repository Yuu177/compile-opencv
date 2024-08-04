#!/bin/bash
set -e

root_path=$(pwd)

build_dir=build/x86_64_linux
# rm -rf ${build_dir}
mkdir -p ${build_dir}
cd ${build_dir}

# BUILD_SHARED_LIBS=OFF 默认编译为动态库
cmake \
      -DBUILD_SHARED_LIBS=OFF \
      -DCMAKE_BUILD_TYPE=Release \
      ${root_path}/opencv-4.10.0

make -j7
