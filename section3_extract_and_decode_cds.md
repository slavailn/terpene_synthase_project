1. Use *gffread* utility https://github.com/gpertea/gffread to extract coding sequences from the genome based on the genomic coordinates stored in the gff file:

```
gffread -x <cds.fasta> -g <genome.fasta> <gff>
```
2. Use *Transdecoder* https://github.com/TransDecoder to identify open reading frames in previously extracted sequences:

```
TransDecoder.LongOrfs -t <cds.fasta>
```
This command with create a directory with 4 files:
* base_freqs.dat - base frequencies
* longest_orfs.cds - CDS fasta
* longest_orfs.gff3 - gff file with detected ORFs
* longest_orfs.pep - peptide translation of the detected ORFs


