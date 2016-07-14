..  _slurm.rst:

***********************
Slurm Cluster Scheduler
***********************


This section contains information on general slurm use.  If this is your first 
time running slurm, it is recommended that you read over some of the basics on 
the official `Slurm Website <http://slurm.schedmd.com/documentation.html>`_ and
watch this introductory video: 
`Introduction to slurm tools <https://www.youtube.com/watch?v=U42qlYkzP9k>`_

.. figure:: /img/slurm-video.png
   :alt: A video on launching slurm jobs
   :target: https://www.youtube.com/watch?v=U42qlYkzP9k

Job Submitting Jobs
-------------------

There are two main ways you can submit jobs to slurm via the command line using
``sbatch``, ``srun`` or a mix of the two.

sbatch
======

The ``sbatch`` command takes a shell script as input. This shell script
defines settings to be passed to slurm (i.e job name, number of tasks,
partition, etc) as well as a shell script that exectutes your desired
computations.

Example job submission using sbatch
===================================

`Download example.sh <https://raw.githubusercontent.com/PSU-OIT-ARC/arc-docs/master/source/examples/slurm/sbatch_example.sh>`_

.. literalinclude:: /examples/slurm/sbatch_example.sh
   :language: sh

Once you write a launcher script with the correct resource allocations, you can
launch your script using the following command::

  > sbatch ./sbatch_example.sh
  Submitted batch job 440

This submits your job to the scheduler.  
You can check the status of the job queue by running::

  > squeue
    JOBID PARTITION     NAME     USER      ST    TIME      NODES NODELIST(REASON)
    433     main sbatch_example    user7   R 3-00:47:07      1 compute-1-9
    439     main tip_plan          user22  R    2:24:55      8 compute-1-[7-8,10,12-16]
    438     main fdtd_job          user34  R    2:37:18      8 compute-1-[0-6,11]


Useful Slurm Commands
---------------------

Here are a list of useful slurm commands.

``scancel`` is the tool for canceling your jobs::

  > scancel [jobid]

``scontrol`` shows information about running jobs::

  > scontrol show job [jobid]
    UserId=jblac2(169223) GroupId=jblac2(54419)
    Priority=10220 Nice=0 Account=jblac2 QOS=normal WCKey=*default
    JobState=RUNNING Reason=None Dependency=(null)
    Requeue=1 Restarts=0 BatchFlag=1 ExitCode=0:0
    RunTime=02:40:04 TimeLimit=4-04:00:00 TimeMin=N/A
    SubmitTime=2014-08-25T13:46:37 EligibleTime=2014-08-25T13:46:37
    StartTime=2014-08-25T13:46:37 EndTime=2014-08-29T17:46:37
    PreemptTime=None SuspendTime=None SecsPreSuspend=0
    Partition=main2 AllocNode:Sid=hydra:1704
    ReqNodeList=(null) ExcNodeList=(null)
    NodeList=compute-1-[0-6,11]
    BatchHost=compute-1-0
    NumNodes=8 NumCPUs=128 CPUs/Task=1 ReqB:S:C:T=0:0:*:*
    Socks/Node=* NtasksPerN:B:S:C=16:0:*:* CoreSpec=0
    MinCPUsNode=16 MinMemoryNode=0 MinTmpDiskNode=0
    Features=(null) Gres=(null) Reservation=(null)
    Shared=OK Contiguous=0 Licenses=(null) Network=(null)
    Command=/home/jblac2/job.sh tip_3d_trial_2/geometry.fsp
    WorkDir=/home/jblac2
    StdErr=/home/jblac2/slurm-438.out
    StdIn=/dev/null
    StdOut=/home/jblac2/slurm-438.out

``sinfo`` show information about the state of the cluster::

  > sinfo
  PARTITION AVAIL  TIMELIMIT  NODES  STATE NODELIST
  DEBUG        up   infinite      0    n/a
  main         up   infinite     14   idle compute-0-[0-13]
  main2*       up   infinite     17  alloc compgute-1-[0-16]
  main2*       up   infinite      1   idle compute-1-17

``smap`` shows a visual representation of the cluster:

.. figure:: /img/smap.png
   :alt: A screenshot of the smap view running on hydra.



Useful Slurm Links
------------------

- `Slurm Documentation <http://slurm.schedmd.com/documentation.html>`_
- `Slurm Tutorials <http://slurm.schedmd.com/tutorials.html>`_
- `Slurm Publications <http://slurm.schedmd.com/publications.html>`_
- `Slurm At Harvard <https://rc.fas.harvard.edu/resources/running-jobs/>`_

