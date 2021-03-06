#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool
baseCommand: [bwa, mem, -M]

inputs:
  t:
    type: int?
    inputBinding:
      prefix: -t
      position: 2
  k:
    type: int?
    inputBinding:
      prefix: -k
      position: 2
  w:
    type: int?
    inputBinding:
      prefix: -w
      position: 2
  d:
    type: int?
    inputBinding:
      prefix: -d
      position: 2
  r:
    type: float?
    inputBinding:
      prefix: -r
      position: 2
  c:
    type: int?
    inputBinding:
      prefix: -c
      position: 2
  A:
    type: int?
    inputBinding:
      prefix: -A
      position: 2
  B:
    type: int?
    inputBinding:
      prefix: -B
      position: 2
  O:
    type: int?
    inputBinding:
      prefix: -O
      position: 2
  E:
    type: int?
    inputBinding:
      prefix: -E
      position: 2
  L:
    type: int?
    inputBinding:
      prefix: -L
      position: 2
  U:
    type: int?
    inputBinding:
      prefix: -U
      position: 2
  R:
    type: string?
    inputBinding:
      prefix: -R
      position: 2
  v:
    type: int?
    inputBinding:
      prefix: -v
      position: 2
  reference:
    type: File
    secondaryFiles:
      - .amb
      - .ann
      - .bwt
      - .pac
      - .sa
    inputBinding:
      position: 3
  fastq1:
    type: File
    inputBinding:
      position: 4
  fastq2:
    type: File
    inputBinding:
      position: 5
  output1:
    type: string

stdout: $(inputs.output1)

outputs:
  outfile:
    type: File
    outputBinding:
      glob: $(inputs.output1)

doc: |
  usage: bwa mem [options] <ref.fa> <read1.fq> <read2.fq> > aln.sam

  Options: -t INT 	Number of threads [1]
           -k INT 	Minimum seed length. Matches shorter than INT will be missed.
                    The alignment speed is usually insensitive to this value unless it significantly
                    deviates 20. [19]
           -w INT 	Band width. Essentially, gaps longer than INT will not be found. Note that the
                    maximum gap length is also affected by the scoring matrix and the hit length, not solely
                    determined by this option. [100]
           -d INT 	Off-diagonal X-dropoff (Z-dropoff). Stop extension when the difference between the best
                    and the current extension score is above |i-j|*A+INT, where i and j are the current
                    positions of the query and reference, respectively, and A is the matching score.
                    Z-dropoff is similar to BLAST’s X-dropoff except that it doesn’t penalize gaps in one of
                    the sequences in the alignment.
                    Z-dropoff not only avoids unnecessary extension, but also reduces poor alignments inside
                    a long good alignment. [100]
           -r FLOAT Trigger re-seeding for a MEM longer than minSeedLen*FLOAT. This is a key heuristic
                    parameter for tuning the performance. Larger value yields fewer seeds, which leads to
                    faster alignment speed but lower accuracy. [1.5]
           -c INT 	Discard a MEM if it has more than INT occurence in the genome. This is an insensitive
                    parameter. [10000]
           -P 	    In the paired-end mode, perform SW to rescue missing hits only but do not try to find
                    hits that fit a proper pair.
           -A INT 	Matching score. [1]
           -B INT 	Mismatch penalty. The sequence error rate is approximately: {.75 * exp[-log(4) * B/A]}. [4]
           -O INT 	Gap open penalty. [6]
           -E INT 	Gap extension penalty. A gap of length k costs O + k*E
                    (i.e. -O is for opening a zero-length gap). [1]
           -L INT 	Clipping penalty. When performing SW extension, BWA-MEM keeps track of the best score
                    reaching the end of query. If this score is larger than the best SW score minus the
                    clipping penalty, clipping will not be applied. Note that in this case, the SAM AS tag
                    reports the best SW score; clipping penalty is not deducted. [5]
           -U INT 	Penalty for an unpaired read pair. BWA-MEM scores an unpaired read pair as
                    scoreRead1+scoreRead2-INT and scores a paired as scoreRead1+scoreRead2-insertPenalty.
                    It compares these two scores to determine whether we should force pairing. [9]
           -p 	    Assume the first input query file is interleaved paired-end FASTA/Q. See the command
                    description for details.
           -R STR 	Complete read group header line. ’\t’ can be used in STR and will be converted to a
                    TAB in the output SAM. The read group ID will be attached to every read in the output.
                    An example is ’@RG\tID:foo\tSM:bar’. [null]
           -T INT 	Don’t output alignment with score lower than INT. This option only affects output. [30]
           -a 	    Output all found alignments for single-end or unpaired paired-end reads. These alignments
                    will be flagged as secondary alignments.
           -C 	    Append append FASTA/Q comment to SAM output. This option can be used to transfer read
                    meta information (e.g. barcode) to the SAM output. Note that the FASTA/Q comment
                    (the string after a space in the header line) must conform the SAM spec (e.g. BC:Z:CGTAC).
                    Malformated comments lead to incorrect SAM output.
           -H 	    Use hard clipping ’H’ in the SAM output. This option may dramatically reduce the redundancy
                    of output when mapping long contig or BAC sequences.
           -M 	    Mark shorter split hits as secondary (for Picard compatibility).
           -v INT 	Control the verbose level of the output. This option has not been fully supported
                    throughout BWA. Ideally, a value 0 for disabling all the output to stderr; 1 for
                    outputting errors only; 2 for warnings and errors; 3 for all normal messages; 4 or higher
                    for debugging. When this option takes value 4, the output is not SAM. [3]
