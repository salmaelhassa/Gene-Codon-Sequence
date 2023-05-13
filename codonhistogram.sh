#!/bin/bash
NumArgs=$#
if [ $NumArgs == 0 ]; then
echo usage:
echo "codonhistogram <dnafile>"
exit -1
fi

FILE=$1
if [ ! -f $FILE ]; then
echo "$FILE doesn't exist. Please proper the correct file."
exit -1;
fi

count=0
newline=false
while read -n1 c; do
if [ "$newline" == "true" ]; then
echo "FILE corrupted"
exit -1
fi
if [ "$c" != "a" -a "$c" != "c" -a "$c" != "g" -a "$c" != "t" ]; then
if [ "$c" == "" ]; then
newline=true
fi
else
count=$((count+1))
fi
done < $FILE

echo "Number of characters : " $count
declare -A dna_array

ModCodons=$(($count % 3))
if [ $ModCodons != 0 ]; then
echo "Corrupted sequence; Not a multiple of 3"
exit -1
fi
NumCodons=$(($count / 3))
idx=0
while read -n3 codon; do
echo $codon
dna_array[$codon]=$((${dna_array[$codon]} + 1))
idx=$((idx+1))
if [ "$idx" == "$NumCodons" ]; then
break;
fi
done < $FILE


for key in "${!dna_array[@]}";
do echo "$key" : ${dna_array[$key]};
done | sort -k3,3rn -k1,1



