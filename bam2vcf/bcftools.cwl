#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [bcftools, call]

inputs:
  mv:
    type: string
    inputBinding:
      position: 2
  Oz:
    type: string
    inputBinding:
      position: 3
  o:
    type: string
    inputBinding:
      prefix: -o
      position: 4
  bcf_file:
    type: File
    inputBinding:
      position: 5

outputs:
  outfile:
    type: File
    outputBinding:
      glob: $(inputs.o)
