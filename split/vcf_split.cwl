#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  vcf:
    type: string
  vcfgz:
    type: File
  chr_string:
    type: string

outputs:
  outfile1:
    type: File
    outputSource: tabix2/outfile

steps:
  tabix1:
    run: tabix1.cwl
    in:
      vcf: vcf
      vcfgz: vcfgz
    out:
    - outfile
  tabix2:
    run: tabix2.cwl
    in:
      vcfgz_file: tabix1/outfile
      chr_string: chr_string
    out:
    - outfile
