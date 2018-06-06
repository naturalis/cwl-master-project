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

outputs:
  outfile:
    type: stdout

stdout: new.gtf
