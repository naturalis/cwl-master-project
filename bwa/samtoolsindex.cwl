#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [samtools, index]

requirements:
  InitialWorkDirRequirement:
    listing: [$(inputs.bam)]

inputs:
  m:
    type: int?
    inputBinding:
      position: 1
  bam:
    type: File
    inputBinding:
      position: 2

outputs:
  outfile:
    type: File
    secondaryFiles:
      - .bai
    outputBinding:
      glob: $(inputs.bam.basename)

doc: |
  usage: samtools index [options] <in.bam>

  Options: -b       Create a BAI index. This is currently the default when no format options are used.
           -c       Create a CSI index. By default, the minimum interval size for the index is 2^14, which is the same as the fixed value used by the BAI format.
           -m INT   Create a CSI index, with a minimum interval size of 2^INT.
