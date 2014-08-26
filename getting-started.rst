.. highlight:: sh

***************
Getting Started
***************

Here are some steps that will help set up a nice research shell environment.

Make sure bash is your default shell
====================================

You may not be running bash, but you should.  The research servers often set your default shell to ``tcsh``, but you should really be using bash.  This document will describe how to check which shell you are running by default, and what you should do if if its not set to bash.

Check which shell you are running
---------------------------------

Log into any research server and enter the following command::

  echo $0

If you see any kind of output other than something like this::

  > echo $0
  -bash

then you are likely running some other shell by default, most likely ``tcsh`` or some variation of this.  This command tells you what your active shell is.

What to do if my default shell is NOT bash?
-------------------------------------------

Send us a quick request from your PDX email address requesting that your default research account shell be set to bash.

What to do in the meantime
--------------------------

You can always switch over to bash by typing the following into the console no matter what your default shell is set to after logging in::

  > bash

.. _dotfiles:

Getting your dotfiles in order
==============================

Dotfiles (files that live in your home directory that start with a ``.``) are hidden preference files that allow you to change your shell environment and settings for different unix programs.  You can see these files by passing the ``-a`` flag to the ``ls`` command.

When you want to make changes to your environment that take effect every time you log in just add them to your ``.bash_profile``.  Careful though!  If you screw this file's syntax up you may break your ``$PATH`` making it difficult to edit the file to fix the problem.

Set up GNU ``screen`` for long running processes
================================================

``screen`` is a simple way to start a process on the research servers that you want to keep running even aver you are logged out of the session.

Configuring Screen
------------------

Before we start, lets add as simple configuration file that vastly improves the screen programs behavior.

Create a file in your home directory called ``.screenrc``::

  touch ~/.screenrc

Paste in the following settings using your preferred ``$EDITOR``

.. literalinclude:: /examples/screen/screenrc

`Download screenrc <https://raw.githubusercontent.com/PSU-OIT-ARC/arc-docs/master/examples/screen/screenrc>`_

This changes some subtle behavior and turns on a status bar making screen a little bit easier to wrap your head around.  It also turns off the annoying startup message.

Using Screen
------------

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
----------------------
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

Set up SSH keys and config files
================================
You can enable secure, password-free authentication to the ARC servers using SSH keys.  SSH keys are a public/private key system that is more secure than traditional passwords, and offers a more convenient login mechanism than typing in your password every time you connect.

SSH Keys work by generating two cryptographic key files.  One of the files is private (keep it a secret!) and the other is public (it doesn't matter if someone gets a copy of it, but don't unnecessarily distribute it).

Generating Keypair
------------------
On your computer create a ssh RSA keypair by typing::

  $ ssh-keygen -t rsa

This creates a pair of keys (public ``id_rsa.pub`` and private ``id_rsa``).

Should I set a Passphrase for my Private Key?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Yes!**

Because it is really bad if someone gets a copy of your private key (``id_rsa``) you **should** set a passphrase for your private key.  This passphrase is used to encrypt the private key so that it cannot simply be used if a copy is made by a bad actor.  It also means that a password must be used every time your private key is needed. In order to avoid this anoyance, most modern operating systems will provide a keychain system that can keep track of and auto submit this private key passphrase.  On OS X, the ``Keychain.app`` will be your passphrase manager and will prompt you save the passphrase.  Most Linux distributions will automatically offer to save the password using it's flavor of passphrase manager.  You should accept the offer and let your system remember this.

On windows, you can use a program such as pageant_ or keepass_ with the KeeAgent_ plugin.

.. _pageant: http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
.. _keepass: http://keepass.info/download.html
.. _KeeAgent: http://keepass.info/plugins.html#keeagent

Set folder permissions on server
--------------------------------
Because of some existing configuration errors, home folders are created with incorrect permissions.  In order for ssh keys to work, you must set these correct permissions on the appropriate folders and files.

