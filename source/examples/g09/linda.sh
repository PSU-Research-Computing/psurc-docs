#!/bin/bash
#SBATCH --job-name=g09-test

# max run time
#SBATCH --time=10:00:00


# 4 servers, 1 linda worker per server, 16 CPUs per linda worker
#SBATCH --nodes=4
#SBATCH --ntasks-per-node=1
#SBATCH --cpus-per-task=16

# Specify slurm partition
#SBATCH --partition main

# activate bash debugging from here
set -x

# Name of your gjf file ie l2-PtCl-td.gjf
JobFile=l2-PtCl-td

# This creates a list of nodes that you job received to run on
LindaList=./nodes_linda.$SLURM_JOBID
touch $LindaList

# This creates a jobfile
JobName=./${JobFile}${SLURM_JOBID}.gjf
touch $JobName

# Create a list of hostnames and save it to the LindaList machine file
srun hostname -s | sort -u > $LindaList

# Tell linda to use ssh
export GAUSS_LFLAGS=' -opt "Tsnet.Node.lindarsharg: ssh"'

# Read the contents of the machine file and put it in the job file
workers="%LindaWorkers="$(cat $LindaList | tr "\n" "," | sed "s/,$//")

# Write that out to the job file
cat <(echo -e "${workers}\r") ./$JobFile.gjf > $JobName

# Run gaussian using our job file and output to a matching results file
g09 /scratch/bcomnes/g09/linda/${JobFile}${SLURM_JOBID}.gjf /scratch/bcomnes/g09/linda/foo${SLURM_JOBID}.txt

