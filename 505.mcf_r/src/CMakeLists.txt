cmake_minimum_required(VERSION 3.22)
project(benchmarks)
set(CMAKE_BUILD_TYPE Debug)

add_executable(505.mcf_r implicit.c mcf.c mcfutil.c output.c pbeampp.c pbla.c pflowup.c psimplex.c pstart.c readmin.c spec_qsort.c treeup.c)
target_compile_options(505.mcf_r PRIVATE -g)
