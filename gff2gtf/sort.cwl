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
  gene_list:
    type: string

outputs:
  outfile:
    type: stdout

stdout: $(inputs.gene_list).txt
