#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: grep

inputs:
  CDS:
    type: string
    inputBinding:
      position: 2
  gff:
    type: File
    inputBinding:
      position: 3

outputs:
  outfile:
    type: stdout

stdout: cdsfiltered.gff
