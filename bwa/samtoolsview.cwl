#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [samtools, view, -bS]

inputs:
  F:
    type: int
    inputBinding:
      prefix: -F
      position: 3
  q:
    type: int
    inputBinding:
      prefix: -q
      position: 3
  U:
    type: File?
    inputBinding:
      prefix: -U
      position: 3
  t:
    type: File?
    inputBinding:
      prefix: -t
      position: 3
  T:
    type: File?
    inputBinding:
      prefix: -T
      position: 3
  L:
    type: File?
    inputBinding:
      prefix: -L
      position: 3
  r:
    type: string?
    inputBinding:
      prefix: -r
      position: 3
  R:
    type: File?
    inputBinding:
      prefix: -R
      position: 3
  q:
    type: int?
    inputBinding:
      prefix: -q
      position: 3
  l:
    type: string?
    inputBinding:
      prefix: -l
      position: 3
  m:
    type: int?
    inputBinding:
      prefix: -m
      position: 3
  f:
    type: int?
    inputBinding:
      prefix: -f
      position: 3
  F:
    type: int?
    inputBinding:
      prefix: -F
      position: 3
  G:
    type: int?
    inputBinding:
      prefix: -G
      position: 3
  x:
    type: string?
    inputBinding:
      prefix: -x
      position: 3
  s:
    type: float?
    inputBinding:
      prefix: -s
      position: 3
  at:
    type: int?
    inputBinding:
      prefix: -@
      position: 3
  sam:
    type: File
    inputBinding:
      position: 4
  output2:
    type: string
    inputBinding:
      prefix: -o
      position: 5

outputs:
  outfile:
    type: File
    outputBinding:
      glob: $(inputs.output2)

doc: |
  usage: samtools view [options] <in.sam>

  Options: -b       Output in the BAM format.
           -C       Output in the CRAM format (requires -T).
           -1       Enable fast BAM compression (implies -b).
           -u       Output uncompressed BAM. This option saves time spent on compression/decompression
                    and is thus preferred when the output is piped to another samtools command.
           -h       Include the header in the output.
           -H       Output the header only.
           -c       Instead of printing the alignments, only count them and print the total number.
                    All filter options, such as -f, -F, and -q, are taken into account.
           -?       Output long help and exit immediately.
           -o FILE  Output to FILE [stdout].
           -U FILE  Write alignments that are not selected by the various filter options to FILE.
                    When this option is used, all alignments (or all alignments intersecting the regions
                    specified) are written to either the output file or this file, but never both.
           -t FILE  tab-delimited FILE. Each line must contain the reference name in the first column
                    and the length of the reference in the second column, with one line for each distinct
                    reference. Any additional fields beyond the second column are ignored. This file also
                    defines the order of the reference sequences in sorting. If you run:
                    `samtools faidx <ref.fa>', the resulting index file <ref.fa>.fai can be used as this FILE.
           -T FILE  A FASTA format reference FILE, optionally compressed by bgzip and ideally indexed
                    by samtools faidx. If an index is not present, one will be generated for you.
           -L FILE  Only output alignments overlapping the input BED FILE [null].
           -M       Use the multi-region iterator on the union of the BED file and command-line region
                    arguments. This avoids re-reading the same regions of files so can sometimes be
                    much faster. Note this also removes duplicate sequences.
                    Without this a sequence that overlaps multiple regions specified on the command line
                    will be reported multiple times.
           -r STR   Only output alignments in read group STR [null].
           -R FILE  Output alignments in read groups listed in FILE [null].
           -q INT   Skip alignments with MAPQ smaller than INT [0].
           -l STR   Only output alignments in library STR [null].
           -m INT   Only output alignments with number of CIGAR bases consuming query sequence ≥ INT [0]
           -f INT   Only output alignments with all bits set in INT present in the FLAG field.
                    INT can be specified in hex by beginning with `0x' (i.e. /^0x[0-9A-F]+/) or
                    in octal by beginning with `0' (i.e. /^0[0-7]+/) [0].
           -F INT   Do not output alignments with any bits set in INT present in the FLAG field.
                    INT can be specified in hex by beginning with `0x' (i.e. /^0x[0-9A-F]+/) or
                    in octal by beginning with `0' (i.e. /^0[0-7]+/) [0].
           -G INT   Do not output alignments with all bits set in INT present in the FLAG field.
                    This is the opposite of -f such that -f12 -G12 is the same as no filtering at all.
                    INT can be specified in hex by beginning with `0x' (i.e. /^0x[0-9A-F]+/) or
                    in octal by beginning with `0' (i.e. /^0[0-7]+/) [0].
           -x STR   Read tag to exclude from output (repeatable) [null]
           -B       Collapse the backward CIGAR operation.
           -s FLOAT Output only a proportion of the input alignments. This subsampling acts in
                    the same way on all of the alignment records in the same template or read pair,
                    so it never keeps a read but not its mate.
                    The integer and fractional parts of the -s INT.FRAC option are used separately:
                    the part after the decimal point sets the fraction of templates/pairs to be kept,
                    while the integer part is used as a seed that influences which subset of reads is kept.
                    When subsampling data that has previously been subsampled, be sure to use
                    a different seed value from those used previously; otherwise more reads will be
                    retained than expected.
           -@ INT   Number of BAM compression threads to use in addition to main thread [0].
           -S       Ignored for compatibility with previous samtools versions.
                    Previously this option was required if input was in SAM format,
                    but now the correct format is automatically detected by examining the first few characters
                    of input.
