..  python.rst

******
Python
******


It is difficult to update python beyond the version CentOS provides at the system level.  For this reason, ARC offers an alternate python environments using ``pyenv``.

If you are interested in installing your own python packages to your home folder, you must do so in a virtual environment.  In short, switch to the version of python that you want in your ``virtualenv`` using ``pyenv``, create the ``virtualenv``, and proceed to do all your development in that ``virualenv`` going forward.

Activate pyenv in your environment
==================================
You must add the following lines in your ``~/.bashrc`` file:

Compute servers (Circe/Hecate):
-------------------------------

.. code-block:: sh

  export PYENV_ROOT="/vol/apps/system/python/pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"

Compute Clusters (Hydra/Gravel):
--------------------------------

.. code-block:: sh

  export PYENV_ROOT="/share/apps/user/stow/pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"



Now re-``source`` your settings file (IE ``source ~/.bashrc``) or log out and back in.

Check which versions of python are available
============================================

Now that the `pyenv` command is available, check which versions are installed::

  > pyenv versions
  * system (set by /vol/apps/system/python/pyenv/version)
  2.7.6
  3.3.3

This shows three available versions of python. The currently active version denoted by the ``*``.  In this case, system python is the currently active python version.

Switch your session to the version you want
===========================================

To change to a different version of python use the ``shell`` command::

  > pyenv shell 2.7.6
  > python --version
  Python 2.7.6

Now python 2.7.6 is the active python version provided by ``pyenv``

Create a virtual environment in your home directory
===================================================

Virtual Environments are local python installations that allow you to install python packages locally with ``pip`` without having to request an admin to install them for you. 
Virtualenvs are easy to setup and quite disposable if you mess up.
The ``virtualenv`` command will create a virtual environment with the python version that is currently selected in pyenv::

  > mkdir my_environment
  > virtualenv my_environment
  > source my_environment/bin/activate

Upon first activation, its a good idea to update pip and setuptools::

  > pip install --upgrade pip
  > pip install --upgrade setuptools

After you have created, updated and activated your new virtual environment you can install packages with ``pip`` freely.

To exit your python environment type: ::

  > deactivate

To reactivate an environment you have already created type: ::

  > source my_environment/bin/activate

Now you can freely install packages with ``pip`` once again!!

Using Pyenv and Virtualenv on Hydra
===================================
Because hydra uses a scheduler to run jobs using pyenv requires a few extra steps to get jobs running.

This section is assuming that you have already created a virtualenv with pyenv and virtualenv using the steps above.

Using Full Path to Python
-------------------------
If you want to run jobs with a python virtualenv in slurm you will need to use the **full path** to the python installed in your virtualenv in the commands in your slurm script.

**Example:** You created a virtualenv with python 2.7.7 called ``env2`` that is in your home directory (``/home/me/``). You want to run a python script you wrote called ``my_script.py`` on the slurm scheduler.

If you were running a python script in slurm with the default system python this line would be in your slurm script: ::

  > srun python my_script.py

But because you are using a personal virtualenv you need to specify **full path** to the python in your virtualenv (this line will go into your slurm batch file): ::

  > srun /home/me/env2/bin/python my_script.py

Setting Python Evironment Variables
-----------------------------------

**WAIT!!!** You are not completely ready to run jobs through slurm quite yet. Before you can run your jobs you need to set two ``environment variables``, ``PYTHONPATH`` and ``PYTHONHOME``:

Setting PYTHONPATH
------------------

``PYTHONPATH`` points to extra libraries you want to use with your script. In our case, we point it to the default libraries found in the pyenv installation.

**Example:** Type this into the command line on your head node before your run your slurm script ::

  > export PYTHONPATH=/share/apps/pyenv/versions/<version_you_are_using>/lib/python<version>

Replace <version_you_are_using> with the version of python you chose to make your env with.

**Example:** If you chose to use python 2.7.7 your ``PYTHONPATH`` would be ::

  > export PYTHONPATH=/share/apps/pyenv/versions/2.7.7/lib/python2.7

If you used python 3.4.3 your ``PYTHONPATH`` would be: ::

  > export PYTHONPATH=/share/apps/pyenv/versions/3.4.3/lib/python3.4


Setting PYTHONHOME
------------------

``PYTHONHOME`` is an environment variable that points to the python executable you want to use. ``PYTHONHOME`` should be the path to your virtualenv directory.

**Example:** You created a virtualenv with python 2.7.7 called ``env2`` that is in your home directory (``/home/me/``). ::

  > export PYTHONHOME=/home/me/env2

Running your job
----------------

After you have set these evironment variables in your shell you are set to schedule jobs through slurm. These environment variables will only live as long as your session is open. You will have to set them every time you login and want to run a job with your virtualenv in slurm. 

You can add ``PYTHONPATH`` and ``PYTHONHOME`` to your ``~/.bashrc`` to make the changes last after you logout. This will likely cause issues when creating new virtualenvs, using pyenv and using the python interpreter outside of your env and slurm. 
