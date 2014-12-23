
****************
Picking A Server
****************

The first step towards efficently utilizing the ARC resources is to get to know the software you wish to run. Please carefully read the documentation provided by the software you wish to run. By knowing your requirements, a proper server can be chosen.

Once you have an idea about your software requirements, compare those against the servers below to get an idea of where you should run your jobs.


Hecate
======

Hecate is the appropriate choice for a job which:

- Requires large (over 50 GB) of RAM.
- Cannot be parallellized on the cluster.

Circe
=====

Circe is the appropriate choice for a job which:

- Requires less than 160 GB of RAM.
- Can utilize GPGPU(CUDA) parallellization.

Hydra Cluster
=============

Hydra is the appropriate choice for a job which:

- Can be massively parallellized on a cluster.
- Can utilize mpi or mpich libraries (look for these in software documentation).
