#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [samtools, mpileup]

inputs:
  uf:
    type: File
    inputBinding:
      prefix: -uf
      position: 2
  bam1:
    type: File
    inputBinding:
      position: 3

outputs:
  outfile:
    type: stdout

stdout: sequence.bcf
