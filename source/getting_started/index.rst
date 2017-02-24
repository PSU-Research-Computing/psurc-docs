.. highlight:: sh
.. _getting-stared:


***************
Getting Started
***************

How Do I Log In?
================

Our computing resources must be connected to using ``ssh``. ``ssh`` is installed
come preinstalled on both linux and macOS. If you are using windows, you must
install a program to use ``ssh``. ``PuTTY`` is commonly used used for ``ssh`` 
on windows.

`ssh tutorial for linux and mac <https://support.rackspace.com/how-to/connecting-to-a-server-using-ssh-on-linux-or-mac-os/>`_
`ssh tutorial for windows (PuTTY) <https://mediatemple.net/community/products/dv/204404604/using-ssh-in-putty->`_

Logging In Off Campus
---------------------
If you are off the campus network you will have to use PSU's ``vpn client`` OR ``ssh`` onto ``hera.rc.pdx.edu`` and then ``ssh`` onto the server you want to access from there.
 
`PSU's VPN <https://www.pdx.edu/oit/virtual-private-network-vpn>`_


Storage
=======
There are several options for storage on our systems.

Home Directories
----------------
Your home directory (``~``) is your own personal default storage space. When you connect to a server via ``ssh`` you are in your home directory. Home directory space is **very limited**. Do not store large files here--only configuration files, documents, and locally built programs. The compute servers share home directories.

Scratch Drives
--------------
Each server has its own Scratch Drive or ``scratch space``. Scratch Drives are fast storage devices that you can use to store the data you want to run your jobs on. Scratch Drives are only intended to be used as short-term storage so please move your data off of scratch when you are done with your analysis. 

If you are going to use a scratch drive **please make a directory named after yourself to keep all of your files in**.

=======================
Scratch drive locations
=======================
Compute Servers (Circe/Hecate): 
  1. ``/disk/scratch``

Hydra (compute cluster):
  1. ``/scratch`` 
  2. ``/scratch2``

.. note:: Scratch Space is not shared between the servers. e.g: scratch on Hecate is separate from scratch on Circe

Research Shares (I-Drive)
-------------------------
Research Shares are shared folders that you need to request access to. To request access to a share **OR** request a separate research share for you project please go to: http://intranet.pdx.edu/oit/i-drive-request

Research shares can be found in: ``/vol/share`` on all systems (excluding gravel)

Other Tutorials on Getting Started
==================================
.. toctree::
    :maxdepth: 2
    :glob:


    tuning
    moving_files
    be_nice
    more_resources
