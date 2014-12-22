***
ssh
***

SSH Tutorials
=============

..  TODO: Write SSH tutorials.


Set up SSH keys and config files
================================
You can enable secure, password-free authentication to the ARC servers using SSH keys.  SSH keys are a public/private key system that is more secure than traditional passwords, and offers a more convenient login mechanism than typing in your password every time you connect.

SSH Keys work by generating two cryptographic key files.  One of the files is private (keep it a secret!) and the other is public (it doesn't matter if someone gets a copy of it, but don't unnecessarily distribute it).

Generating Keypair
------------------
On your computer create a ssh RSA keypair by typing::

  $ ssh-keygen -t rsa

This creates a pair of keys (public ``id_rsa.pub`` and private ``id_rsa``).

Should I set a Passphrase for my Private Key?
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

**Yes!**

Because it is really bad if someone gets a copy of your private key (``id_rsa``) you **should** set a passphrase for your private key.  This passphrase is used to encrypt the private key so that it cannot simply be used if a copy is made by a bad actor.  It also means that a password must be used every time your private key is needed. In order to avoid this anoyance, most modern operating systems will provide a keychain system that can keep track of and auto submit this private key passphrase.  On OS X, the ``Keychain.app`` will be your passphrase manager and will prompt you save the passphrase.  Most Linux distributions will automatically offer to save the password using it's flavor of passphrase manager.  You should accept the offer and let your system remember this.

On windows, you can use a program such as pageant_ or keepass_ with the KeeAgent_ plugin.

.. _pageant: http://www.chiark.greenend.org.uk/~sgtatham/putty/download.html
.. _keepass: http://keepass.info/download.html
.. _KeeAgent: http://keepass.info/plugins.html#keeagent

Set folder permissions on server
--------------------------------
Because of some existing configuration errors, home folders are created with incorrect permissions.  In order for ssh keys to work, you must set these correct permissions on the appropriate folders and files.

Open a ssh connection to the server and run the following::

  $ touch ~/.ssh/authorized_keys
  $ chmod 711 ~ && chmod 711 ~/.ssh && chmod 600 ~/.ssh/authorized_keys

Upload public key to server
---------------------------

On your computer run the following::

  $ cat ~/.ssh/id_rsa.pub | ssh [user]@[server]:~/.ssh/authorized_keys

(change user and server as appropriate)

The password-free login should now work. Connect by ``$ ssh [user]@[server]``

.. note:: You can create a single public/private key per device you connect from, or create a single key pair that is used on all your devices.  Each method has it's pros and cons relating to key invalidation.  If you generate a key per device, you can simple append additional public keys on new lines in the ``~/.ssh/authorized_keys`` file.

Create aliases for servers
--------------------------

Creating an ssh config file will let you create shortcut names to servers you frequently ssh into.

Create a file in ``~/.ssh/`` called 'config' and add servers with the following format::

  host [hostname]
    hostname [server]
    user [username]

Example::

  host example
    hostname example.com
    user odinusername

Now you can connect to the server running::

  ssh example

Which will connect to ``odinusername@example.com``
