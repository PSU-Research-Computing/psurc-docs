.. _dotfiles:
*************
Unix Dotfiles
*************

Dotfiles (files that live in your home directory that start with a ``.``) are hidden preference files that allow you to change your shell environment and settings for different unix programs.  You can see these files by passing the ``-a`` flag to the ``ls`` command.

When you want to make changes to your environment that take effect every time you log in just add them to your ``.bash_profile``.  Careful though!  If you screw this file's syntax up you may break your ``$PATH`` making it difficult to edit the file to fix the problem.
