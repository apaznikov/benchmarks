#
# Setup part
#

PGDLO=$HOME/CLionProjects/pgdlo
FIELD_REORDERING_PLUGIN_DIR=${PGDLO}/build/transforms/lib
BENCH_DIR=${PGDLO}/bench/synth

mkdir build
cd build

cd $BENCH_DIR

#
# Bruteforce part
#

rm -rf temp
cp -r ${BENCH_DIR} temp

FLAGS="-O2"

TESTS="
1:S:abc:100000
3:S:abc:100000
5:Nested:afbc:100000"

RESULTS_DIR="results"

rm -rf ${RESULTS_DIR}
mkdir -p ${RESULTS_DIR}

# BUF_SIZE=300000

for ARRAY in $TESTS
do
    echo ""
    
    ARRAY=$(echo $ARRAY | tr : " ")
    ARRAY=($ARRAY)

    BENCH="SynthBench${ARRAY[0]}"
    STRUCT=${ARRAY[1]}
    FIELDS=${ARRAY[2]}
    BUF_SIZE=${ARRAY[3]}

    for ORDER in $(python3 "${PGDLO}/transforms/clang-plugins-tests/permutations.py" ${FIELDS})
    do
        echo "Running ${BENCH} with order ${ORDER}"
    
        clang -Xclang -load -Xclang ${FIELD_REORDERING_PLUGIN_DIR}/libFieldReordering.so  \
            -Xclang -plugin -Xclang FieldReordering -c temp/${BENCH}.c \
            -Xclang -plugin-arg-FieldReordering -Xclang -struct-name \
            -Xclang -plugin-arg-FieldReordering -Xclang ${STRUCT} \
            -Xclang -plugin-arg-FieldReordering -Xclang -field-order \
            -Xclang -plugin-arg-FieldReordering -Xclang ${ORDER} \
            -Xclang -plugin-arg-FieldReordering -Xclang -alg \
            -Xclang -plugin-arg-FieldReordering -Xclang manual > temp/test.c

        clang ${FLAGS} temp/test.c temp/Dummy.c -o temp/binary

        SYNTH_OUT=`taskset -c 0 ./temp/binary ${BUF_SIZE} | cut -f 2 -d ":" | awk '{$1=$1}1'`

        echo "\"${ORDER}\"; ${SYNTH_OUT}" >> ${RESULTS_DIR}/${BENCH}.txt
    done
done
