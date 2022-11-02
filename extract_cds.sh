#! /bin/bash

# Extract transcript sequences (cds only) from cultivar genomes
# using gffread

SCAFFOLD_DIR=$1 # directory with cultivar genomes
ALIGNED_DIR=$2 # path to the directory with gmap alignments of transcripts to cultivar genomes

for SCAFFOLD in $SCAFFOLD_DIR/*
do
    SCAFFOLD_NAME=`basename $SCAFFOLD`
    SCAFFOLD_NAME=${SCAFFOLD_NAME%_scaffold.fa}
    SCAFFOLD_NAME=${SCAFFOLD_NAME##*.}

    for GFF_FILE in $ALIGNED_DIR/*.gff
    do
        GFF_NAME=`basename $GFF_FILE`
        GFF_NAME=${GFF_NAME%.align.gff}
        if [[ $SCAFFOLD_NAME == $GFF_NAME ]];
        then
              gffread -x $GFF_NAME.cds.fasta -g $SCAFFOLD $GFF_FILE;
        fi
    done
done
