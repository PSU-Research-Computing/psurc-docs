.. boost.rst

************
Boost 1.58.0
************

The ``Boost Library`` is a large set of libraries for C++.

Using Boost 1.58.0 on your system:
----------------------------------
To compile code that uses boost libraries use the -I flag to set the path to boost.
The path to boost 1.58.0 is:

.. code-block::

    /vol/apps/system/boost-1.58.0

Example:
.. code-block::

    $> g++ -I /vol/apps/system/boost-1.58.0 example.cpp -o executable_example

.. note::  If you are building software with make or similar install scripts that requires boost 1.5, check for a configure flag that sets the path to the boost library and set it to the path specified above.
