#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: grep

inputs:
  gtf_file:
    type: File
    inputBinding:
      prefix: CDS
      position: 2

outputs:
  outfile:
    type: stdout

stdout: test.gtf
