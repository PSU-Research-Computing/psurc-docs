#!/bin/sh

## Run this file with the command line "sbatch example.sh" for a working demo.

## See http://slurm.schedmd.com/sbatch.html for all options
## The SBATCH lines are commented out but are still read by the Slurm scheduler
## ***Leave them commented out with a single hash mark!***

## To disable SBATCH commands, start the line with anything other than "#SBATCH"
##SBATCH       # this is disabled
####SBATCH     # so is this
# SBATCH       # disabled
 #SBATCH       # disabled

##
## Slurm SBATCH configuration options start here.
##

## The name of the job that will appear in the output of squeue, qstat, etc.
#SBATCH --job-name=this-is-the-job-name


## max run time HH:MM:SS

#SBATCH --time=10:00:00


## -N, --nodes=<minnodes[-maxnodes]>
## Request that a minimum of minnodes nodes (servers) be allocated to this job.
## A maximum node count may also be specified with maxnodes.

#SBATCH --nodes 1-3


## -n, --ntasks=<number>
## This option advises the SLURM controller that job steps run within the
## allocation will launch a maximum of number tasks and to provide for
## sufficient resources. The default is one task per node, but note
## that the --cpus-per-task option will change this default.

#SBATCH -n 5


## For hydra, main and main2 are the available partitions.  This line is safe to omit
## on gravel as CLUSTER is the only partition.  Check /etc/partitions.conf for currently
## defined partitions.

#SBATCH --partition main2,main


##
## Commands start here
##

## Command(s) to run.  If this example file is run as is, the effect will be the creation of
## a file called slurm-ZZZ.out in the current directory containing "Hello, world!" five times.
## The ZZZ is the job number that is printed after you run "sbatch example.sh".
MESSAGE='Hello, world!'
srun echo ${MESSAGE}

## Another example command
# srun my_computation_worker /home/user/computation_worker.conf