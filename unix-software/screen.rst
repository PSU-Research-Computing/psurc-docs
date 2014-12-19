************************************************
Set up GNU ``screen`` for long running processes
************************************************

``screen`` is a simple way to start a process on the research servers that you want to keep running even aver you are logged out of the session.

Configuring Screen
==================

Before we start, lets add as simple configuration file that vastly improves the screen programs behavior.

Create a file in your home directory called ``.screenrc``::

  touch ~/.screenrc

Paste in the following settings using your preferred ``$EDITOR``

.. literalinclude:: /examples/screen/screenrc

`Download screenrc <https://raw.githubusercontent.com/PSU-OIT-ARC/arc-docs/master/examples/screen/screenrc>`_

This changes some subtle behavior and turns on a status bar making screen a little bit easier to wrap your head around.  It also turns off the annoying startup message.

Using Screen
============

Here is a quick walkthrough of how to use screen.  To start using ``screen``, run::

  > screen

This opens a new ``screen`` session.  Type some commands into the window such as listing files (``ls``) or changing directory (``cd ..``).

Now we can disconnect from this screen and have it continue to run in the background.  ``screen`` uses keyboard shortcuts where you press two keys at once, let go, then press the next key to actually issue the command.  First press the two keys at the same time::

  Ctl-a

Let go, then press::

  d

This should disconnect you from your screen session and take you back to where you were before you launch ``screen``.  You can have multiple ``screen`` sessions running at the same time (and have even more ``screen`` windows per ``screen`` session if you really want!).

.. note:: In the future, this kind of keyboard shortcut will be referred to as ``Ctl-a d``

Reconnecting to screen
======================
To reconnect to screen, we can type ``screen -ls`` similar to list the running screen sessions.  (Similar to how ``ls`` will list the files in the current directory).

.. code-block:: sh

  > screen -ls
  There is a screen on:
   19250.pts-8.rocks (Detached)
  1 Socket in /var/run/screen/S-bcomnes.

This lists the running screen sessions.  Each session has a number associated with it.  To reconnect to a particular screen session type::

  screen -r 19250

where ``19250`` is the number associated with the screen session you want to connect to.

To end a screen session, reconnect to it, and just exit out of all the processes running and then end the session by typing::

  exit

There are lots of cool ``screen`` features.  Here is a quick rundown of screen window management:

``Ctl-a c``
  Create a window in the current screen session

``Ctl-a n``
  Go to the next window in the current screen session

``Ctl-a d``
  Disconnect from current screen session.
