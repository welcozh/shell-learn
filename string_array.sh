#!/bin/bash

str=("142-3" "142-4" "142-5" "69-4")

len=${#str[@]}
echo len = $len

for i in ${str[@]}
do
    echo $i
done

for ((j=0;j<10;j++))
do
    echo j = $j
done

