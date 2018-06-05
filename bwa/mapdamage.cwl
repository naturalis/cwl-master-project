#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [mapDamage, map]

inputs:
  sortedbam:
    type: File
    inputBinding:
      prefix: -i
      position: 2
  directory:
    type: string
    inputBinding:
      prefix: -d
      position: 3
  reference:
    type: File
    inputBinding:
      prefix: -r
      position: 4
  l:
    type: int
    inputBinding:
      prefix: -l
      position: 5
  n:
    type: int
    inputBinding:
      prefix: -n
      position: 6

outputs:
  outdir:
    type: Directory
    outputBinding:
      glob: $(inputs.directory)
