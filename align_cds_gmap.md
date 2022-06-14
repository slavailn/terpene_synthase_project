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

```
gmap -t 4 -A -D CBD_God_Bud_Spice -d CBD_God_Bud_Spice/ ../coding_sequences/all_tps.fasta > CBD_God_Bud_Spice_gmap_out.txt```
```
Options:
-t N - number of processor cores

-A - print alignments

-D - index directory

-d - genome database









 
