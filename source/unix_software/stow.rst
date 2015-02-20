.. _stow:

****
stow
****

Stow is a simple program that lets you automatically create symlinks between subfolders in a ``stow`` directory to the parent directory of the ``stow`` folder.  It is usful for managing built-from-srouce software.  It is used in ``/vol/apps/`` but it is also useful in your home directory.

Setting up programs in your home directory with stow
====================================================

You can use a simple program called GNU ``stow`` to manage built-from-source applications in your  home directory.

First, create a ``stow`` and ``src`` folder in your home directory::

  > cd ~
  > mkdir stow
  > mkdir src

Next download the program you wish to build form source to the ``src`` folder::

  > cd ~/src
  > wget http://example.com/program-1.0.0.tar.gz
  ...
  > tar xvzf program-1.0.0.tar.gz
  ...
  > cd program-1.0.0

Create a folder in the ``stow`` folder where you want your program installed::

  > mkdir ~/stow/program-1.0.0

Read about available build options and decide if you need to change any default options::

  > cd ~/src/program-1.0.0
  > ./configure --help
  ...
  #Lots of options

Configure the program to install to the ``stow`` prefix that we just created and set any other options or flags that you need.  This step may vary from program to program.  You may encounter errors or warnings at this step so watch out and research any that come up::

  > cd ~/src/program-1.0.0
  > ./configure --prefix=~/stow/program-1.0.0
  ...
  # Lots of output

Next ``make`` the program from source.  Watch for errors on this step and research them as the come up::

  # in ~/src/program-1.0.0
  > make
  ...
  # lots of output

Once your program builds successfully, install it to the ``prefix`` directory that we set in the configure step.  Watch for errors on this step::

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

you should consider cleaning up the install as the install did not follow standard convention and may make a huge mess.  If the program installed cleanly, you can ``stow`` the program::

  > cd ~/stow
  > stow -S program-1.0.0

Running this ``stow`` command with the ``-S`` flag (for save/stow?) symlinks the contents of ``~/stow/program-1.0.0`` into the directory above the ``~/stow`` folder.  In this case this is your home folder ``~/``.  ``bash`` is configured to use the default Unix directories in the home folder by default, so now binaries from ``program-1.0.0`` should be in your ``$PATH``.

Lets say we want to un-``stow`` a program to remove it from our environment or to stow a new version.  We can simply run::

  > cd ~/stow
  > stow -D program-1.0.0

Running ``stow`` with the ``-D`` flag (for delete?) deletes the symlinks created by stow from the step above.

``stow`` is intelligent enough to not overwrite files and keeps track of everything it installs.  Its simple, but effective.
