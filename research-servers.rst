Research Servers
================

This page contains information about the research servers and the software that is installed on them that require specialized instructions.

Servers and Hardware
--------------------

The following research servers are available for running serialized jobs:

+----------------------+------------------------+------------------------+
| Server Domain        | ``hecate.rc.pdx.edu``  | ``circe.rc.pdx.edu``   |
+======================+========================+========================+
| **Model**            | Dell R720                                       |
+----------------------+------------------------+------------------------+
| **Ram**              | 757GB                  | 189GB                  |
+----------------------+------------------------+------------------------+
| **OS**               | CentOS 6.5                                      |
+----------------------+------------------------+------------------------+
| **CPU**              | 2 x Intel Xeon E5-2690 | 2 x Intel Xeon E5-2665 |
+----------------------+------------------------+------------------------+
| **Clock**            | 2.9Ghz                 | 2.40GHz                |
+----------------------+------------------------+------------------------+
| **Cores**            | 16 (8/CPU)                                      |
+----------------------+------------------------+------------------------+
| **Special Hardware** |                        | Nvidia Tesla K20 GPU   |
+----------------------+------------------------+------------------------+
| **HyperThreading**   | Enabled                | Enabled                |
+----------------------+------------------------+------------------------+

Information on Python
---------------------

It can be difficult and cause programs to update the system level python in CentOS. For this reason, we offer an alternate python installation that you can activate if you wish.

If you are interested in installing your own python packages to your home folder, you must do so in a virtual environment.  In short, switch to the version of python that you want in your virtualenv using pyenv, create the virtualenv, and procede to do all your development in that virualenv going forward.

Activate pyenv in your environment
``````````````````````````````````
You must add the following lines in either your ``~/.bash_profile`` or ``~/.bashrc file``

.. code-block:: sh

  export PYENV_ROOT="/vol/apps/system/python/pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)" 

Not sure which file to edit? See :ref:`dotfiles`.

Now resource your settings file (IE ``source ~/.bashrc``) or log in and out.

Check which versions of python are available
````````````````````````````````````````````

Now that the the `pyenv` command is available, check which versions are installed::

  > pyenv versions
  * system (set by /vol/apps/system/python/pyenv/version)
  2.7.6
  3.3.3

This shows three versions of python, and which one is active notated by the ``*``.  In this case, it system python is set as the active python version.

Switch your session to the version you want
```````````````````````````````````````````

We want to start using a nwer version of python.  We can do this by the following::

  > pyenv shell 2.7.6
  > python --version
  Python 2.7.6

We are now using the updated version of python provided by ``pyenv``

Create a virtual environment in your home directory
```````````````````````````````````````````````````

By creating a virtual environment in your home directory, you are setting up your very own python enviornment based on the version of python you selected in the previous steps.  This will enable you to install python packages with ``pip`` freely without having to request an admin to install them for you. ::

  > virtualenv ~/python2
  > source ~/python2/bin/activate

Upon first activation, its a good idea to update pip and setuptools::

  pip install --upgrade pip
  pip install --upgrade setuptools

After the initial creation and updating, all you have to do is activate your virtualenv when you want to use it, and you can install packages with pip into your home directory.

You can deactivate all virtualenviroments and revert back to system python by typing::

  pyenv deactivate

Information on perl
-------------------

Hi Perlmongers!  This is where we talk to you!

.. _pgiResearch:

PGI Cluster Development Kit: Research Servers
---------------------------------------------

TODO: Instructions on how to run PGI on the reasearch servers!  Yay!

