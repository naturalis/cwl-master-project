
This directory encompasses the extraction of the CDS en intervals from the target sequences.
When using the CWL scripts, make sure to `modify` input file parameters in YAML files.

### To-do beforehand ###

The scripts use packages you need to download, if you haven't already.
- `cwltool` and `cwl-runner` https://github.com/common-workflow-language/cwltool
- `bedtools` http://bedtools.readthedocs.io/en/latest/content/installation.html
- `BEDOPS` http://bedops.readthedocs.io/en/latest/index.html

### Instructions ###
To execute a CWL script or workflow, type the following in your command line `cwltool file.cwl file.yml`. 
The CWL workflow is `cds_extract.cwl` and `cds_extract.yml`. 
The order of the CWL scripts execution is:
 - `gff.cwl`
   - Retrieves GFF information of unique IDs specified in YAML file from GFF file
   - Modify `locusID` in YAML file to specify unique IDs, needs at least 1 parameter up to 23 
   - Modify `gff` in YAML file to add your desired GFF file
 - `gffcds.cwl`
   - Filter above-mentioned GFF file on CDS of IDs.
   - Outputs `cdsfiltered.gff` in working directory.
 - `gff2bed.cwl`
   - Converts filtered GFF file to a BED file with the use of a shell script.
   - Used `gff2bed` command from BEDOPS.
 - `sort.cwl`
   - Sorts the BED file based on chromosome, start and end positions
   - Outputs `allsorted.bed` in working directory.
 - `bedtoolsmerge.cwl`
   - Merges overlaps in BED file for each chromosome in a BED3 format
   - Outputs `allmerged.bed` in working directory
