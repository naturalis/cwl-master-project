#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  ch:
    type: string
  gtfchr_file:
    type: File
  locusid1:
    type: string
  locusid2:
    type: string?
  locusid3:
    type: string?
  locusid4:
    type: string?
  locusid5:
    type: string?
  locusid6:
    type: string?
  locusid7:
    type: string?
  locusid8:
    type: string?
  locusid9:
    type: string?
  locusid10:
    type: string?
  locusid11:
    type: string?
  locusid12:
    type: string?
  locusid13:
    type: string?
  locusid14:
    type: string?
  locusid15:
    type: string?
  locusid16:
    type: string?
  locusid17:
    type: string?
  locusid18:
    type: string?
  locusid19:
    type: string?
  locusid20:
    type: string?
  locusid21:
    type: string?
  locusid22:
    type: string?
  locusid23:
    type: string?
  file_name:
    type: string

outputs:
  outfile1:
    type: File
    outputSource: gtf_split/outfile
  outfile2:
    type: File
    outputSource: gtf_split2/outfile

steps:
  gtf_split:
    run: gtf_split.cwl
    in:
      ch: ch
      gtfchr_file: gtfchr_file
    out:
    - outfile
  gtf_split2:
    run: gtf_split2.cwl
    in:
      locusid1: locusid1
      locusid2: locusid2
      locusid3: locusid3
      locusid4: locusid4
      locusid5: locusid5
      locusid6: locusid6
      locusid7: locusid7
      locusid8: locusid8
      locusid9: locusid9
      locusid10: locusid10
      locusid11: locusid11
      locusid12: locusid12
      locusid13: locusid13
      locusid14: locusid14
      locusid15: locusid15
      locusid16: locusid16
      locusid17: locusid17
      locusid18: locusid18
      locusid19: locusid19
      locusid20: locusid20
      locusid21: locusid21
      locusid22: locusid22
      locusid23: locusid23
      gtf_file: gtf_split/outfile
      file_name: file_name
    out:
    - outfile
