#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  algorithm:
    type: string
  sequence:
    type: File
  t:
    type: int
  fastq1:
    type: File
  fastq2:
    type: File
  output1:
    type: string
  output2:
    type: string
  F:
    type: int
  q:
    type: int
  o:
    type: string
  directory:
    type: string
  l:
    type: int
  n:
    type: int

outputs:
  outfiles:
    type: File
    outputSource: bwaindex/outfiles
  outfile1:
    type: File
    outputSource: bwamem/outfile
  outfile2:
    type: File
    outputSource: samtoolsview/outfile
  outfile3:
    type: File
    outputSource: samtoolssort/outfile
  outfile4:
    type: File
    outputSource: samtoolsindex/outfile
  outfile5:
    type: Directory
    outputSource: mapdamage/outdir

steps:
  bwaindex:
    run: /home/CHT/tomato/script2/bwaindex.cwl
    in:
      algorithm: algorithm
      sequence: sequence
    out:
    - outfiles
  bwamem:
    run: /home/CHT/tomato/script2/bwamem.cwl
    in:
      t: t
      reference: bwaindex/outfiles
      fastq1: fastq1
      fastq2: fastq2
      output1: output1
    out:
    - outfile
  samtoolsview:
    run: /home/CHT/tomato/script2/samtoolsview.cwl
    in:
      F: F
      q: q
      sam: bwamem/outfile
      output2: output2
    out:
    - outfile
  samtoolssort:
    run: /home/CHT/tomato/script2/samtoolssort.cwl
    in:
      bam: samtoolsview/outfile
      o: o
    out:
    - outfile
  samtoolsindex:
    run: /home/CHT/tomato/script2/samtoolsindex.cwl
    in:
      bam: samtoolssort/outfile
    out:
    - outfile
  mapdamage:
    run: /home/CHT/tomato/script2/mapdamage.cwl
    in:
      sortedbam: samtoolssort/outfile
      directory: directory
      reference: bwaindex/outfiles
      l: l
      n: n
    out:
    - outdir
