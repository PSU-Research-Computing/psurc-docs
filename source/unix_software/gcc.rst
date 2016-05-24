.. gcc.rst

***
GCC
***

ARC aims to supply robust up-to-date versions of GCC.

Currently we support the lastest release of every major version of GCC. If there is a version of GCC that isn't supported that you need please let us know and we'll get to building it for you.

GCC on compute servers (Circe/Hecate):
======================================

All versions of GCC can be found under:

.. code-block:: sh

    /vol/apps/gcc/

Versions Currenty Supported:
----------------------------

* 4.4.7 (system)
* 4.6.4 
* 4.7.4
* 4.8.5
* 4.9.3
* 5.1.0
* 5.2.0
* 5.3.0
* 6.1.0

Languages Currently Supported:
------------------------------

* C
* C++
* Objective C
* Objective C++
* Fortran

.. note:: GCC on the compute servers does not support 32 bit 
    
GCC on Clusters (Hydra/Deino):
==============================

We are currently working on building GCC on the clusters.

GCC has been built up to 4.9.3 on Deino.

Versions Currenty Supported:
----------------------------

* 4.4.7 (system)
* 4.6.4 
* 4.7.4
* 4.8.5
* 4.9.3

Languages Currently Supported:
------------------------------

* C
* C++
* Objective C
* Objective C++
* Fortran


.. note:: Newer GCC builds are not yet available on Hydra

Using non-system GCC
====================

Using a non-system GCC is done serveral different ways depending on your use-case. This document will cover two common scenarios you might encounter.

Compiling a single file:
------------------------

First, set your ``LD_LIBRARY_PATH`` to include the libraries of gcc build you want to use. (This configuration will change when you log out or change shells)

.. code-block:: sh

    export LD_LIBRARY_PATH=/vol/apps/gcc/gcc-6.1.0/lib:/vol/apps/gcc/gcc-6.1.0/lib64

After your library path is set, compile your file using the full path to the non-system gcc compiler.

.. code-block:: sh

    /vol/apps/gcc/gcc-6.1.0/bin/gcc myfile.c

Compiling a program with make:
------------------------------

The process of using a non-system gcc to compile software with ``make`` differs between programs. Generally ``make`` will look for environment vairables durring the ``configure`` step that tell ``make`` which compiler and libraries to build the program with. To get a list of significant environment vairables run the following command inside the programs base directory.

.. code-block:: sh

    ./configure --help

Some typical enviroment vairables for setting compiler paths include:

.. code-block:: sh

    CC  -- C compiler (gcc)
    CXX -- C++ compiler (g++)
    FC  -- Fortran compiler (gfortran)
    F77 -- Fortran 77 compiler (typically gfortran)

Before configuring your software set the nesseary compiler environment variables and your library path variable in your current shell.

.. code-block:: sh

    export LD_LIBRARY_PATH=/vol/apps/gcc/gcc-6.1.0/lib:/vol/apps/gcc/gcc-6.1.0/lib64
    export CC=/vol/apps/gcc/gcc-6.1.0/bin/gcc

    ./configure
    make
    make install


