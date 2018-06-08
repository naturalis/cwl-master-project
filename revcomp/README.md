You want to convert a VCF SNP report file, along with its accompanying FASTA file and GTF file, to the reverse complement strand. 

This script will create a '-' strand (reverse complement) version of each file in the working directory, with "_revcom" concatenated to the original file name. Here's an example:

`Perl vcf2revcom.pl <my_reference_sequence.fasta> <my_cds_file.gtf> <my_snp_report.vcf>`

Source: https://github.com/chasewnelson/CHASeq
