Slurm Installation and Configuration
====================================

A guide to installing and configuring slurm on the ARC clusters.

Installation
************
This is the same as in the cluster installation instructions.

Find the latest slurm roll from: http://sourceforge.net/projects/slurm-roll/

	On the headnode::

		$ wget http://sourceforge.net/projects/slurm-roll/files/<latest release path>disk1.iso
		$ rocks add roll slurm*.iso
		$ rocks enable roll slurm
		$ cd /export/rocks/install
		$ rocks create distro
		$ yum clean all 
		$ yum update
		$ rocks run roll slurm|sh 
		$ reboot

Partioning
**********

If different configurations are used on the compute nodes (such as the two configurations on Hydra), partitions can be set up so that a user can select the correct hardware for their requirements. On Hydra, the compute-1-* cabinet has different processors than the compute-0-* cabinet and lacks certain instruction sets such as SSE4. Some software requires these instuction sets so they need to choose the partition that has the capabilities.

As of Rocks-6-1.1 and the partition information is kept in `/etc/slurm/partitions.conf` instead of `slurm.conf`. 

	1. Make backups of configuration files::

		$ cd /etc/slurm
		$ cp slurm.conf slurm.conf.bak && cp partitions.conf partitions.conf.bak && cp nodenames.conf nodenames.conf.bak

	2. Create and configure partitions::

			$ sinfo 													# Find name of current partitions.
			$ rocks remove var slurm_partition <PARTITION NAME> 		# Remove previous partitions
			$ rocks add var slurm_partition main value="State=UP"		# Add partition named 'main'
			$ rocks add var slurm_partition main2 value="State=UP"		# Add partition named 'main2'
			$ rocks add host attr compute-0-0 slurm_partitions "|main|" # Sets compute-0-0 in 'main' partition
			$ # Do this to multiple nodes by just adding the names. IE: $rocks add host attr compute-0-1 compute-0-2 ... slurm_partitions "|main|"
			$ # Repeat for next partition, "|main2|"
			$ rocks sync slurm 											# Syncs the cluster for the new configuration.
			$ rocks report slurmpartitions								# Check the partition configuration.
			$ sinfo														# Shows the state of the partitions.

		Down nodes can be added, they will automatically be placed into a "down" partition then will be in the assigned partition once they are restored.


Usage
*****
sbatch
``````
sbatch is for setting up batch operations. 

	Create file job.sh::

		#!/bin/bash
		## Example job.sh

		## Set a job name:

		#SBATCH --job-name=TestJob

		## Max run time:

		#SBATCH --time=00:10:00

		## Set number of nodes:

		#SBATCH --nodes 4

		## Set partition

		#SBATCH --partition main

		## Command to run, many programs provide their own mpirun:

		srun program

	Execute the job::
		$ sbatch job.sh

	Check that the job was accepted::
		$ sinfo

	Further sbatch commands can be found at: https://computing.llnl.gov/linux/slurm/sbatch.html

srun
````
	srun can be used to schedule individual jobs. It is preferable to use sbatch.

	Example::
		$ srun --nodes=4 --partition=main --job-name=TestJob mpirun program
		$ sinfo

	For further commands, read: https://computing.llnl.gov/linux/slurm/srun.html

Monitoring and Administrating
*****************************

squeue
``````
	Shows current slurm queue.

sinfo
`````
	Shows the current status and availability of the partitions and nodes.
		- `$ sinfo -R # Lists reasons why nodes are down`

sreport
```````
	Lists cluster usage. Examples::
	
		$ sreport job sizesbyaccount
		$ sreport cluster utilization
		$ sreport user top
		$ sreport job sizesbyaccount All_Clusters users=gore1 account=environ PrintJobCount 	 #Report number of jobs by user gore1 within the environ account
		$ sreport cluster AccountUtilizationByUser cluster=zeus user=gore1 start=2/23/08 end=2/24/09 format=Accounts,Cluster,CPUCount,Login,Proper,used 	# Report cluster account utilization with the specified fields during the specified 24 hour day of February 23, 2009, by user gore1
		$ sreport user topusage start=2/16/09 end=2/23/09 -t percent account=lc 	# Report top usage in percent of the lc account during the specified week

sview
`````

	Graphical interface for status. Requires X forwarding.
		- `$ ssh user@host -X	# Connect with X forwarding` 

scancel <jobid>
```````````````

	Cancels a job.

scontrol
````````

	Administrative controls of slurm. Abort, create, delete, modify and view jobs and partitions.

salloc
``````
	
	Allocate nodes without running proesses.

smap
````

	Console-based visual cluster utilization.




For futher information look at: http://www.schedmd.com/slurmdocs/documentation.html