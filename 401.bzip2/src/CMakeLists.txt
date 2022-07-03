cmake_minimum_required(VERSION 3.10)
project(pgdlo)

set(Bench bzip2)

set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_C_FLAGS "-g")

add_executable(${Bench} blocksort.c bzip2.c bzlib.c bzlib.h
               bzlib_private.h compress.c crctable.c decompress.c
               huffman.c randtable.c spec.c spec.h)

target_compile_options(${Bench} PRIVATE -g)
target_compile_definitions(${Bench} PUBLIC SPEC_CPU)
target_compile_definitions(${Bench} PUBLIC SPEC_CPU_LINUX)
