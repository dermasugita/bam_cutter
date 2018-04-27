#!/bin/bash
# This script cuts bam file from top to $2 rows.
# $1 : path to the input file and its name
# $2 : number of row you want to cut to

input=$1
row=$2 

if [ ! -e output ]; then
	mkdir output
fi
touch ./output/cutted.sam

sam_header=`samtools view -H $input`
sam_body=`samtools view $input | head -n $row`

echo -e "$sam_header$sam_body" > ./output/cutted.sam

samtools view -bS  ./output/cutted.sam > ./output/cutted.bam

rm ./output/cutted.sam
