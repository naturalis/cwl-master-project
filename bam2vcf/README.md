### To-do beforehand ###

The scripts use packages you need to download, if you haven't already.
- `cwltool` and `cwl-runner` https://github.com/common-workflow-language/cwltool
- `samtools` and `bcftools` https://github.com/samtools/bcftools/wiki/HOWTOs#install
  - Need to be same version!

### Instructions ###
The CWL workflow is `workflow.cwl` and `workflow.yml`. 
 - `samtoolsmpileup.cwl`
   - Creates BCF file from reference genome, (BED if for specific sequences) and BAM file as preparation for bcftools
 - `bcftools.cwl`
   - Creates VCF file from BCF file 
