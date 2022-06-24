Align known terpene synthase sequences to assembled cultivar genomes. Here, we will use GMAP http://research-pub.gene.com/gmap/ to align coding sequences to the genome while allowing large gaps to account for introns.

Useful info about GMAP:
* Slides - http://research-pub.gene.com/gmap/paper/demo-slides.pdf
* Github - https://github.com/juliangehring/GMAP-GSNAP

1. First, we will concatenate all cds fasta files:
```
cat *.fa > all_tps.fasta
```
This command assumes all transcript fasta files have the *.fa* extension and are located in the same directory.
Since the fasta files with cdna sequences were created under Windows, we will need to remove carriage returns, otherwise GMAP will not read them.

2. We will use *sed* to modify files in place with -i option:
```
sed -i 's/\r//g'  transcript.fasta
```

3. Align transcript sequences (spliced) to the assembled genomes with GMAP.

First we need to build GMAP indexes for each of the assembled genomes.
```
gmap_build -D <cultivar_genome_name> -d <cultivar_genome_name> <genome.fasta>
```
Options:

-D - creates an output directory for index files under the specified names.

-d - suffix that wil be added to index files.

Map the transcripts and output alignments:

```
gmap -t 4 -A -D <index_directory> -d <genome_name> <cds.fasta> > <gmap_out.txt>
```
Options:

-t N - number of processor cores

-A - print alignments

-D - index directory

-d - genome database

This variation of the command will map the transcripts and output the gff files with exon coordinates:

```
gmap -t 4 --format=gff3_gene -D <index_directory> -d <genome_name> <cds.fasta> > <gmap_out.gff>
```
Once, the gff file are ready you can view the transcripts using the IGV genomic browser: https://software.broadinstitute.org/software/igv/download 

IGV user guide: https://software.broadinstitute.org/software/igv/UserGuide

Load the appropriate genome assembly as a reference along with the correspoding gff file and view the transcript mappings. 








 
