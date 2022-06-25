1. Use *gffread* utility https://github.com/gpertea/gffread to extract coding sequences from the genome based on the genomic coordinates stored in the gff file:

```
gffread -x <cds.fasta> -g <genome.fasta> <gff>
```
2. Use *Transdecoder* https://github.com/TransDecoder to identify open reading frames in previously extracted sequences:

```
TransDecoder.LongOrfs -t CBD_God_Bud_Spice_out.fasta
```


