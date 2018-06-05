#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: bash

inputs:
  shell_file:
    type: File
    inputBinding:
      position: 2

outputs:
  outfile:
    type:
      type: array
      items: File
    outputBinding:
      glob: "*.fa"
