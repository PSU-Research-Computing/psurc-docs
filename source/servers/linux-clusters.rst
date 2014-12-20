.. _clusters:
**************
Linux Clusters
**************

This page contains information about the research servers and instructions on how to run your programs in a cluster environment.

ROCKS: The Cluster Distribution
===============================

Hydra and Gravel both run `ROCKS 6.1.1 <http://central6.rocksclusters.org/roll-documentation/base/6.1.1/>`_ with the following rolls installed:

- area51
- base
- bio
- ganglia
- hpc
- java
- kernal
- os
- perl
- python
- slurm

Applications not managed by the slurm roll system are installed to::

  /share/apps

Hydra has a large scratch space that can be used for computations::

  /disk/scratch/[user folder]

Ganglia
=======

The clusters can be monitored using the Ganglia webview from on campus at the following URLS:

- http://hydra.rc.pdx.edu/
- http://gravel.rc.pdx.edu/

.. figure:: /img/hydra-ganglia.png
   :alt: A screenshot of the ganglia view for hydra.

These can be viewed off campus by using PSUs `VPN <http://www.pdx.edu/oit/virtual-private-network-vpn>`_.

Slurm: The Cluster Scheduler
============================

This section contains information on general slurm use.  If this is your first time running slurm, it is recommended that you read over some of the basics on the official `Slurm Website <http://slurm.schedmd.com/documentation.html>`_ and watch this introductory video: `Introduction to slurm tools video <https://www.youtube.com/watch?v=U42qlYkzP9k>`_

.. figure:: /img/slurm-video.png
   :alt: A video on launching slurm jobs
   :target: https://www.youtube.com/watch?v=U42qlYkzP9k
Example Job Submission
----------------------

To submit a job to the scheduler, first figure out what kind of resource allocation you need.  Once you have that set up a launching script similar to the following:

`Download example.sh <https://raw.githubusercontent.com/PSU-OIT-ARC/arc-docs/master/examples/slurm/example.sh>`_

.. literalinclude:: /examples/slurm/example.sh
   :language: sh

Once you write a launcher script with the correct resource allocations, you can launch your script using the following command::

  > sbatch ./example.sh
  Submitted batch job 440

This submits your job to the scheduler.  You can check the status of the job queue by running::

  > squeue
    JOBID PARTITION     NAME     USER ST       TIME  NODES NODELIST(REASON)
    433     main2 trinity-    arom2  R 3-00:47:07      1 compute-1-9
    439     main2 tip_plan   jblac2  R    2:24:55      8 compute-1-[7-8,10,12-16]
    438     main2 fdtd_job   jblac2  R    2:37:18      8 compute-1-[0-6,11]

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

.. _pgiCluster:

PGI Cluster Development Kit: Linux Cluster
==========================================

TODO: Instructions on how to run PGI on the linxu clusters!  Yay!


FDTD
====

TODO: Describe FDTD.

Gaussian G09
============

The Gaussian software is installed on linux clusters and is available for use if you are authorized to use the available license.  You must be added to the ``gaussian`` unix group in order to run ``g09`` which should be specifically requested when requesting a research account.

Setting up ``g09``
------------------

``g09`` requires some simple modifications to your user environment.  Add the following to to your ``~/.bashrc`` file::

  g09root="/share/apps"
  GAUSS_SCRDIR=/scratch/$USER/gaussian_scratch
  export g09root GAUSS_SCRDIR
  source $g09root/g09/bsd/g09.profile

The ``$GAUSS_SCRDIR`` env variable is used as the Gaussian scratch folder.  For now, leave this in your home directory and keep an eye on its size and clean up old files.

Testing Gaussian
----------------

.. warning:: Guassian will not run on the ``gravel.rc.pdx.edu`` cluster due to the lack of the SSE4_2 CPU instruction set.

You can test to make sure ``g09`` is working properly and your environment is set up correctly by setting up a simple ``g09`` test and then writing a schelulings script to submit the job to ``slurm``, the cluster scheduler.  The following is a simple test:

`Download g09-test.gjf <https://raw.githubusercontent.com/PSU-OIT-ARC/arc-docs/master/examples/g09/g09-test.gjf>`_

.. literalinclude:: /examples/g09/g09-test.gjf

This test file will run a single ``g09`` job using 8 threads and 4Gb of memory.

Next set up a simple ``slurm`` script to schedule your your ``g09`` job.  Set up a simple bash script with some special directives in the header to do this:

`Download g09-slurm.sh <https://raw.githubusercontent.com/PSU-OIT-ARC/arc-docs/master/examples/g09/g09-slurm.sh>`_

.. literalinclude:: /examples/g09/g09-slurm.sh

To enqueue the job run::

  sbatch g09-slurm.sh

Now check the queue to see if your job has been accepted::

  squeue

We can keep an eye on activity using::

  sinfo

or by visiting the `ganglia monitoring tool <http://gravel.rc.pdx.edu>`_.

For a more extensive test try the following ``g09`` file which will fail on servers without the correct CPU instutions required by gaussian:

`Download l2-PtCl-td.gjf <https://raw.githubusercontent.com/PSU-OIT-ARC/arc-docs/master/examples/g09/l2-PtCl-td.gjf>`_

.. literalinclude:: /examples/g09/l2-PtCl-td.gjf

Try editing or copying the ``g09-slurm.sh`` to point to the ``l2-PtCl-td.gjf`` file and launch a second job on the scheduler.
