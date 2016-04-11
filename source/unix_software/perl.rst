.. perl.rst

****
Perl
****

To use an updated ``perl`` version we need to use ``perlbrew`` and point it at the ``perlbrew`` install that works system wide.

Make sure you are running bash as your default shell the add the following two lines to the end of your ``.bashrc`` file::

  export PERLBREW_ROOT=/vol/apps/system/perl5/
  source $PERLBREW_ROOT/etc/bashrc

Run this command to see which versions of perl are available::

  perlbrew list

Run this command to activate the version you want::

  perlbrew switch perl-5.22.0

.. note:: Make sure you use the the correct version that is listed as available above.


Run this command to switch back to system ``perl``::

  perlbrew switch-off

Installing Local Perl Modules:
------------------------------
You can use ``perlbrew`` to install modules to your own system locally.

To install local modules first create a local library with ``perlbrew``: ::

  $> perlbrew lib create perl-5.22.0@mylocallibrary

This command creates a local library for ``perl`` 5.22.0 called "mylocallibrary"

You can use the ``use`` parameter to use that library only for the current shell: ::
    
  $> perlbrew use perl-5.22.0@mylocallibrary

or the ``switch`` parameter to switch that library to the defualt: ::
    
  $> perlbrew switch perl-5.22.0@mylocallibrary

Now once you have switched to or are using a local library you can go ahead and install ``perl`` modules locally with ``cpanm``: ::

  $> cpanm Moo

To check if your installation worked check it with: ::

  $> perldoc perllocal

To delete a library: ::
  
  $> perlbrew lib delete perl-5.22.0@mylocallibrary

