#! /bin/bash

# This script maps terpene synthase CDS sequences to the collection of cultivar genomes
# The genomes indexes are located in the same directory

GMAP_INDEX_DIR=$1 # directory with genome indexes
PATH_TO_CDS=$2 # path the fasta file with transcripts to map

for CULTIVAR_INDEX in $GMAP_INDEX_DIR/* # loop over indexes, each index has its own directory
do
    CULTIVAR_ID=`basename $CULTIVAR_INDEX`
    echo $CULTIVAR_ID # Get cultivat name
    gmap -t 4 -A -D $GMAP_INDEX_DIR/$CULTIVAR_ID -d $CULTIVAR_ID $PATH_TO_CDS > $CULTIVAR_ID.align.txt # map and output alignments
    gmap -t 4 --format=gff3_gene -D $GMAP_INDEX_DIR/$CULTIVAR_ID -d $CULTIVAR_ID $PATH_TO_CDS > $CULTIVAR_ID.align.gff # map and output gff files


done

# Run command:
# ./map_cds_gmap.sh path/to/gmap_indexes path/to/cds 
