#!/bin/bash
set -e

root_path=$(pwd)
build_dir=build/x86_64_linux
# rm -rf ${build_dir}
mkdir -p ${build_dir}
cd ${build_dir}

cmake \
    -DPLATFORM="x86_64_linux" \
    ${root_path}

make
