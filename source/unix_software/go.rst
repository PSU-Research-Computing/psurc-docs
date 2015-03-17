..  go.rst

******
Go
******

``Go`` is an open source programming language initially developed by Google. Go version 1.4.2 is currently installed on the compute servers, ``Crice`` and ``Hecate``.

Setting up Go on your system:
-----------------------------
Go will not work right off the bat, you need to export the ``GOROOT`` directory variable to where Go is loacted. The system install of go is currently located in ``/vol/apps/system/stow/go-1.4.2/``.

Add this line to either your ``~/.bash_profile`` or ``~/.bash_rc``:

.. code-block:: sh

    export GOROOT=/vol/apps/system/stow/go-1.4.2/

To check if the Go is working properly, run this command:

::
    
    $> go version

If GOROOT is set properly your terminal should output:

::

    go version go1.4.2 linux/amd64

Setting up your own Go install:
-------------------------------
step 1: Download Go source code from `golang.org/dl <https://golang.org/dl/>`_ and unpack.

step 2: export ``GOROOT`` path variable to where you unpacked the package. Put these lines into your either your ``~/.profile`` or your ``~/bash_rc``:

.. code-block:: sh

    export GOROOT=/path_to_go_install
    export PATH=$PATH:$GOROOT/bin

Additional Info and Links:
--------------------------
- `Go Hompage <https://golang.org/>`_
- `Go Source Code <https://golang.org/dl/>`_
- `Go Download Documentation <https://golang.org/doc/install#download/>`_


