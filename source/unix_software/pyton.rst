..  pyton.rst

******
Python
******


It is difficult to update python beyond the version CentOS provides at the system level.  For this reason, ARC offers an alternate python environments using ``pyenv``.

If you are interested in installing your own python packages to your home folder, you must do so in a virtual environment.  In short, switch to the version of python that you want in your ``virtualenv`` using ``pyenv``, create the ``virtualenv``, and proceed to do all your development in that ``virualenv`` going forward.

Activate pyenv in your environment
==================================
You must add the following lines in either your ``~/.bash_profile`` or ``~/.bashrc file``

.. code-block:: sh

  export PYENV_ROOT="/vol/apps/system/python/pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"

Not sure which file to edit? See :ref:`dotfiles`.

Now re-``source`` your settings file (IE ``source ~/.bashrc``) or log out and back in.

Check which versions of python are available
============================================

Now that the the `pyenv` command is available, check which versions are installed::

  > pyenv versions
  * system (set by /vol/apps/system/python/pyenv/version)
  2.7.6
  3.3.3

This shows three versions of python, and which one is active notated by the ``*``.  In this case, it system python is set as the active python version.

Switch your session to the version you want
===========================================

We want to start using a nwer version of python.  We can do this by the following::

  > pyenv shell 2.7.6
  > python --version
  Python 2.7.6

We are now using the updated version of python provided by ``pyenv``

Create a virtual environment in your home directory
===================================================

By creating a virtual environment in your home directory, you are setting up your very own python environment based on the version of python you selected in the previous steps.  This will enable you to install python packages with ``pip`` freely without having to request an admin to install them for you. ::

  > mkdir my_environment
  > virtualenv ~/my_environment
  > source ~/my_environment/bin/activate

Upon first activation, its a good idea to update pip and setuptools::

  pip install --upgrade pip
  pip install --upgrade setuptools

After you have created and updated your new virtual environment your environment is activated and you can install packages with ``pip`` freely.

To exit your python environment type: ::

  deactivate

To reactivate an environment you have already created type: ::

    source my_environment/bin/activate

Now you can freely install packages with ``pip`` once again!!
