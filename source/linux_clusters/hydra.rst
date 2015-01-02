.. _hydra_cluster:


*************
Hydra Cluster
*************

Hydra is a research cluster available to PSU students and faculty.


Hydra Specifications
====================

+----------------------+------------------------+------------------------+----------------------+
|    Server Domain     |  ``hydra.rc.pdx.edu``  |  ``compute-0-[0-13]``  | ``compute-1-[0-17]`` |
+======================+========================+========================+======================+
| **Model**            | TODO: Hydra Head       | TODO: DPE R620         | Dell PowerEdge R900  |
+----------------------+------------------------+------------------------+----------------------+
| **RAM**              | 64GB                   | 66GB                   | 132GB                |
+----------------------+------------------------+------------------------+----------------------+
| **OS**               | Rocks 6.1.1            | Rocks 6.1.1            | Rocks 6.1.1          |
+----------------------+------------------------+------------------------+----------------------+
| **CPU**              | 2 x Intel Xeon E5-2650 | 2 x Intel Xeon E5-2650 | 4 x Intel Xeon E7330 |
+----------------------+------------------------+------------------------+----------------------+
| **Clock**            | 2.00GHz                | 2.00GHz                | 2.40GHz              |
+----------------------+------------------------+------------------------+----------------------+
| **Cores**            | 16 (2 x 8)             | 16 (2 x 8)             | 16 (4 x 4)           |
+----------------------+------------------------+------------------------+----------------------+
| **Special Hardware** | SSE4_2                 | SSE4_2                 |                      |
+----------------------+------------------------+------------------------+----------------------+
| **Hyper Threading**  | Enabled                | Enabled                | N/A                  |
+----------------------+------------------------+------------------------+----------------------+

.. figure:: /img/hydra.JPG
   :alt: The Hydra Cluster.

   A photo of the Hydra Cluster servers (highlighted in red).

Applications
============

Applications not managed by the slurm roll system are installed to::

  /share/apps


Storage
=======

Hydra has a large scratch space that can be used for computations::

  /disk/scratch/[user folder]

We have two JBODs attatched:

- Dell PowerVault MD1220
- Dell PowerVault MD1200
