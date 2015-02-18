..  pgi.rst
***************************
PGI Cluster Development Kit
***************************

.. contents:: Topics

.. _pgiCluster:

.. TODO: Instructions on how to run PGI on the linux clusters!  Yay!

.. _pgiResearch:

PGI Cluster Development Kit: Research Servers
=============================================

To use the PGI compiler you have to enable it.  While it it is worth reading through the PGI documentation on how to fully do this, here is a quick set of instructions to get you started.

PGI is installed in::

  /vol/apps/system/pgicdk

You can gain access to its tools by adding the following to your ``.bashrc`` file::

  export PGI=/vol/apps/system/pgi
  export PATH=$PGI/linux86-64/2014/bin:$PATH
  export MANPATH=$MANPATH:$PGI/linux86-64/2014/man
  export LM_LICENSE_FILE=$LM_LICENSE_FILE:27005@pgi.license.pdx.edu:$PGI/license.dat

PGI comes with its own versions of openMPI and MPICH.  You can enable MPICH for example, by these by adding this to your ``.bashrc`` file as well::

  export PATH=$PGI/linux86-64/14.6/mpi/mpich/bin:$PATH
  export MANPATH=$MANPATH:$PGI/linux86-64/14.6/mpi/mpich/man

ARC has a license for the cluster development kit.


Portland Group Cluster Development Kit (PGICDK)
-----------------------------------------------

ARC provides access to a Portland Group (PGI) `Cluster Development Kit`_ license.  Some of the popular tools in this software package include:

- PGFORTRAN
- PGCC
- PGC++

It also includes tools that can take advantage of NVIDIA CUDA running on supported devices such as the Nvidia Tesla K20 GPU installed in Circe.  Using PGI requires that you set up the tools in your user environment.  This varies from system to system so please refer to th specific system you wish to use PGI on.

- :ref:`pgiResearch`
- :ref:`pgiCluster`

.. _`Cluster Development Kit`: https://www.pgroup.com/products/pgicdk.htm
