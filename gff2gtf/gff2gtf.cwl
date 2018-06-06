#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: perl

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.gff_file)

inputs:
  perl_file:
    type: File
    inputBinding:
      position: 2
  gff_file:
    type: File
    inputBinding:
      position: 3

outputs:
  outfile:
    type: File
    outputBinding:
      glob: "*.gtf"
