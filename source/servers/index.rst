*******
Servers
*******

The following pages contain information about ARC managed servers.

Programs that require large amounts of memory (100's of GB) should be run on ``hecate`` while everything else should be run on ``circe``.  The servers have hyper-threading enabled, so it appears like there are more CPU cores than there actually are.  Remember, more threads usually does not result in faster performance.  Each program should be benchmarked to find the optimal thread count in order to maximize performance.  This number is usually between 4 and 8 threads but you wont know unless you test or are referencing suggested thread counts for the program you are running.

Compute Servers
===============

.. toctree::
    :maxdepth: 2

    compute/hecate
    compute/circe


Linux Clusters
==============

.. toctree::
    :maxdepth: 2

    clusters/hydra
    clusters/gravel

Login Servers
=============

.. toctree::
    :maxdepth: 2

    login/hera

