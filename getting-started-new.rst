***************
Getting Started
***************

Welcome to the Portland State University Academic Research Computing Systems. The ARC provides shared computing resources for academic research purposes. This document will get you started working on the high performance compute servers and the Hydra high-performance computing cluster. 


Know Your Requirements
======================

The first step towards efficently utilizing the ARC resources is to get to know the software you wish to run. Please carefully read the software documentation. By knowing your requirements, a proper server can be chosen.

Hecate
------

Hecate is the appropriate choice for a job which:

- Requires large (over 160 GB) of RAM.
- Cannot be parallellized on the cluster.

Circe
-----

Circe is the appropriate choice for a job which:

- Requires less than 160 GB of RAM.
- Can utilize GPGPU(CUDA) parallellization.

Hydra Cluster
-------------

Hydra is the appropriate choice for a job which:

- Can be massively parallellized on a cluster.
- Can utilize mpi or mpich libraries (look for these in software documentation).
  
Using SSH
=========

The research systems are accessed primarily through use of a command-line interface utilizing a secure shell (SSH). For information on how to use this go here:

 - `Using SSH <http://www.pdx.edu/oit/secure-shell-ssh>`_

To connect to the research servers, first connect to `research.pdx.edu`.
From here you can connect to the compute servers::

  $ ssh user@circe.rc.pdx.edu
  $ ssh user@hecate.rc.pdx.edu
  $ ssh user@hydra.rc.pdx.edu

Checking the current load of server
===================================

Before you start a new job, it is important to check to see what resources are currently in use. Since these are shared resources, other jobs may currently be using large amounts of RAM or processing threads.::
    
   1. ssh to hecate and circe
        
   2. Run command: $ htop the Current load will be on the upper-right.
            
        Eg. `Load average: 8.04 8.10 8.13`
            
The first number is the 1 minute load, second is 5 minutes, and third is 15 minutes. A load of 8 means that, on average, 8 cores are 100% utilized. With 16 cores, 100% utilization is a load of 16. Anything above this means that processes are waiting for a core to be available. Ideally the load should be kept under 14.
            
If the load is high, it can cause runs to fail and, if left unchecked, can crash the server.
            
Choosing number of threads to use for a program
===============================================
    
The optimal number of threads to use is entirely dependent on the program being run and may take a bit of trial and error. More threads does not usually result in faster runs and can actually be detrimental.

Please limit the number of threads to half of the currently available on the compute server.
        
Transferring files between Hecate and Circe
===========================================
    
If you need to switch which server you are running on, the fastest safe way to move your files is with rsync which can synchronize folders reliably.
        
   Example, moving a folder from hecate to circe:
            
       1. Log into circe via ssh.
       2. Run $ rsync -v -a -e ssh user@hecate.rc.pdx.edu:/disk/scratch/FOLDER.TO.MOVE /disk/scratch/
        
This will clone the folder from hecate onto circe. NOTE: The files remain on the original server so please clean up those to preserve disk space.

Nice your processes
===================
It is important to nice intensive processes so that they don’t interfere with using the most basic functions of the research server such as changing directories or moving files.

The nice and renice commands adjust the priority of a process. ARC recommends that all users nice all of their processes with a value of at least 5. To nice a process when it is started type:

$ nice +5 [other_commands]


where [other_commands] is the command you actually wan to run. If you have already started a job and want to nice it after the fact, you can use the renice command to do this. First identify the process ID that you wish to nice:

$ ps -u


Then run renice on it:

$ renice +5 [PID]


where [PID] is the process ID.

 