#!/bin/sh
#SBATCH --job-name=g09-test

# max run time
#SBATCH --time=00:10:00

# The number of compute nodes to request
# g09 only needs 1 per job.
#SBATCH --nodes 1

# Specify slurm partition
#SBATCH --partition CLUSTER

# command to run
g09 g09-test.gjf
