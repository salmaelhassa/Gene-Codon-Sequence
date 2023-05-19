# Gene-Codon-Sequence

Idea 2, phylogenetics: compare RNA (DNA?) of different (micro)organisms

So for this code, each line is saved into a separate file and they are then moved from being read from horizontal to vertical so that it is read as a proper sequence. 
Then this is saved in 2 files which are compared using cmp. This code is adaptable and can be rearranged to read genomic sequences (dna/rna). 
This code can be used to compare two files - two files as in sets of different RNA/DNA. 



#!/bin/bash

dnafile1=$2
dnafile2=$3

# i used an if and else statement to give two different outputs for two different inputs - 
# in this case the files are defined as command line arguments or positional parameters - $1 and $2.
# cmp is the command that uses unix operating system. it compares two files of any type
# /n this is the newline character it is used to indicate the end of a line of text - since this is the end of the sentence

if cmp -s "$dnafile1" "$dnafile2"; then
    printf 'The file "dnafile1" is the same as "dnafile2"\n' "$dnafile1" "$dnafile2"
else
    printf 'The file "dnafile1" is different from "dnafile2"\n' "$dnafile1" "$dnafile2"
fi
