#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: tabix

inputs:
  vcfgz_file:
    type: File
    secondaryFiles:
      - .tbi
    inputBinding:
      prefix: -h
      position: 2
  file_prefix:
    type: string
    inputBinding:
      position: 3
  chr_string:
    type: string
    inputBinding:
      position: 3

outputs:
  outfile:
    type: stdout

stdout: $(inputs.file_prefix)_$(inputs.chr_string).vcf
