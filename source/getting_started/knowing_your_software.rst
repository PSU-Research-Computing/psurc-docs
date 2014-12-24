*********************
Knowing your software
*********************

Software is a tool.  The first step to using a tool effectively is understanding how it works.

Any software you can run on the research servers can be run locally on the computer in front of you.

Getting Started with Unfamiliar Software
=========================================

The best thing you can do to learn how to use new and complicated Unix software packages is get it running on your local machine.  Once you understand this, getting it running in a shared computing environment will make a lot more sense.

All of ARC's Servers run Linux, a flavor of Unix.  If you can get your software working locally, we can likely get it running on the servers.

Some software specific support can be provided by ARC students and employees if time is available.

Setting up a testing environment locally
========================================

There isn't one way to set up a local test environment, but here are a few tools to help get you started.

Testing on Linux
----------------

If you run Linux locally, usually you can simply install the dev tools and start building and testing software from source.

Testing on OS X
---------------

OS X has the benefit of running a flavor of Unix and offers a package manager that has a large catalog of research software.  Install `Xcode`_ using the App Store and set up `homebrew`_ and the `home-brew science`_ tap.

Testing on Windows
------------------

Windows is not a Unix operating system and therefor will preset a challenge to setting up Unix software locally.  You are better off using a Virtual Machine and testing with that.  You can try to use something like `Cygwin`_ if you wish.

Testing Using a VM
------------------

This option is available to all operating systems.  Using a tool like `vagrant`_ along side `virtualbox`_, you can quickly install a Centos 6.5 image to test in:

- `CentOS 6.5 Vagrant Manifest <https://atlas.hashicorp.com/chef/boxes/centos-6.5>`_

Installing your software locally
================================

This step depends on the software you are using.  If you are building software from source, consider using a tool such as :ref:`stow` to manage these manual builds.

Requesting software
===================

Once you have tested your software and you think your package should be installed system wide you can email consultants@pdx with all relevant details to the installation of your software.  That includes

- Program Name
- Program Version
- Program website
- Link to download
- Dependencies
- Compilation Options
- Anything else needed to get the package up and running

.. _`Xcode`: https://developer.apple.com/xcode/
.. _`homebrew`: http://brew.sh/
.. _`home-brew science`: https://github.com/Homebrew/homebrew-science
.. _`Cygwin`: https://www.cygwin.com/
.. _`vagrant`: https://www.vagrantup.com/
.. _`virtualbox`: https://www.virtualbox.org/
