### Explanation ###

This directory encompasses the conversion of your GFF file to GTF format and filters them on CDS.
When using the CWL scripts, make sure to `modify` parameters of input files in YAML files when needed.

### To-do beforehand ###

The scripts use packages you need to download, if you haven't already.
- `cwltool` and `cwl-runner` https://github.com/common-workflow-language/cwltool
- `gffread` from `cufflinks` http://cole-trapnell-lab.github.io/cufflinks/install/ (this link will provide a pre-compired binary release, instead of building Cufflinks from scratch)

### Instructions ###
To execute a CWL script or workflow, type the following in your command line `cwltool file.cwl file.yml`. 
The CWL workflow is `snpworkflow.cwl` and `snpworkflow.yml`. The order of the CWL scripts execution is:
- `gff2gtf2.cwl`
    - This converts your existing reference GFF-file to GTF-file (needed for SNPgenie) with gffread.
    - Modify `gff_file` in YAML file to specify your desired GFF file.
    - Outputs `'converted.gtf'` in workflow.
- `grep1.cwl`
    - Filters and retrieves all entries with CDS in lines.
    - Outputs `'only_CDS.gtf` in workflow.
