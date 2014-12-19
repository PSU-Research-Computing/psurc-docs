#!/bin/sh

# See http://slurm.schedmd.com/sbatch.html for all options
# The SBATCH lines are commented out but are still read by the scheduler
# ***Leave them commented out!***

#SBATCH --job-name=this-is-the-job-name

# max run time HH:MM:SS
#SBATCH --time=10:00:00

# -N, --nodes=<minnodes[-maxnodes]>
# Request that a minimum of minnodes nodes (servers) be allocated to this job.
# A maximum node count may also be specified with maxnodes.

#SBATCH --nodes 10

# -n, --ntasks=<number>
# This option advises the SLURM controller that job steps run within the
# allocation will launch a maximum of number tasks and to provide for
# sufficient resources. The default is one task per node, but note
# that the --cpus-per-task option will change this default.

#SBATCH -n 8

# Specify slurm partition

#SBATCH --partition main2,main

# command(s) to run
mpirun .... etc
