#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: Workflow

inputs:
  perl_file:
    type: File
  gff_file:
    type: File
  input1:
    type: string
  input2:
    type: string
  gene_list:
    type: string
  filtered_gene_list:
    type: string

outputs:
  outfile1:
    type: File
    outputSource: gff2gtf/outfile
  outfile2:
    type: File
    outputSource: sort/outfile
  outfile3:
    type: File
    outputSource: grep2/outfile

steps:
  gff2gtf:
    run: gff2gtf.cwl
    in:
      perl_file: perl_file
      gff_file: gff_file
    out:
    - outfile
  grep1:
    run: grep1.cwl
    in:
      gtf_file: gff2gtf/outfile
    out:
    - outfile
  awk1:
    run: awk1.cwl
    in:
      input1: input1
      file1: grep1/outfile
    out:
    - outfile
  awk2:
    run: awk2.cwl
    in:
      input2: input2
      file2: awk1/outfile
    out:
    - outfile
  sort:
    run: sort.cwl
    in:
      sort: awk2/outfile
      gene_list: gene_list
    out:
    - outfile
  grep2:
    run: grep2.cwl
    in:
      genesid: sort/outfile
      gtf: gff2gtf/outfile
      filtered_gene_list: filtered_gene_list
    out:
    - outfile
