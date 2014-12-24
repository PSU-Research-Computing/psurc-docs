Moving Data
===========

Getting data on on and off the servers can be done using ``SFTP`` or ``rsync``.


Rsync Between Servers
=====================

If you need to switch which server you are running on, the fastest safe way to move your files is with rsync which can synchronize folders reliably.

Moving a folder from hecate to circe
------------------------------------

Log into circe via ``ssh``::

    $ ssh user@circe.rc.pdx.edu

Then tell rsync which files you want to move::

    $ rsync -v -a -e ssh user@hecate.rc.pdx.edu:/disk/scratch/FOLDER.TO.MOVE /disk/scratch/

This will clone the folder from ``hecate`` onto ``circe``. NOTE: The files remain on the original server so please clean up those to preserve disk space.


Using SFTP and a GUI
====================

Sometimes its easiest to just use a GUI to move files onto the research servers. Here are some decent options.

Windows
-------

- `WinSCP <http://winscp.net/eng/index.php>`_

OS X
----

- `Cyber Duck <https://cyberduck.io/?l=en>`_
- `Transmit <http://panic.com/transmit/>`_ (Paid) - Local portland product!
