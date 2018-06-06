#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: sort

inputs:
  sort:
    type: File
    inputBinding:
      prefix: -u
      position: 2

outputs:
  outfile:
    type: stdout

stdout: genesID.txt
