Linux Clusters
==============

This page contains information about the research servers and instructions on how to run your programs in a cluster environment.

Servers and Hardware
--------------------

TODO:  Include hardware specs and benchmarks for cluster here.

TODO: General cluster layout and information.

.. figure:: /img/gravel.JPG
   :alt: The Gravel Cluster.
   :scale: 50

   A photo of the Gravel Cluster blade servers.


.. figure:: /img/hydra.JPG
   :alt: The Hydra Cluster.

   A photo of the Hydra Cluster servers (highlighted in red).

.. _pgiCluster:

ROCKS: The Cluster Distribution
-------------------------------

TODO: Write about ROCKS information that will help the user.

Ganglia
-------

TODO: Write about the web interface for monitoring the linux clusters.

Slurm: The Cluster Scheduler
----------------------------

TODO: Write about slurm.

How to use the scheduler for MPI style programs.

TODO: How do I run non-mpi style programs on the cluster?

PGI Cluster Development Kit: Linux Cluster
---------------------------------------------

TODO: Instructions on how to run PGI on the linxu clusters!  Yay!

FDTD
----

TODO: Describe FDTD.

Gaussian G09
------------

The Gaussian software is installed on linux clusters and is available for use if you are authorized to use the available license.  You must be added to the ``gaussian`` unix group in order to run ``g09`` which should be specifically requested when requesting a research account.  

Setting up ``g09`` 
``````````````````

``g09`` requires some simple modifications to your user environment.  Add the following to to your ``~/.bashrc`` file::

  g09root="/share/apps"
  GAUSS_SCRDIR="~/gaussian_scratch"
  export g09root GAUSS_SCRDIR
  source $g09root/g09/bsd/g09.profile

The ``$GAUSS_SCRDIR`` env variable is used as the gaussian scratch folder.  For now, leave this in your home directory and keep an eye on its size and clean up old files.

Testing Gaussian
````````````````

You can test to make sure ``g09`` is working properly and your environment is set up correctly by setting up a simple ``g09`` test and then writing a schelulings script to submit the job to ``slurm``, the cluster scheduler.  The following is a simple test:

.. literalinclude:: /examples/g09/g09-test.gjf

_`Download g09-test.gjf<https://raw.githubusercontent.com/PSU-OIT-ARC/arc-docs/master/examples/g09/g09-test.gjf>`


