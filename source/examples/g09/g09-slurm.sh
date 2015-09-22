#!/bin/sh
#SBATCH --job-name=g09-test

# max run time
#SBATCH --time=10:00:00

# The number of compute nodes to request
# g09 only needs 1 node per job, but n tasks that you specify with %nprocshared
# Figure out the optimal number of nprocshared per task for your
# job through benchmarking. You can also request exclusive mode with the --exlusive
# flag.

#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=8

# Specify slurm partition
#SBATCH --partition main

# command to run
srun g09 g09-test.gjf
