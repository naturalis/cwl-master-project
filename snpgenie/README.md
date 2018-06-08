### Instructions ###
This tool wrapper targets the within-pool analysis of SNPgenie, which uses 1 pooled sample. You can decide to do a chromosome-wide analysis or a specific gene analysis based on your input files. When using the CWL scripts, make sure to `modify` input file parameters in YAML files. 

### Explanations ###
- `snpgenie.cwl` 
    - Executes `snpgenie.pl` for dnds ratio on pooled data. (source: https://github.com/chasewnelson/snpgenie)
    - It only accepts 1 input sequence, hence the need to split everything.
    - It uses input files from the `split` directory, meaning you have to specify the paths to these files in the YAML-file.
        - Do note that the syntax commands are without space between "=" and input! (e.g. --vcfformat=3, --fastafile=/path/to/*.fasta)
    - VCF-format is most likely 3 (see https://github.com/chasewnelson/snpgenie#vcf)
    - Outputs `SNPGenie_Results` directory with results in .txt files.
        - Rename the output directory if you want to do another SNPgenie analysis in the same working directory.
