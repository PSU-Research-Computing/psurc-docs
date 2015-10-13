.. highlight:: sh
.. _getting-stared:


***************
Getting Started
***************

Server Resources:
=================

There are two kinds of computing services for running jobs that ARC provides, Compute Servers and Clusters.

Compute Servers:
----------------
When you make a research account you will have access to our compute servers Circe and Hecate by default. These servers are just large linux computers that allow multiple users to run jobs at once. Once you are connected to one of the compute servers, you can run jobs in the command line like you would on a normal linux computer, just be mindful of other users.

Compute Clusters:
-----------------
A compute cluster is a set of networked computers that act as one. Compute clusters provide much more power than the compute servers Circe and Hecate. We have two clusters here at ARC, Hydra and Gravel. If you want access to the compute clusters you will have to request access in addition to your regular research account.

Additional Information About Our Servers:
-----------------------------------------
.. toctree::
    :maxdepth: 2
    :glob:


    knowing_your_software
    pick_a_server


Connecting to Our Servers:
==========================
Use ssh to connect to our servers. ssh is included on Mac and Linux and can used via the command line. If you are on Windows you will need additional software, most commonly PuTTY, to access our servers over ssh.

Connecting Off Campus:
----------------------
If you are off the campus network you will have to use PSU's vpn client OR ssh onto hera.rc.pdx.edu and then ssh onto the server you want to access from there.

Additional Information About Connecting:
----------------------------------------
.. toctree::
    :maxdepth: 2
    :glob:


    connecting
 

Storage:
========
There are several options for storage on our systems.

Home Directories:
-----------------
Your home directory (``~``) is your own personal default storage space. When you connect to a server via ``ssh`` you are in your home directory. Home directory space is **very limited**. Do not store large files here; only configuration files, documents, and locally built programs. The compute servers share home directories.

Scratch Drives:
---------------
Each server has its own Scratch Drive or 'scratch space'. Scratch Drives are fast storage devices that you can use to store the data you want to run your jobs on. Scratch Drives are only intended to be used as short-term storage so please move your data off of scratch when you are done with your analysis. 

**Scratch drive locations:**

Compute Servers (Circe/Hecate): 
  1. ``/disk/scratch``

Hydra (compute cluster):
  1. ``/scratch`` 
  2. ``/scratch2``

.. note:: Scratch Space is not shared between the servers. e.g: scratch on Hecate is separate from scratch on Circe

Research Shares (I-Drive):
--------------------------
Research Shares are shared folders that you need to request access to. To request access to a share **OR** request a separate research share for you project please go to: http://intranet.pdx.edu/oit/i-drive-request

Research shares can be found in: ``/vol/share`` on all systems (excluding gravel)

Other Tutorials on Getting Started:
===================================
.. toctree::
    :maxdepth: 2
    :glob:


    tuning
    moving_files
    be_nice
    more_resources
