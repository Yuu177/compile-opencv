# Compile OpenCV

本仓库主要介绍 Linux 平台上编译 OpenCV 源码到主流的平台

## Compilation build

| Host                | Target               | Script                                    |
| ------------------- | -------------------- | ----------------------------------------- |
| Ubuntu-20.04-x86_64 | Ubuntu-20.04-x86_64  | build.sh                                  |
| Ubuntu-20.04-x86_64 | Ubuntu-16.04-aarch64 | build_aarch64_linux.sh                    |
| Ubuntu-20.04-x86_64 | Windows              | build_windows.sh, build_windows_shared.sh |

在仓库根目录下执行对应的 build 脚本编译不同平台的 OpenCV

## Example

验证编译好的 OpenCV 库是否可用

```bash
cd example
./build.sh
```

## Compilation Guide

### Installation in Linux

https://docs.opencv.org/4.x/d7/d9f/tutorial_linux_install.html?ref=wasyresearch.com

### Cross compilation for ARM based Linux systems

https://docs.opencv.org/4.x/d0/d76/tutorial_arm_crosscompile_with_cmake.html

- 运行报错

```bash
./OpenCVExample: /lib/aarch64-linux-gnu/libm.so.6: version `GLIBC_2.27' not found (required by ./OpenCVExample)
./OpenCVExample: /lib/aarch64-linux-gnu/libm.so.6: version `GLIBC_2.29' not found (required by ./OpenCVExample)
./OpenCVExample: /lib/aarch64-linux-gnu/libc.so.6: version `GLIBC_2.33' not found (required by ./OpenCVExample)
./OpenCVExample: /usr/lib/aarch64-linux-gnu/libstdc++.so.6: version `GLIBCXX_3.4.26' not found (required by ./OpenCVExample)
```

使用静态链接解决问题：`set(CMAKE_EXE_LINKER_FLAGS "-static")` 

### Cross compilation for Windows based Linux systems

- 安装 MinGW 交叉编译工具链

```bash
sudo apt-get update
sudo apt-get install mingw-w64
```

使用 `x86_64-w64-mingw32-g++ -v` 命令查看是否安装成功。

- `x86_64-w64-mingw32-g++` 和 `x86_64-w64-mingw32-g++-posix` 区别

  - `x86_64-w64-mingw32-g++` 使用的是 Win32 线程模型。这是 Windows 原生的线程模型，直接使用 Windows API 来管理线程。


  - `x86_64-w64-mingw32-g++-posix` 使用的是 POSIX 线程模型（也称为 pthreads）。这种模型在 POSIX 标准下定义，虽然在 Windows 上并不是原生支持，但通过 MinGW-w64 提供的兼容层可以使用。


- 交叉编译 Windows 的 OpenCV 动态库（`.dll`）不在 lib 目录，而是在 bin 目录下。
