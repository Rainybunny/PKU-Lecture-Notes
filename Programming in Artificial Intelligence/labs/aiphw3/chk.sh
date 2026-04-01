#!/bin/bash

# nvcc example.cu -o example -std=c++17 -lcublas -DCHECK_SHAPE -O2
# g++ gen.cpp -o gen -O2

while true; do
    ./gen > test.in
    ./example < test.in > test.out
    python example.py < test.in > test.ans
    python cmp.py test.out test.ans
    if [ $? -ne 0 ]; then
        echo "Mismatch found!"
        break
    else
        echo "OK"
    fi
done