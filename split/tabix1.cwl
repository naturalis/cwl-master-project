#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: tabix

requirements:
 - class: InitialWorkDirRequirement
   listing: [$(inputs.vcfgz)]

inputs:
  vcf:
    type: string
    inputBinding:
      prefix: -p
      position: 2
  vcfgz:
    type: File
    inputBinding:
      position: 3

outputs:
  outfile:
    type: File
    secondaryFiles:
      - .tbi
    outputBinding:
      glob: "*.vcf.gz"
