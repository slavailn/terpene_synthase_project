#! /bin/bash

# Run transdecoder on extracted sequences to
# obtain protein sequences

CDS_DIR=$1 #full path to the folder with extracted CDS

for CDS_FILE in $CDS_DIR/*.cds.fasta
do
     TransDecoder.LongOrfs -t $CDS_FILE
done
