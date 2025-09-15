cmake_minimum_required(VERSION 3.10)
project(libtorch_example)

set(CMAKE_CXX_STANDARD 17)
# 把下面路径替换成你解压 libtorch 的路径
set(CMAKE_PREFIX_PATH "/home/lyjy/libtorch_cuda/libtorch")  

find_package(Torch REQUIRED)
add_executable(main main.cpp)
target_link_libraries(main "${TORCH_LIBRARIES}")
set_property(TARGET main PROPERTY CXX_STANDARD 17)
