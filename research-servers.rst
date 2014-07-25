****************
Research Servers
****************

This page contains information about the research servers and the software that is installed on them that require specialized instructions.

Servers and Hardware
====================

The following research servers are available for running serialized jobs:

+----------------------+------------------------+------------------------+
|    Server Domain     | ``hecate.rc.pdx.edu``  |  ``circe.rc.pdx.edu``  |
+======================+========================+========================+
| **Model**            | Dell R720              |                        |
+----------------------+------------------------+------------------------+
| **Ram**              | 757GB                  | 189GB                  |
+----------------------+------------------------+------------------------+
| **OS**               | CentOS 6.5             |                        |
+----------------------+------------------------+------------------------+
| **CPU**              | 2 x Intel Xeon E5-2690 | 2 x Intel Xeon E5-2665 |
+----------------------+------------------------+------------------------+
| **Clock**            | 2.9Ghz                 | 2.40GHz                |
+----------------------+------------------------+------------------------+
| **Cores**            | 16 (8/CPU)             |                        |
+----------------------+------------------------+------------------------+
| **Special Hardware** |                        | Nvidia Tesla K20 GPU   |
+----------------------+------------------------+------------------------+
| **HyperThreading**   | Enabled                | Enabled                |
+----------------------+------------------------+------------------------+

Usage Tips
----------

Programs that require large amounts of memory (100's of GB) should be run on ``hecate`` while everything else should be run on ``circe``.  The servers have hyper-threading enabled, so it appears like there are more CPU cores than there actually are.  Remember, more threads usually does not result in faster performance.  Each program should be benchmarked to find the optimal thread count in order to maximize performance.  This number is usually between 4 and 8 threads but you wont know unless you test or are referencing suggested thread counts for the program you are running.


Information on Python
=====================

It is difficult to update python beyond the version CentOS provides at the system level.  For this reason, ARC offers an alternate python environments using ``pyenv``.

If you are interested in installing your own python packages to your home folder, you must do so in a virtual environment.  In short, switch to the version of python that you want in your ``virtualenv`` using ``pyenv``, create the ``virtualenv``, and proceed to do all your development in that ``virualenv`` going forward.

Activate pyenv in your environment
----------------------------------
You must add the following lines in either your ``~/.bash_profile`` or ``~/.bashrc file``

.. code-block:: sh

  export PYENV_ROOT="/vol/apps/system/python/pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"

Not sure which file to edit? See :ref:`dotfiles`.

Now re-``source`` your settings file (IE ``source ~/.bashrc``) or log out and back in.

Check which versions of python are available
--------------------------------------------

Now that the the `pyenv` command is available, check which versions are installed::

  > pyenv versions
  * system (set by /vol/apps/system/python/pyenv/version)
  2.7.6
  3.3.3

This shows three versions of python, and which one is active notated by the ``*``.  In this case, it system python is set as the active python version.

Switch your session to the version you want
-------------------------------------------

We want to start using a nwer version of python.  We can do this by the following::

  > pyenv shell 2.7.6
  > python --version
  Python 2.7.6

We are now using the updated version of python provided by ``pyenv``

Create a virtual environment in your home directory
---------------------------------------------------

By creating a virtual environment in your home directory, you are setting up your very own python enviornment based on the version of python you selected in the previous steps.  This will enable you to install python packages with ``pip`` freely without having to request an admin to install them for you. ::

  > virtualenv ~/python2
  > source ~/python2/bin/activate

Upon first activation, its a good idea to update pip and setuptools::

  pip install --upgrade pip
  pip install --upgrade setuptools

After the initial creation and updating, all you have to do is activate your virtualenv when you want to use it, and you can install packages with pip into your home directory.

You can deactivate all virtualenviroments and revert back to system python by typing::

  pyenv deactivate


Information on Perl
===================

To use an updated ``perl`` version we need to use ``perlbrew`` and point it at the ``perlbrew`` install that works system wide.

Make sure you are running bash as your default shell the add the following two lines to your ``.bashrc`` file::

  export PERLBREW_ROOT=/vol/apps/system/perl/perlbrew
  source $PERLBREW_ROOT/etc/bashrc

Run this command to see which versions of perl are available::

  perlbrew list

Run this command to activate  the version you want::

  perlbrew switch perl-5.18.1

.. note:: Make sure you use the the correct version that is listed as available above.

Run this command to switch back to system ``perl``::

  perlbrew switch-off


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

System MPI
==========

Message passing has been installed on the research system, but has to be enabled using the module system.   Here are examples on how to do that if you need those::

  module load openmpi-x86_64
  module load mpich2-x86_64

These commands can be added to your ``.bashrc`` if you need them routinely or dynamically loaded from shell scripts that launch your MPI jobs.  You may be interested in running this on the :ref:`cluster`.

