**********************
Monitoring Server Load
**********************

Before you start a new job, it is important to check to see what resources are currently in use.  If you are using a general compute server, you can use :ref:`htop`.  If you are using a cluster, you can use ``squeue`` (part of :ref:`slurm`) and :ref:`Ganglia`

Compute Servers (Circe/Hecate)
==============================

Since these are shared resources, other jobs may currently be using large amounts of RAM or processing threads.::

   1. ``ssh`` to hecate and circe
   2. Run command: ``$ htop``
   3. the Current load will be on the upper-right.

        Eg. `Load average: 8.04 8.10 8.13`

The first number is the 1 minute load, second is 5 minutes, and third is 15 minutes. A load of 8 means that, on average, 8 cores are 100% utilized. With 16 cores, 100% utilization is a load of 16. Anything above this means that processes are waiting for a core to be available. Ideally the load should be kept under 14.

If the load is high, it can cause runs to fail and, if left unchecked, can crash the server.

Compute Clusters
================

Visiting on

