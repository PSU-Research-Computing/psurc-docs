*****************************
Getting Started With Clusters
*****************************

Importance Of Scheduling Jobs:
==============================
A computer cluster is a **group of connected computers** that allow you to distrube parralel/multiprossing jobs accross multiple computers. The computer that manages all of the other computers (``nodes``) is called the ``head node``. The ``head node`` uses software, called a ``scheduler``, to manage and distrube jobs throughout the ``nodes``. 


**All jobs must be run through the scheduler!!!!** If your jobs are not run through the scheduler, they will run on the ``head node`` and **potentailly overload and crash the entire system.** **If we find ANY large jobs on the head node they will be killed imideatly**

Our systems use the ``scheduler`` ``slurm``. Documentation on how to use slurm is provided below:
.. toctree::
    :maxdepth: 2
    :glob:
    :any:
    slurm
    gettings_started


