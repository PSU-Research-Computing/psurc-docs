#!/bin/sh
#SBATCH --job-name=gg-trinity

# max run time
#SBATCH --time=336:00:00

# The number of compute nodes to request
#SBATCH --nodes 4

# Specify slurm partition
#SBATCH --partition CLUSTER

# command to run
./Trinity --grid_conf /home/arom2/SLURM.test.conf --genome /home/arom2/Trinity_data/allpaths_7-2-14_final.assembly.fasta --genome_guided_use_bam /home/arom2/Trinity_data/Temp_reads_vs_0702assembly2.csorted.bam --genome_guided_max_intron 500000 --genome_guided_sort_buffer 10G --genome_guided_CPU 3 --seqType fq --JM 3G --left /home/arom2/Trinity_data/All_R1.fastq  --right /home/arom2/Trinity_data/All_R2.fastq --CPU 6