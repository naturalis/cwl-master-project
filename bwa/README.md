### Beforehand ###

- Enable virtualenv
- Download cwltool and cwl-runner at https://github.com/common-workflow-language/cwltool
- Download bwa module at https://sourceforge.net/projects/bio-bwa/files/ 
- Download samtools module at http://www.htslib.org/
- Download Pysam module at https://github.com/pysam-developers/pysam (needed for mapDamage)
- Execution of a CWL file is as follows: `cwltool` <`file.cwl`> <`file.yml`>

### Explanations ###
The BWA pipeline encompasses the standard pipeline of bwa and samtools to generate a filtered and sorted BAM file. The CWL workflow is named `bwaworkflow2.cwl` with the input YAML file `bwainput2.yml`.
The order of execution of the pipeline is as follows:

- `bwaindex.cwl`
  - Indexes your reference FASTA file based on is/bwtsw algorithm
  - Algorithm can be changed by modifying `algorithm` parameter in the YAML file `bwainput2.yml` (when using CWL workflow) or `bwaindex.yml` when using it as a stand-alone tool wrapper.
- `bwamem.cwl`
  - Uses indexed reference FASTA file and map them with your paired FASTQ reads
  - Generates SAM file
  - Modify associated YAML file `bwainput2.yml` or `bwamem.yml` to specify paths to files and file name of SAM output
- `samtoolsview.cwl` 
  - Generates filtered BAM file from SAM file
  - Modify associated YAML file `bwainput2.yml` or `samtoolsview.yml` to specify paths to files and file name of filtered BAM output
- `samtoolssort.cwl`
  - Sort your filtered BAM file
  - Modify associated YAML file `bwainput2.yml` or `samtoolssort.yml` to specify paths to files and file name of sorted BAM output
- `samtoolsindex.cwl`
  - Indexes your sorted BAM file
  - Modify associated YAML file `bwainput2.yml` or `samtoolsindex.yml` to specify path to sorted BAM output
- `mapdamage.cwl`
  - Quantifies DNA damage patterns among ancient DNA sequencing reads 
  - Modify associated YAML file `bwainput2.yml` or `mapdamage.yml` to specify paths and file name of directory output

### Notes ###

- Scripts works only for 1 paired end reads at a time!
- When using the CWL workflow `bwaworkflow2.cwl`, you only need to modify the YAML file `bwainput2.yml` for your input / file naming.
- When using the CWL workflow `bwaworkflow2.cwl`, make sure you have the tool wrappers (individual CWL scripts) in the same working directory.
- When wanting to use a specific tool as a stand-alone, use `cwltool` with associated CWL and YAML file instead. Of course, modify the YAML file on path specification and output file naming if needed.
