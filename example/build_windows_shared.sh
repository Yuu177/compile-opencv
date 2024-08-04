#!/bin/bash
set -e

root_path=$(pwd)

build_dir=build/windows_shared
# rm -rf ${build_dir}
mkdir -p ${build_dir}
cd ${build_dir}

cmake \
    -DPLATFORM="windows_shared" \
    -DCMAKE_TOOLCHAIN_FILE=${root_path}/../cmake/mingw-toolchain-x86_64.cmake \
    ${root_path}

make -j7
