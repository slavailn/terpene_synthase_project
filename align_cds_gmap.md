Align known terpene synthase sequences to assembled cultivar genomes. Here, we will use GMAP http://research-pub.gene.com/gmap/ to align coding sequences to the genome while allowing large gaps to account for introns.

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
gmap_build -D <cultivar_genome_name> -d <cultivar_genome_name>
```
Options:

-D - creates an output directory for index files under the specified names.

-d - suffix that wil be added to index files.

```
exonerate --query <transcript> --querytype DNA --target <reference_genome> --targettype DNA --model cdna2genome --showalignment no --showvulgar no --showtargetgff no --ryo "%qi\t%ti\t%qab\t%qae\t%tab\t%tae\n" --minintron 10 --maxintron 1500 | head 
```





 
