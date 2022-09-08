#! /bin/bash
# This script creates a gmap index for every cultivar assembly
# stored in scaffolds/ directory

GENOME_DIR=$1 # directory with assembled cultivar genomes
INDEX_DIR=$2 # set index directory
for genome_fasta in $GENOME_DIR/*.fa # loop over fasta files with scaffolds
do
    genome_name=`basename $genome_fasta` # trim the path and leave only the file name
    genome_name=${genome_name%_scaffold.fa} # trim from the end of the filename to leave only a cultivar id
    genome_name=${genome_name##*.} # trim from the start of the filename to leave only a cultivar id
    echo $genome_name # print cultivar id to screen
    gmap_build -D $genome_name --dir $INDEX_DIR --genomedb $genome_name $genome_fasta # build an index for cultivar in gmap_indexes directory

done

# USAGE: nohup ./create_indexes.sh path/to/scaffold path/to/gmap_indexes &
