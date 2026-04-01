#!/bin/bash

flags="-Og -std=c11 -masm=att"

gcc $flags -D data_t=__u32 -D IDENT=0 -D OP=+ demo.c -o demo_int_add
gcc $flags -D data_t=__u32 -D IDENT=1 -D OP=\* demo.c -o demo_int_mul
gcc $flags -D data_t=double -D IDENT=0.0 -D OP=+ demo.c -o demo_double_add
gcc $flags -D data_t=double -D IDENT=1.0 -D OP=\* demo.c -o demo_double_mul

printf "\n\n=== Integer Addition ===\n"
./demo_int_add

printf "\n\n=== Integer Multiplication ===\n"
./demo_int_mul

printf "\n\n=== Double Addition ===\n"
./demo_double_add

printf "\n\n=== Double Multiplication ===\n"
./demo_double_mul
