1. Align known terpene synthase sequences to assembled cultivar genomes. Here, we will use Exonerate https://www.ebi.ac.uk/about/vertebrate-genomics/software/exonerate-manual to align coding sequences to the genome while allowing large gaps to account for introns.

Since the fasta files with cdna sequences were created under Windows, we will need to remove carriage returns, otherwise Exonerate will not read them.

We will use *sed* to modify files in place with -i option:
```
 sed -i 's/\r//g'  <transcript.fasta>
```

Align transcript sequences (spliced) to the assembled genomes:
```
exonerate --query <transcript> --querytype DNA --target <reference_genome> --targettype DNA --model cdna2genome --showalignment no --showvulgar no --showtargetgff no --ryo "%qi\t%ti\t%qab\t%qae\t%tab\t%tae\n" --minintron 10 --maxintron 1500 | head 
```





 
