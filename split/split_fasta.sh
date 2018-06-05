#!/bin/bash

while read line
do
    if [[ ${line:0:1} == '>' ]]
    then
        outfile=${line#>}.fa
        echo $line > $outfile
    else
        echo $line >> $outfile
    fi
done < /home/CHT/tomatodata/reference/S_lycopersicum_chromosomes.2.50.fa
