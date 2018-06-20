# cwl-master-project
Source code in Common Workflow Language for sharing pipelines between Rijk Zwaan and Naturalis

- bwa directory is the standard pipeline for creating BAM files
- bam2vcf directory is a small workflow to convert BAM files to VCF files (can be used to also generate specific region VCFs with BED files)
- gff2gtf directory is a workflow for converting GFF to GTF format for SNPgenie
- split directory contains a workflow to split FASTA, GTF and VCF files on chromosomes/specific gene IDs for SNPgenie
- snpgenie directory has a tool wrapper for SNPgenie analysis to estimate evolutionary parameters
- revcomp directory includes a Perl script that converts FASTA, GTF and VCF files to reverse complement (for '-' strand)
- cds_extract directory is a workflow for generating a BED file on specific gene IDs
