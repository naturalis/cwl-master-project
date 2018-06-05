#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [samtools, sort]

inputs:
  l:
    type: int?
    inputBinding:
      prefix: -l
      position: 1
  m:
    type: int?
    inputBinding:
      prefix: -m
      position: 1
  o:
    type: string
    inputBinding:
      prefix: -o
      position: 1
  at:
    type: int?
    inputBinding:
      prefix: -@
      position: 1
  bam:
    type: File
    inputBinding:
      position: 2

outputs:
  outfile:
    type: File
    outputBinding:
      glob: $(inputs.o)

doc: |
  usage: samtools sort [options] <in.bam>

  Options: -l INT     Set the desired compression level for the final output file,
                      ranging from 0 (uncompressed) or 1 (fastest but minimal compression)
                      to 9 (best compression but slowest to write), similarly to
                      gzip(1)'s compression level setting.
                      If -l is not used, the default compression level will apply.
           -m INT     Approximately the maximum required memory per thread,
                      specified either in bytes or with a K, M, or G suffix. [768 MiB]
                      To prevent sort from creating a huge number of temporary files,
                      it enforces a minimum value of 1M for this setting.
           -n         Sort by read names (i.e., the QNAME field) rather than by chromosomal coordinates.
           -t TAG     Sort first by the value in the alignment tag TAG, then by position or name (if also using -n).
           -o FILE    Write the final sorted output to FILE, rather than to standard output.
           -O FORMAT  Write the final output as sam, bam, or cram.
                      By default, samtools tries to select a format based on the
                      -o filename extension; if output is to standard output or no format
                      can be deduced, bam is selected.
           -T PREFIX  Write temporary files to PREFIX.nnnn.bam, or if the specified PREFIX is
                      an existing directory, to PREFIX/samtools.mmm.mmm.tmp.nnnn.bam,
                      where mmm is unique to this invocation of the sort command.
                      By default, any temporary files are written alongside the output file,
                      as out.bam.tmp.nnnn.bam, or if output is to standard output,
                      in the current directory as samtools.mmm.mmm.tmp.nnnn.bam.
           -@ INT     Set number of sorting and compression threads. By default, operation is single-threaded.
