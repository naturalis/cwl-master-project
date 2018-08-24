#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: gffread

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.gff_file)

inputs:
  gff_file:
    type: File
    inputBinding:
      position: 2
  T:
    type: string
    inputBinding:
      position: 3
  o:
    type: string
    inputBinding:
      prefix: -o
      position: 4

outputs:
  outfile:
    type: File
    outputBinding:
      glob: "*.gtf"
