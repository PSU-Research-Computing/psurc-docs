***************
Compute Servers
***************

Here at ARC we provide two general purpose compute servers, Circe and Hecate.

Usage Rules and Guidelines
==========================

1. Programs that require large amounts of memory (100's of GB or more) should be run on ``hecate``.

2. Before you run your jobs on a server run ``htop`` to check the server load. It will be pretty obvious if the server you are on is under a heavy load (lots of green, red, yellow and blue). If so, checkout the other server to see if it is more available.

3. Please limit the number of threads a multi-threaded job uses. Be mindful of the other user's jobs on the server you are using. If there is a heavy load on the server you are using, please ``nice`` your jobs so they do not clog up the system too much. If someone complains about your job consuming to many resources we will ``nice`` it for you.

4. If you want software installed, try building it locally before contacting us.


.. toctree::
    :maxdepth: 2
    :glob:

    *

