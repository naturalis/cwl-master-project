#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [bwa, index]

requirements:
  InitialWorkDirRequirement:
    listing: [$(inputs.sequence)]

inputs:
  prefix:
    type: string?
    inputBinding:
      prefix: -p
      position: 2
  algorithm:
    type: string?
    inputBinding:
      prefix: -a
      position: 2
  sequence:
    type: File
    inputBinding:
      position: 3

outputs:
  outfiles:
    type: File
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
    outputBinding:
      glob:
        - $(inputs.sequence.basename)

doc: |
  usage: bwa index [options] <ref.fa>

  Options: -p STR 	Prefix of the output database [same as db filename]
           -a STR 	Algorithm for constructing BWT index. Available options are:
                    is 	    IS linear-time algorithm for constructing suffix array.
                            It requires 5.37N memory where N is the size of the database.
                            IS is moderately fast, but does not work with database larger than 2GB.
                            IS is the default algorithm due to its simplicity.
                            The current codes for IS algorithm are reimplemented by Yuta Mori.
                    bwtsw 	Algorithm implemented in BWT-SW. This method works with the whole human genome.
