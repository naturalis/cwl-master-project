### Explanation ###

This directory encompasses the conversion of your GFF file to GTF format and filters all codon sites that are not multiple by 3.
As always, when using the CWL scripts, make sure to `modify` path locations of file names in YAML files. Or, if you have the scripts in your working directory, specify only the script name with extension.

### To-do beforehand ###

The scripts use packages you need to download, if you haven't already.
- `cwltool` and `cwl-runner` https://github.com/common-workflow-language/cwltool

### Instructions ###
To execute a CWL script or workflow, type the following in your command line `cwltool file.cwl file.yml`. 
The CWL workflow is `snpworkflow.cwl` and `snpworkflow.yml`. The order of the CWL scripts execution is:
- `gff2gtf.cwl`
    - This converts your existing reference GFF-file to GTF-file (needed for SNPgenie) with a Perl script (`gff2gtf.pl, source: https://github.com/chasewnelson/CHASeq`). 
    - Modify `gff_file` in YAML file to specify your desired GFF file.
    - Outputs `'*_converted.gtf'` in workflow.
- `grep1.cwl`
    - Retrieves all entries with CDS in lines.
- `awk1.cwl`
    - Calculates the difference of end and start coordinates, adds +1 position and specifies associated gene IDs.
- `awk2.cwl`
    - Retrieve all codon lines that are not multiple by 3 and specifies associated gene IDs.
- `sort.cwl`
    - Sorts gene IDs so there are no duplicates. 
    - Modify `gene_list` in YAML file to specify output txt file name.
    - Outputs `*.txt` in workflow.
- `grep2.cwl`
    - Excludes all gene IDs that have a matching line in `*.txt` (from `sort.cwl`). 
    - Modify `filtered_gene_list` in YAML file to specify output GTF file name.
    - Outputs `*.gtf` in workflow.
