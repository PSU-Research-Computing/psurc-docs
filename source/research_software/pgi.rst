..  pgi.rst
***************************
PGI Cluster Development Kit
***************************

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
