#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: grep

inputs:
  ch:
    type: string
    inputBinding:
      position: 2
  gtfchr_file:
    type: File
    inputBinding:
      position: 3

outputs:
  outfile:
    type: stdout

stdout: new_$(inputs.ch).gtf
