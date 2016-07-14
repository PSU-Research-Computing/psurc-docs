#!/bin/sh

## Run this file with the command line "sbatch sbatch_example.sh" for a working demo.

## See http://slurm.schedmd.com/sbatch.html for all options
## The SBATCH lines are commented out but are still read by the Slurm scheduler
## ***Leave them commented out with a single hash mark!***

## To disable SBATCH commands, start the line with anything other than "#SBATCH"
##SBATCH       # this is disabled
####SBATCH     # so is this
# SBATCH       # disabled
 #SBATCH       # disabled

##
## Slurm SBATCH configuration options 
##

## The name of the job that will appear in the output of squeue, qstat, etc.
#
#SBATCH --job-name=this-is-the-job-name


## max run time HH:MM:SS
#
#SBATCH --time=10:00:00


## -N, --nodes=<minnodes[-maxnodes]>
## Request that a minimum of minnodes nodes (servers) be allocated to this job.
## A maximum node count may also be specified with maxnodes.
#
#SBATCH --nodes 1-3


## -n, --ntasks=<number>
## The ntasks option is used to allocate resources for parallel jobs (OpenMPI, FreeMPI, etc.).
## Regular shell commands can also be run in parrallel by toggling the ntasks option and prefixing the command with 'srun'
## ntasks default value is 1
## THIS OPTION IS NOT USED TO RESERVE CPUS FOR MULTITHREADED JOBS; See --cpus-per-task
## Mulithreaded jobs only use one task. Asking for more tasks will make it harder for your job to schedule and run.
#
#SBATCH -n 1

## --cpus-per-task=<number>
## The cpus-per-task option reserves a set number of CPUs (cores) for each task you request.
## The cpus-per-task option can be used to reserve CPUs for a multithreaded job
## The default value is 1
#
#SBATCH --cpus-per-task=1

## For hydra, main and main2 are the available partitions.  This line is safe to omit
## on gravel as CLUSTER is the only partition.  Check /etc/partitions.conf for currently
## defined partitions.
#
#SBATCH --partition main2,main


## Command(s) to run.
## You specify what commands to run in your batch below.
## All commands will be run sequentially unless prefixed with the 'srun' command 
## To run this example in sbatch enter the command: 'sbatch ./example.sh'
## The output from this example would be written to a file called slurm-XXX.out where XXX is the jobid
## The slurm out file will be located in the directory where sbatch was executed.

MESSAGE='Hello, world!'
echo ${MESSAGE}

## Another example command
# my_computation_worker /home/user/computation_worker.conf