Open a ssh connection to the server and run the following::

  $ touch ~/.ssh/authorized_keys
  $ chmod 711 ~ && chmod 711 ~/.ssh && chmod 600 ~/.ssh/authorized_keys

Upload public key to server
---------------------------

On your computer run the following::

  $ cat ~/.ssh/id_rsa.pub | ssh [user]@[server]:~/.ssh/authorized_keys

(change user and server as appropriate)

The password-free login should now work. Connect by ``$ ssh [user]@[server]``

.. note:: You can create a single public/private key per device you connect from, or create a single key pair that is used on all your devices.  Each method has it's pros and cons relating to key invalidation.  If you generate a key per device, you can simple append additional public keys on new lines in the ``~/.ssh/authorized_keys`` file.

Create aliases for servers
--------------------------

You can create aliases for the servers to more easily connect.

Create a file in ``~/.ssh/`` called 'config' and add servers with the following format::

  host [hostname]
    hostname [server] user[username]

Example::

  host [example]
    hostname [example.server.tld] user[myname]

Now you can connect to the server running::

  ssh example

Which will connect to ``myname@example.server.tld``


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

Using ``htop`` to keep an eye on the server
===========================================

You can use a program called ``htop`` to keep an eye on the server.

.. figure:: /img/htop.png
   :alt: A screenshot of the htop program running on hecate.

   A screenshot of the htop program running on hecate.

Setting up programs in your home directory
==========================================

You can use a simple program called ``stow`` to manage built-from-source applications in your  home directory.

Fist, create a ``stow`` and ``src`` folder in your home directory::

  > cd ~
  > mkdir stow
  > mkdir src

Next download the program you wish to build form source to the src folder::

  > cd ~/src
  > wget http://example.com/program-1.0.0.tar.gz
  ...
  > tar -xvzf program-1.0.0.tar.gz
  ...
  > cd program-1.0.0

Create a folder in the stow folder where you want your program insalled::

  > mkdir ~/stow/program-1.0.0

Read about available build options and decide if you need to change any default options::

  > cd ~/src/program-1.0.0
  > ./configure --help
  ...
  #Lots of options

Configure the program to install to the stow prefix that we just created and set any other options or flags that you need.  This step may vary from program to program.  You may encounter errors on this step so watch for errors and warnings and research them::

  > cd ~/src/program-1.0.0
  > ./configure --prefix=~/stow/program-1.0.0


Next ``make`` the program from source.  Watch for errors on this step and research them as the come up::

  # in ~/src/program-1.0.0
  > make
  ...
  # lots of output

Finally, once your program builds successfully install it to the ``prefix`` directory that we set in the configure step.  Watch for errors on this step::

  # in ~/src/program-1.0.0
  > make install

If the install is successful, navigate to the program folder in the ``stow`` folder and inspect what was installed::

  > cd ~/stow/program-1.0.0
  > ls -a
  bin  lib
  # etc...

If you see files/folders not conforming to the standard Unix folder structure::

  /bin
  /include
  /lib
  /lib64
  /local
  /sbin
  /share
  /tmp

you should consider cleaning up the install as the install did not follow standard convention and make a mess.  If the program installed cleanly, you can ``stow`` the program::

  > cd ~/stow
  > stow -S program-1.0.0

Running this ``stow`` command symlinks the contents of ``program-1.0.0`` into the directory above the ``stow`` folder.  In this case this is your home folder.  ``bash`` is configured to use the default Unix directory in the home folder by default, so now binaries from ``program-1.0.0`` should be in your ``$PATH``.

Lets say we want to un-``stow`` a program to remove it from our environment or to stow a new version.  We cam simply run::

  > cd ~/stow
  > stow -D program-1.0.0

The program symlinks are now removed from your home directory.

``stow`` is intelligent enough to not overwrite files and keeps track of everything it installs.  Its simple, but effective.