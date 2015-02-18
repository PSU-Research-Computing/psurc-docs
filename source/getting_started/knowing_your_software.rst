*********************
Knowing your software
*********************

The best thing you can do to learn how to use new and complicated Unix software packages is get it running on your local machine.  Once you have that experience, getting it running in a shared computing environment will make a lot more sense.

All of ARC's Servers run CentOS Linux, a flavor of Unix.

Some software specific support can be provided by ARC students and employees if time is available.

Since all software is different the best we can offer on this are tool suggestions to help with local testing.

Here is a good strategy to learn unfamiliar software:

1. Install it locally on your desktop or in a virtual machine

2. Install it to you home directy, or use the the system wide install of the program on the computation servers and see if it works the way you would exepct.

3. Install your program to your home directory on cluster and try launching it through the scheduler on a compute node.

Setting up a testing environment locally
========================================

There isn't one way to set up a local test environment, but here are a few tools to help get you started.

Testing on Linux
----------------

If you run Linux locally, usually you can simply install the dev tools and start building and testing software from source.

Testing on OS X
---------------

OS X has the benefit of running a flavor of Unix and offers a package manager that has a large catalog of research software.  Install `Xcode`_ using the App Store and set up `homebrew`_ and the `homebrew-science`_ tap.

Testing on Windows
------------------

Windows is not a Unix operating system and therefor will preset a challenge to setting up Unix software locally.  You are better off using a Virtual Machine and testing with that.  You can try to use something like `Cygwin`_ if you wish.

Testing Using a VM
------------------

This option is available to all operating systems.  Using a tool like `vagrant`_ along side `virtualbox`_, you can quickly install a Centos 6.5 image to test in:

- `CentOS 6.5 Vagrant Manifest <https://atlas.hashicorp.com/chef/boxes/centos-6.5>`_

Installing to your home directory
=================================

Once your software is installed and working locally, the next step is to install it to your home directory on the computational servers (if its not already installed system wide).  You can use :ref:`stow` to manage these manual builds in your home directory.

.. _Xcode: https://itunes.apple.com/us/app/xcode/id497799835?mt=12
.. _homebrew: http://brew.sh/
.. _homebrew-science: https://github.com/Homebrew/homebrew-science
.. _Cygwin: https://www.cygwin.com/
.. _vagrant: https://www.vagrantup.com/
.. _virtualbox: https://www.virtualbox.org/
