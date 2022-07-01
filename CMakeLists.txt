cmake_minimum_required(VERSION 3.10)
project(benchmarks)
set(CMAKE_BUILD_TYPE Debug)

set(CMAKE_VERBOSE_MAKEFILE ON)

include_directories(505.mcf_r/src)
add_subdirectory(505.mcf_r/src)

include_directories(519.lbm_r/src)
add_subdirectory(519.lbm_r/src)

include_directories(531.deepsjeng_r/src)
add_subdirectory(531.deepsjeng_r/src)
