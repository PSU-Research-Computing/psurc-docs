Transferring files between Hecate and Circe
===========================================

If you need to switch which server you are running on, the fastest safe way to move your files is with rsync which can synchronize folders reliably.

   Example, moving a folder from hecate to circe:

       1. Log into circe via ssh.
       2. Run $ rsync -v -a -e ssh user@hecate.rc.pdx.edu:/disk/scratch/FOLDER.TO.MOVE /disk/scratch/

This will clone the folder from hecate onto circe. NOTE: The files remain on the original server so please clean up those to preserve disk space.
