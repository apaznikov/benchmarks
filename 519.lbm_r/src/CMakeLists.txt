cmake_minimum_required(VERSION 3.22)
project(9891SlezkinskiyBench)
set(CMAKE_BUILD_TYPE Debug)

add_executable(519.lbm_r lbm.c main.c)
target_link_libraries(519.lbm_r m)
