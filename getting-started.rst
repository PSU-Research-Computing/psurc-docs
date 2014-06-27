.. highlight:: sh

Getting Started
===============

Here are some steps that will help set up a nice research shell environment.

Make sure bash is your default shell
------------------------------------

You may not be running bash, but you should.  The research servers often set your default shell to tcsh, but you should really be using bash.  This document will describe how to check which shell you are running by default, and what you should do if if its not set to bash.

Check which shell you are running
`````````````````````````````````

Log into any research server and enter the following command::
  
  echo $0

If you see any kind of output other than something like this::
  
  > echo $0
  -bash

then you are likely running some other shell by default, most likely tcsh or some variation of this.  This command tells you what your active shell is.

What to do if my default shell is NOT bash?
```````````````````````````````````````````

Send us a quick request from your pdx email address requesting that your default research account shell be set to bash.  

What to do in the meantime
``````````````````````````

You can always switch over to bash by typing the following into the console no matter what your default shell is set to after logging in::
  
  bash

Get your dotfiles in order
--------------------------

Dotfiles (files that live in your home directory that start with a '.') are hidden preference files that allow you to change your shell environment and settings for different unix programs.  You can see these files by passing the ``-a`` flag to the ``ls`` command.

Confused about the differences between ``.bashrc`` and ``.bash_profile``? 

Load ``.bashrc`` from ``.bash_profile``
```````````````````````````````````````

By loading ``.bashrc`` from ``.bash_profile`` you can simplify your life by (mostly) just having to worry about making changes to a single file.  Add the following lines to your ``.bash_profile`` file in your home directory.

.. code-block:: sh
  
  # Enable .bashrc
  # If running bash
  if [ -n "$BASH_VERSION" ]; then
  # include .bashrc if it exists
      if [ -f "$HOME/.bashrc" ]; then
          . "$HOME/.bashrc"
      fi
  fi

Now you can edit shell environments in ``.bashrc`` and it always works 



Set up GNU ``screen`` for long running processes
--------------------------------------------

``screen`` is a simple way to start a process on the research servers that you want to keep running even aver you are logged out of the session.

Configuring Screen
``````````````````

Before we start, lets add as simple configuration file that vastly improves the screen programs behavior.

Create a file in your home directory called ``.screenrc``::
  
  touch ~/.screenrc

Paste in the following settings using your preferred ``$EDITOR``

.. code-block:: sh
  
  # Source: https://gist.github.com/bcomnes/6689991/download
  # Sets the screen to use login shells
  shell -$SHELL
   
  # To reload .screenr Press Ctrl - a : source ~/.screenrc
   
  # Turn of startup message
  startup_message off
   
  # This helps prevent the screen from doing funny things.
  defflow off
  defnonblock on
   
  # Enable 256-color mode when screen is started with TERM=xterm-256color
  # Taken from: http://frexx.de/xterm-256-notes/
  # I took it from: http://www.robmeerman.co.uk/unix/256colours 
  #
  # Note that TERM != "xterm-256color" within a screen window. Rather it is
  # "screen" or "screen-bce"
  # 
  # terminfo and termcap for nice 256 color terminal
  # allow bold colors - necessary for some reason
  attrcolor b ".I"
  # tell screen how to set colors. AB = background, AF=foreground
  termcapinfo xterm-256color 'Co#256:AB=\E[48;5;%dm:AF=\E[38;5;%dm'
   
  # Sets the status bar
  caption string "%?%F%{= Bk}%? %C%A %D %d-%m-%Y %{= kB} %t%= %?%F%{= Bk}%:%{=  wk}%? %n "
  hardstatus alwayslastline
  hardstatus string '%{= kG}[ %{G}%H %{g}][%= %{= kw}%?%-Lw%?%{r}(%{W}%n* %f%t%?(%u)%?%{r})%{w}%?%+Lw%?%?%= %{g}][%{B} %d/%m %{W}%c %{g}]'


Using Screen
````````````

Here is a quick walkthrough of how to use screen.  To start using ``screen``, run::
  
  screen

This opens a new ``screen`` session.  Type some commands into the window such as listing files (``ls``) or changing directory (``cd ..``).

Now we can disconnect from this screen and have it continue to run in the background.  ``screen`` uses keyboard shortcuts where you press two keys at once, let go, then press the next key to actually issue the command.  First press the two keys at the same time::
  
  Ctl-a

Let go, then press::
  
  d

This should disconnect you from your screen session and take you back to where you were before you launch ``screen``.  You can have multiple ``screen`` sessions running at the same time (and have even more ``screen`` windows per ``screen`` session if you really want!).  

.. note:: In the future, this kind of keyboard shortcut will be referred to as::
  
  Ctl-a d

To reconnect to screen type
```````````````````````````
.. code-block:: sh
  $ screen -ls
  There is a screen on:
   19250.pts-8.rocks (Detached)
  1 Socket in /var/run/screen/S-bcomnes.

This lists the running screen sessions.  Each session has a number associated with it.  To reconnect to a particular screen session type::
  
  screen -r 19250

where ‘19250’ is the number associated with the screen session you want to connect to.  

To end a screen session, reconnect to it, and just exit out of all the processies running and then end the session by typing::
  
  exit

There are lots of cool ``screen`` features.  Here is a quick rundown of screen window management:

- ``Ctl-a c`` Create a window in the current screen session

- ``Ctl-a n`` Go to the next window in the current screen session

Set up SSH keys and config files
--------------------------------

How to nice your processes
--------------------------

Setting up programs in your home directory
------------------------------------------
