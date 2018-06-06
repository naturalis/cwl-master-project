
This directory encompasses the extraction of the CDS en intervals from the target sequences.
As always, when using the CWL scripts or workflow, make sure to `modify` path locations of file names in YAML files.

### To-do beforehand ###

The scripts use packages you need to download, if you haven't already.
- `cwltool` and `cwl-runner` https://github.com/common-workflow-language/cwltool
- `bedtools` http://bedtools.readthedocs.io/en/latest/content/installation.html

### Instructions ###
To execute a CWL script or workflow, type the following in your command line `cwltool file.cwl file.yml`. 
The CWL workflow is `cds_extract.cwl` and `cds_extract.yml`. 
The order of the CWL scripts execution is:
 - `gff.cwl`
   - Retrieves GFF information of unique IDs (up to 23 IDs) specified in YAML file from GFF file
 - `gffcds.cwl`
   - Filter above-mentioned GFF file on CDS of IDs.
   - Outputs `cdsfiltered.gff` in working directory.
 - `gff2bed.cwl`
   - Converts filtered GFF file to a BED file with the use of a shell script.
 - `sort.cwl`
   - Sorts the BED file based on chromosome, start and end positions
   - Outputs `allsorted.bed` in working directory.
 - `bedtoolsmerge.cwl`
   - Merges overlaps in BED file for each chromosome in a BED3 format
   - Outputs `allmerged.bed` in working directory
