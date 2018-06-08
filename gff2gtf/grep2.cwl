#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: grep

inputs:
  genesid:
    type: File
    inputBinding:
      prefix: -vf
      position: 2
  gtf:
    type: File
    inputBinding:
      position: 3
  filtered_gene_list:
    type: string

outputs:
  outfile:
    type: stdout

stdout: $(inputs.filtered_gene_list).gtf
