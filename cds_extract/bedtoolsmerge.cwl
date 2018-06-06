#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [bedtools, merge]

inputs:
  i:
    type: File
    inputBinding:
      prefix: -i
      position: 2

outputs:
  outfile:
    type: stdout

stdout: allmerged.bed
