.. gcc.rst

*******
GCC 4.8
*******

``GCC`` stands for GNU Compiler Compilation. Gcc contians compilers for C, C++, Java, Fortran and a few others. Currently, our compute servers only have gcc 4.4.7 installed system wide. If you need a newer install of GCC for things like C++11, GCC 4.8.4 is installed in /vol/apps/user/gcc-4.8.4 and is ready for you to use.

Setting up GCC 4.8.4 on your system:
------------------------------------
\*\*NOTE: GCC 4.8.4 is only installed on Circe and Hecate 

To get GCC 4.8.4 to run on your system all you have to do is add it to your ``PATH`` variable.

To do this add the line below to either your ``~/.bash_profile`` or ``~/.bashrc``:

.. code-block:: sh

    export GCC=/vol/apps/system/stow/gcc-4.8.2/
    export PATH=$GCC/bin:$PATH

To check if you are running the right version of GCC run this command:

::

    $> gcc --version

You if you appended you PATH variable correctly the output should look like this:

::

    gcc (GCC) 4.8.4
    Copyright (C) 2013 Free Software Foundation, Inc.
    This is free software; see the source for copying conditions.  There is NO
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

