### Explanation ###

This directory encompasses the preparation and separation of files, based on chromosomes, needed for SNPgenie within-pool analysis. It contains tool wrappers and a small workflow to split your GTF file, VCF file and FASTA file.

### To-do beforehand ###

The scripts use packages you need to download, if you haven't already.
- `cwltool` and `cwl-runner` https://github.com/common-workflow-language/cwltool#install
- `tabix` (part of HTSlib) http://www.htslib.org/download/
- `vcftools` https://vcftools.github.io/downloads.html

### Instructions ###
To execute a CWL script or workflow, type the following in your command line `cwltool file.cwl file.yml`. 
The CWL workflow is `vcf_split.cwl` and `vcf_split.yml` to split your VCF file based on a specific chromosome, based on the tool wrappers `tabix1.cwl` and `tabix2.cwl`. A small CWL workflow for splitting GTF file based on chromosomes and specific gene IDs is also included `gtf_split_workflow.cwl` and `gtf_split_workflow.yml`. The `split_fasta.cwl` is a tool wrapper for the splitting of your FASTA file based on a specific chromosome.
- `tabix1.cwl`
    - Indexes compressed VCF file. 
    - Modify `vcfgz` in `vcf_split.yml` YAML file to specify which VCF.
    - Outputs `"*.tbi"` in working directory.
- `tabix2.cwl`
    - Generates specific chromosome VCF file based on `chr_string` input from YAML-file. 
    - Modify `file_prefix` in `vcf_split.yml` YAML file to name your file prefix (sample name?) of output file.
    - Modify `chr_string` in `vcf_split.yml` YAML file to name your output file.
    - Outputs `"*.vcf"` in working directory.
- `vcftools_split.cwl`
    - Alternative for the tabix tool wrappers to split VCF from a merged VCF file.
    - Modify `gzvcf` in `vcftools_split.yml` to specify which GZVCF.
    - Modify `chr` in `vcftools_split.yml` to specify which chromosome.
    - Modify `out` in `vcftools_split.yml` to specify output file name (will be named *.recode.vcf).
    - Modify `indv` in `vcftools_split.yml` to specify which sample.
    - Modify the other parameters on integers as you wish.
    - Outputs `*.recode.vcf` and a `*.log` (log file) in working directory.
- `gtf_split.cwl`
    - Generates specific chromosome GTF file (GTF file from `grep2.cwl` of gff2gtf) based on `ch` input from YAML file. 
    - Modify `ch` in `gtf_split_workflow.yml` YAML file to specify your desired chromosome in GTF file
    - Modify `gtfchr_file` in `gtf_split_workflow.yml` YAML file to specify GTF file
    - Outputs `"*.gtf"` in working directory.
- `gtf_split2.cwl`
    - Parses chromosome specific GTF-file (from `gtf_split.cwl`) and returns GTF-file of only specific genes defined in YAML file.
    - Modify `locusid` in YAML file to define specific IDs, needs at least 1 up to 23.
    - Modify `file_name` in YAML file to name your output file.
    - Outputs `<file_name>_filtered.gtf` in working directory.
- `split_fasta.cwl`
    - Splits FASTA sequences from reference FASTA based on input path in `split_fasta.sh`. 
    - Outputs `"*.fasta"` for each chromosome in working directory.
