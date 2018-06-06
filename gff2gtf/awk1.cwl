#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: awk

inputs:
  input1:
    type: string
    inputBinding:
      position: 2
  file1:
    type: File
    inputBinding:
      position: 3

outputs:
  outfile:
    type: stdout

stdout: print1.gtf
