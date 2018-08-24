#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  gff_file:
    type: File
  T:
    type: string
  o:
    type: string

outputs:
  outfile1:
    type: File
    outputSource: gff2gtf/outfile
  outfile2:
    type: File
    outputSource: grep1/outfile

steps:
  gff2gtf:
    run: gff2gtf2.cwl
    in:
      gff_file: gff_file
      T: T
      o: o
    out:
    - outfile
  grep1:
    run: grep1.cwl
    in:
      gtf_file: gff2gtf/outfile
    out:
    - outfile
