#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  uf:
    type: File
  l: 
    type: File?
  bam1:
    type: File
  mv:
    type: string
  Oz:
    type: string
  o:
    type: string

outputs:
  outfile1:
    type: File
    outputSource: bcftools/outfile

steps:
  samtoolsmpileup:
    run: samtoolsmpileup.cwl
    in:
      uf: uf
      l: l
      bam1: bam1
    out:
    - outfile
  bcftools:
    run: bcftools.cwl
    in:
      mv: mv
      Oz: Oz
      o: o
      bcf_file: samtoolsmpileup/outfile
    out:
    - outfile
