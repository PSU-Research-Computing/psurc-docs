***********************************
Checking the current load of server
***********************************

Before you start a new job, it is important to check to see what resources are currently in use. Since these are shared resources, other jobs may currently be using large amounts of RAM or processing threads.::

   1. ssh to hecate and circe

   2. Run command: $ htop the Current load will be on the upper-right.

        Eg. `Load average: 8.04 8.10 8.13`

The first number is the 1 minute load, second is 5 minutes, and third is 15 minutes. A load of 8 means that, on average, 8 cores are 100% utilized. With 16 cores, 100% utilization is a load of 16. Anything above this means that processes are waiting for a core to be available. Ideally the load should be kept under 14.

If the load is high, it can cause runs to fail and, if left unchecked, can crash the server.

