****
Bash
****

Bash is the default ``shell`` on ARC's systems. You are free to use a different shell if you'd like, however, all of our documentation only supports Bash implementations.

Check which shell you are running
=================================

Log into any research server and enter the following command::

  echo $0

If you see any kind of output other than something like this::

  > echo $0
  -bash

then you are likely running some other shell by default, most likely ``tcsh`` or some variation of this.  This command tells you what your active shell is.

What to do if my default shell is NOT bash?
===========================================

Send us a quick request from your PDX email address requesting that your default research account shell be set to bash.

What to do in the meantime
==========================

You can always switch over to bash by typing the following into the console no matter what your default shell is set to after logging in::

  > bash
