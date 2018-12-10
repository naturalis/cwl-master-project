#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: perl

inputs:
  perl:
    type: File
    inputBinding:
      position: 2
  vcfformat:
    type: string?
    inputBinding:
      position: 3
  snpreport:
    type: string
    inputBinding:
      position: 4
  fastafile:
    type: string
    inputBinding:
      position: 5
  gtffile:
    type: string
    inputBinding:
      position: 6

outputs:
  outfile:
    type: Directory
    outputBinding:
      glob: SNPGenie_Results
