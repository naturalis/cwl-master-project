#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [sh]

inputs:
  file:
    type: File
    inputBinding:
      position: 2

outputs:
  outfile:
    type: File
    outputBinding:
      glob: '*.bed'
