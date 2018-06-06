### Explanation ###

This directory encompasses the preparation and separation of files, based on chromosomes, needed for SNPgenie within-pool analysis. It contains tool wrappers and a small workflow to split your GTF file, VCF file and FASTA file.

### To-do beforehand ###

The scripts use packages you need to download, if you haven't already.
- `cwltool` and `cwl-runner` https://github.com/common-workflow-language/cwltool#install
- `tabix` (part of HTSlib) http://www.htslib.org/download/

### Instructions ###
To execute a CWL script or workflow, type the following in your command line `cwltool file.cwl file.yml`. 
The CWL workflow is `vcf_split.cwl` and `vcf_split.yml` to split your VCF file based on a specific chromosome, based on the tool wrappers `tabix1.cwl` and `tabix2.cwl`. The others are tool wrappers for the splitting of your GTF and FASTA file based on a specific chromosome.
- `tabix1.cwl`
    - Indexes compressed VCF-file. 
    - Outputs `"*.tbi"` in working directory.
- `tabix2.cwl`
    - Generates specific chromosome VCF-file based on `chr_string` input from YAML-file. 
    - Outputs `"*.vcf"` in working directory.
- `gtfchr.cwl`
    - Generates specific chromosome GTF-file (GTF-file from `grep2.cwl`) based on `ch` input from YAML-file. 
    - Outputs `"*.gtf"` in working directory.
- `split_fasta.cwl`
    - Splits FASTA sequences from reference FASTA based on input path in `split_fasta.sh`. 
    - Outputs `"*.fasta"` for each chromosome in working directory.
