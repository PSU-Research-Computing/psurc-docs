.. _clusters:
**************
Linux Clusters
**************

This page contains information about the research servers and instructions on how to run your programs in a cluster environment.

Servers and Hardware
====================

The following linux clusters are available for PSU students:

Gravel Cluster
--------------

+----------------------+-------------------------+-------------------------+
|    Server Domain     |  ``gravel.rc.pdx.edu``  | ``compute-[0-2]-[0-9]`` |
+======================+=========================+=========================+
| **Model**            | TODO: Gravel Head Model | Dell PowerEdge 1955     |
+----------------------+-------------------------+-------------------------+
| **RAM**              | 4GB                     | 8GB                     |
+----------------------+-------------------------+-------------------------+
| **OS**               | Rocks 6.1.1             | Rocks 6.1.1             |
+----------------------+-------------------------+-------------------------+
| **CPU**              | Intel Xeon 5335         | 2 x Intel Xeon E5320    |
+----------------------+-------------------------+-------------------------+
| **Clock**            | 2.00 GHz                | 1.86 GHz                |
+----------------------+-------------------------+-------------------------+
| **Cores**            | 4                       | 8 (2 x 4)               |
+----------------------+-------------------------+-------------------------+
| **Hyper Threading**  | Disabled                | Enabled                 |
+----------------------+-------------------------+-------------------------+


Hydra Cluster
-------------

+----------------------+------------------------+------------------------+----------------------+
|    Server Domain     |  ``hydra.rc.pdx.edu``  |  ``compute-0-[0-13]``  | ``compute-1-[0-17]`` |
+======================+========================+========================+======================+
| **Model**            | TODO: Hydra Head       | TODO: DPE R620         | Dell PowerEdge R900  |
+----------------------+------------------------+------------------------+----------------------+
| **RAM**              | 64GB                   | 66GB                   | 132GB                |
+----------------------+------------------------+------------------------+----------------------+
| **OS**               | Rocks 6.1.1            | Rocks 6.1.1            | Rocks 6.1.1          |
+----------------------+------------------------+------------------------+----------------------+
| **CPU**              | 2 x Intel Xeon E5-2650 | 2 x Intel Xeon E5-2650 | 4 x Intel Xeon E7330 |
+----------------------+------------------------+------------------------+----------------------+
| **Clock**            | 2.00GHz                | 2.00GHz                | 2.40GHz              |
+----------------------+------------------------+------------------------+----------------------+
| **Cores**            | 16 (2 x 8)             | 16 (2 x 8)             | 16 (4 x 4)           |
+----------------------+------------------------+------------------------+----------------------+
| **Special Hardware** | SSE4_2                 | SSE4_2                 |                      |
+----------------------+------------------------+------------------------+----------------------+
| **Hyper Threading**  | Enabled                | Enabled                | N/A                  |
+----------------------+------------------------+------------------------+----------------------+

.. _pgiCluster:

ROCKS: The Cluster Distribution
===============================

TODO: Write about ROCKS information that will help the user.

Ganglia
=======

TODO: Write about the web interface for monitoring the Linux clusters.

Slurm: The Cluster Scheduler
============================

We are focusing on wprking with individuals on getting their programs up and running with slurm and writing specific documentation before we write a general slurm guide, bug here are a list of really helpful links:

- https://rc.fas.harvard.edu/resources/running-jobs/
- http://slurm.schedmd.com/documentation.html
- http://slurm.schedmd.com/tutorials.html
- http://slurm.schedmd.com/publications.html
- `Introduction to slurm tools <https://www.youtube.com/watch?v=U42qlYkzP9k>`_

.. youtube:: https://www.youtube.com/watch?v=U42qlYkzP9k


Example Scheduling Script
-------------------------

`Download example.sh <https://raw.githubusercontent.com/PSU-OIT-ARC/arc-docs/master/examples/slurm/example.sh>`_

.. literalinclude:: /examples/slurm/example.sh

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