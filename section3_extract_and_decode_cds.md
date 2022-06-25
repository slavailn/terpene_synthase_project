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

3. Increase the sensitivity of transdecoder searches by retaining the transcripts with homology to known proteins and functional domains.
First we will need to download Uniprot database in fasta format from https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/ directory:

```
wget https://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/uniprot_sprot.fasta.gz
gunzip uniprot_sprot.fasta.gz
```
Create BLAST database index in the same directory as uniprot_sprot.fasta file:
```
makeblastdb -in uniprot_sprot.fasta -input_type fasta -dbtype prot
```
Determine homology with BlastP:
```
blastp -query <longest_orfs.pep> -db <uniprot_sprot.fasta>  -max_target_seqs 1 -outfmt 6 -evalue 1e-5 -num_threads 4 > <blastp.outfmt6>
```






