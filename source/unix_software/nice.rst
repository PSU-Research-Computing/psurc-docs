****
Nice
****

Information on modifying your process priority using ``nice``.

How to nice your processes
==========================

It is important to ``nice`` intensive processes so that they don't interfere with using the most basic functions of the research server such as changing directories or moving files.

The ``nice`` and ``renice`` commands adjust the priority of a process.  ARC recommends that all users ``nice`` all of their processes with a value of at least 5.  To nice a process when it is started type::

  $ nice +5 [other_commands]

where ``[other_commands]`` is the command you actually wan to run.  If you have already started a job and want to nice it after the fact, you can use the ``renice`` command to do this.  First identify the process ID that you wish to nice::

  $ ps -u

Then run ``renice`` on it::

  $ renice +5 [PID]

where ``[PID]`` is the process ID.
