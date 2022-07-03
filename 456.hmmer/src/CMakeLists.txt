cmake_minimum_required(VERSION 3.10)
project(bench)

set(Bench hmmer)

#set(CMAKE_C_COMPILER /opt/homebrew/bin/gcc-11)
set(CMAKE_BUILD_TYPE Debug)
set(CMAKE_VERBOSE_MAKEFILE ON)
set(CMAKE_C_FLAGS "-g")

add_executable(${Bench} globals.h display.c histogram.c phylip.c sqio.c stopwatch.h emit.c hmmcalibrate.c plan7.c squid.h
        structs.h a2m.c emulation.c hmmio.c plan9.c squidconf.h tophits.c aligneval.c eps.c hmmsearch.c
        postprob.c squidcore.c trace.c alignio.c fast_algorithms.c hsregex.c prior.c sre_ctype.c translate.c
        alphabet.c file.c iupac.c revcomp.c sre_math.c types.c clustal.c funcs.h masks.c rk.c sre_random.c
        ucbqsort.c cluster.c getopt.c mathsupport.c rk.h sre_random.h vectorops.c gki.c misc.c selex.c
        sre_string.c vectorops.h config.h gki.h modelmakers.c seqencode.c ssi.c weight.c core_algorithms.c
        msa.c shuffle.c ssi.h dayhoff.c gsi.c msa.h sqerror.c stack.c debug.c gsi.h msf.c sqfuncs.h
        stockholm.c)

target_compile_options(${Bench} PRIVATE -g)
target_compile_definitions(${Bench} PUBLIC SPEC_CPU)
target_compile_definitions(${Bench} PUBLIC SPEC_CPU_LINUX)
