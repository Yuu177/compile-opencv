cmake_minimum_required(VERSION 3.10)
project(OpenCVExample)

# 设置 OpenCV 的路径
set(OpenCV_DIR "${CMAKE_SOURCE_DIR}/../build/${PLATFORM}")
if (PLATFORM STREQUAL "aarch64_linux")
    set(CMAKE_EXE_LINKER_FLAGS "-static")
endif()

# 查找 OpenCV 包
find_package(OpenCV REQUIRED)
# 包含 OpenCV 头文件
include_directories(${OpenCV_INCLUDE_DIRS})
add_executable(OpenCVExample main.cpp)
# 链接 OpenCV 库
target_link_libraries(OpenCVExample pthread ${OpenCV_LIBS})
