cmake_minimum_required(VERSION 3.18)
project(cuckoo) # Replace 'my_project' with the name of your project

#根据CMAKE的版本不同设置一个DEV_MODULE的值，这里的作用是基于CMAKE对于py包的查找在3.18这个版本做了重大改进
if (CMAKE_VERSION VERSION_LESS 3.18)
  set(DEV_MODULE Development)
else()
  set(DEV_MODULE Development.Module)
endif()

find_package(Python 3.8 COMPONENTS Interpreter ${DEV_MODULE} REQUIRED)

#添加以下几行代码。这些代码会将 CMake 配置为默认执行优化的发布构建，除非指定了其他构建类型。如果不添加这些代码，绑定代码可能会运行缓慢并生成较大的二进制文件。
if (NOT CMAKE_BUILD_TYPE AND NOT CMAKE_CONFIGURATION_TYPES)
  set(CMAKE_BUILD_TYPE Release CACHE STRING "Choose the type of build." FORCE)
  set_property(CACHE CMAKE_BUILD_TYPE PROPERTY STRINGS "Debug" "Release" "MinSizeRel" "RelWithDebInfo")
endif()

#如果您将 nanobind 安装为 Pip 或 Conda 包，请在 CMakeLists.txt 的末尾添加以下几行。它们会查询包以确定其安装路径，然后将其导入
execute_process(
  COMMAND "${Python_EXECUTABLE}" -m nanobind --cmake_dir
  OUTPUT_STRIP_TRAILING_WHITESPACE OUTPUT_VARIABLE nanobind_ROOT)
find_package(nanobind CONFIG REQUIRED)

nanobind_add_module(cuckoo cpp/cuckoo.cpp)