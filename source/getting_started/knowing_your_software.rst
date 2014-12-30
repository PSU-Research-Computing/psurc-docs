*********************
Knowing your software
*********************

Software is a tool.  The first step to using a tool effectively is understanding how it works.

Any software you can run on the research servers can be run locally on the computer in front of you.

Getting Started with Unfamiliar Software
=========================================

The best thing you can do to learn how to use new and complicated Unix software packages is get it running on your local machine.  Once you have that experience, getting it running in a shared computing environment will make a lot more sense.

All of ARC's Servers run CentOS Linux, a flavor of Unix.  If you can get your software working locally, we can likely get it running on the servers.

Some software specific support can be provided by ARC students and employees if time is available.

Since all software is different the best we can offer on this are tool suggestions to help with local testing.

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
