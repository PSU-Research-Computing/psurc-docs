
****************
Picking A Server
****************

Once you have an idea of the software you wish to run, and its hardware requirements, you can pick a server to run your compute jobs on.

Circe
=====

``circe.rc.pdx.edu``

:ref:`circe` is a general compute server for smaller jobs.  All minor computing tasks should take place here.  It also offeres a GPGPU for hardware accelerated computations.

- Good for jobs that require less than 10GB of RAM.
- Can utilize GPGPU(CUDA) parallellization.
- No job scheduler.

.. seealso::

    Read more about how the :ref:`tesla` card can help speed up your computations.


Hecate
======

``hecate.rc.pdx.edu``

:ref:`hecate` is the other general purpose compute server for RAM hungry jobs.  Jobs that require over 10 GB of ram should have priority over jobs that are not ram intensive.  If you are running a CPU or IO bound job that does not require lots of RAM, you should move your job to Circe or a node in the clusters.

Hecate is good for jobs that:

- Requires large (over 10 GB) of RAM.
- No Scheduler


Hydra Cluster
=============

``hydra.rc.pdx.edu``

The :ref:`hydra_cluster` is the primary compute cluster at ARC.  It is available for massivly distributed compute jobs, or just running CPU/IO intensive tasks on single nodes if they are distruptive to other tasks on the general compute servers.  Programs are required to use the :ref:`slurm` scheduler which requires a bit of extra training to get started on.

Hydra is good for jobs that:

- Use message passing (MPI, MPIC etc)
- Tend to have a high CPU load and distrupt other processes on the general compute serers and require their own dedicated node.
- Can be broke into many little parts and executed in parallel across multiple nodes.
- Are easily distrupted by other processes on the general compute servers and require a dedicated node.
- Have users wishing to run their programs using a Job scheduler.

Gravel Cluster
==============

``gravel.rc.pdx.edu``

The :ref:`gravel_cluster` is the secondary compute cluster at ARC.  It runs slightly older hardware, and generally is less busy than hydra.  Students are free to use gravel if they wish but changes to hydra are tested on gravel first.

Gravel is good for jobs that:

- Might be disruptive to jobs running on Hydra
- Wont fit on hydra if hydra is busy
- Want to try something new without affecting performance of jobs on hydra

