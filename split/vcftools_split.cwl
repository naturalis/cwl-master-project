#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: vcftools

inputs:
  gzvcf:
    type: File
    inputBinding:
      prefix: --gzvcf
  chr:
    type: string
    inputBinding:
      prefix: --chr
  recodeinfo:
    type: string
    inputBinding:
      prefix: --
      separate: false
  maxalleles:
    type: int
    inputBinding:
      prefix: --max-alleles
  minGQ:
    type: int
    inputBinding:
      prefix: --minGQ
  nonrefac:
    type: int
    inputBinding:
      prefix: --non-ref-ac
  out:
    type: string
    inputBinding:
      prefix: --out
  recode:
    type: string
    inputBinding:
      prefix: --
      separate: false
  indv:
    type: string
    inputBinding:
      prefix: --indv

outputs:
  outfile:
    type: File
    outputBinding:
      glob: "*.log"
  outfile2:
    type: File
    outputBinding:
      glob: "*.recode.*"
