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

Run this command to activate  the version you want::

  perlbrew switch perl-5.22.0

.. note:: Make sure you use the the correct version that is listed as available above.

Run this command to switch back to system ``perl``::

  perlbrew switch-off

