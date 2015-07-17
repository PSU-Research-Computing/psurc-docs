.. boost.rst

************
Boost 1.58.0
************

The ``Boost Library`` is a large set of libraries for C++.

Using Boost 1.58.0 on your system:
----------------------------------
To compile code that uses boost libraries use the -I flag to set the path to boost.
The path to boost 1.58.0 is:
::
    /vol/apps/system/boost-1.58.0

Example:
::

    $> g++ -I /vol/apps/system/boost-1.58.0 example.cpp -o executable_example

.. note::  When you are building software that uses boost 1.5 with make or other install scripts: Check for a configure flag that sets the path to the boost library. If there is one, set it to the path specified above.
