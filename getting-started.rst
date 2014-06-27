

Getting Started
===============

Here are some steps that will help set up a nice research shell environment.

Make sure bash is your default shell
------------------------------------

You may not be running bash, but you should.  The research servers often set your default shell to tcsh, but you should really be using bash.  This document will describe how to check which shell you are running by default, and what you should do if if its not set to bash.

Check which shell you are running
`````````````````````````````````

Log into any research server and enter the following command:

.. highlight:: sh
  echo $0

If you see any kind of output other than something like this:

.. highlight:: sh
  bash

then you are likely running some other shell by default, most likely tcsh or some variation of this.  This command tells you what your active shell is.

What to do if my default shell is NOT bash?
```````````````````````````````````````````

Send us a quick request from your pdx email address requesting that your default research account shell be set to bash.  

What to do in the meantime
``````````````````````````

You can always switch over to bash by typing the following into the console no matter what your default shell is set to:

.. highlight:: sh
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



Set up GNU screen for long running processes
--------------------------------------------

Set up SSH keys and config files
--------------------------------

How to nice your processes
--------------------------

Setting up programs in your home directory
------------------------------------------