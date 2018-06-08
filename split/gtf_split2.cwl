#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: grep

inputs:
  locusid1:
    type: string
    inputBinding:
      prefix: -e
      position: 2
  locusid2:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid3:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid4:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid5:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid6:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid7:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid8:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid9:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid10:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid11:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid12:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid13:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid14:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid15:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid16:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid17:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid18:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid19:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid20:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid21:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid22:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  locusid23:
    type: string?
    inputBinding:
      prefix: -e
      position: 2
  gtf_file:
    type: File
    inputBinding:
      position: 3
  file_name:
    type: string

outputs:
  outfile:
    type: stdout

stdout: $(inputs.file_name)_filtered.gtf
