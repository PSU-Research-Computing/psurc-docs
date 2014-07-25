**************
Linux Clusters
**************

This page contains information about the research servers and instructions on how to run your programs in a cluster environment.

Servers and Hardware
====================

The following linux clusters are available for PSU students:

Gravel Cluster
--------------

+----------------------+-------------------+---------------------+
|    Server Domain     | gravel.rc.pdx.edu | compute-[0-2]-[0-9] |
+======================+===================+=====================+
| **Model**            |                   | Dell PowerEdge 1955 |
+----------------------+-------------------+---------------------+
| **RAM**              |                   |                     |
+----------------------+-------------------+---------------------+
| **OS**               |                   |                     |
+----------------------+-------------------+---------------------+
| **CPU**              |                   |                     |
+----------------------+-------------------+---------------------+
| **Clock**            |                   |                     |
+----------------------+-------------------+---------------------+
| **Cores**            |                   |                     |
+----------------------+-------------------+---------------------+
| **Special Hardware** |                   |                     |
+----------------------+-------------------+---------------------+
| **Hyper Theading**   |                   |                     |
+----------------------+-------------------+---------------------+

.. figure:: /img/gravel.JPG
   :alt: The Gravel Cluster.
   :scale: 50

   A photo of the Gravel Cluster blade servers.

Hydra Cluster
-------------

+----------------------+----------------------+-------------------------+
|    Server Domain     | ``hydra.rc.pdx.edu`` | ``compute-[0-2]-[0-9]`` |
+======================+======================+=========================+
| **Model**            |                      |                         |
+----------------------+----------------------+-------------------------+
| **RAM**              |                      |                         |
+----------------------+----------------------+-------------------------+
| **OS**               |                      |                         |
+----------------------+----------------------+-------------------------+
| **CPU**              |                      |                         |
+----------------------+----------------------+-------------------------+
| **Clock**            |                      |                         |
+----------------------+----------------------+-------------------------+
| **Cores**            |                      |                         |
+----------------------+----------------------+-------------------------+
| **Special Hardware** |                      |                         |
+----------------------+----------------------+-------------------------+
| **Hyper Theading**   |                      |                         |
+----------------------+----------------------+-------------------------+

.. figure:: /img/hydra.JPG
   :alt: The Hydra Cluster.

   A photo of the Hydra Cluster servers (highlighted in red).

.. _pgiCluster:

ROCKS: The Cluster Distribution
===============================

TODO: Write about ROCKS information that will help the user.

Ganglia
=======

TODO: Write about the web interface for monitoring the linux clusters.

Slurm: The Cluster Scheduler
============================

TODO: Write about slurm.

How to use the scheduler for MPI style programs.

TODO: How do I run non-mpi style programs on the cluster?

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
  GAUSS_SCRDIR=$HOME/gaussian_scratch
  export g09root GAUSS_SCRDIR
  source $g09root/g09/bsd/g09.profile

The ``$GAUSS_SCRDIR`` env variable is used as the gaussian scratch folder.  For now, leave this in your home directory and keep an eye on its size and clean up old files.

Testing Gaussian
----------------

.. warning:: Guassian will not run on the ``gravel.rc.pdx.edu`` cluster due to the lack of the SSE4_2 CPU instruction set.

You can test to make sure ``g09`` is working properly and your environment is set up correctly by setting up a simple ``g09`` test and then writing a schelulings script to submit the job to ``slurm``, the cluster scheduler.  The following is a simple test:

.. literalinclude:: /examples/g09/g09-test.gjf

`Download g09-test.gjf <https://raw.githubusercontent.com/PSU-OIT-ARC/arc-docs/master/examples/g09/g09-test.gjf>`_

This test file will run a single ``g09`` job using 8 threads and 4Gb of memory.

Next set up a simple ``slurm`` script to schedule your your ``g09`` job.  Set up a simple bash script with some special directives in the header to do this:

.. literalinclude:: /examples/g09/g09-slurm.sh

`Download g09-slurm.sh <https://raw.githubusercontent.com/PSU-OIT-ARC/arc-docs/master/examples/g09/g09-slurm.sh>`_

To enqueue the job run::

  sbatch g09-slurm.sh

Now check the queue to see if your job has been accepted::

  squeue

We can keep an eye on activity using::

  sinfo

or by visiting the `ganglia monitoring tool <http://gravel.rc.pdx.edu>`_.

For a more extensive test try the following ``g09`` file which will fail on servers without the correct CPU instutions required by gaussian:

.. literalinclude:: /examples/g09/l2-PtCl-td.gjf

`Download l2-PtCl-td.gjf <https://raw.githubusercontent.com/PSU-OIT-ARC/arc-docs/master/examples/g09/l2-PtCl-td.gjf>`_

Try editing or copying the ``g09-slurm.sh`` to point to the ``l2-PtCl-td.gjf`` file and launch a second job on the scheduler.