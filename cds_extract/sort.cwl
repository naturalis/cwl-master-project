#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [sort]

inputs:
  k1:
    type: string
    inputBinding:
      position: 2
  k2:
    type: string
    inputBinding:
      position: 3
  bedfile:
    type: File
    inputBinding:
      position: 4

outputs:
  outfile:
    type: stdout

stdout: allsorted.bed
