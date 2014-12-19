.. role:: bash(code)
   :language: bash

ROCKS yum Repository Architecture and Administration Procedures
===============================================================

Architecture
************

ROCKS fixes a set of CentOS packages with each release that live in a local yum repository on the head node.
Presumably the goal here is improve the stability by fixing the versions of packages in a given ROCKS release.

The head node and compute nodes are configured to download packages from this repository, 
as seen in :bash:`/etc/yum.repos.d/rocks-local.repo`::
  [Rocks-6.1.1]
  name=Rocks 6.1.1
  baseurl=http://131.252.42.27/install/rocks-dist/x86_64
  enabled = 1
No other entry in :bash:`yum.repos.d` should have `enabled = 1`, because that would allow nodes to
pull packages from e.g. the public CentOS repositories, which would probably be fine but would certainly
de-ROCKS-ify the distro.  `131.252.42.27` is the IP for hydra, and a GET on paths under /install/rocks-dist/x86_64
grabs paths under :bash:`/export/rocks/install/rocks-dist/x86_64/`, which contains a yum repository that is updated every
time you run :bash:`rocks create distro` from :bash:`/export/rocks/install` (procedure described below).

But wait... how is that path served from the head node (hydra) via HTTP?  
Well, apache is running on the head node, and configured as follows in `/etc/httpd/conf.d/central.conf`::
  <Directory /var/www/html/install>
          Options FollowSymLinks Indexes ExecCGI
          AllowOverride None
          Allow from all
  </Directory>
But how do we get from /var/www/html/install to /export/rocks/install?  
Note the FollowSymLinks option above, and check this out::
  [root@hydra html]# cd /var/www/html/
  [root@hydra html]# ls -l install
  lrwxrwxrwx 1 root root 21 Jul 23 16:22 install -> /export/rocks/install

Finally, where do the packages in this repository come from?  
As described below, when you run :bash:`rocks create distro`, 
RPMs in :bash:`/export/rocks/install/contrib/6.1.1/x86_64/RPMS`
are copied to :bash:`/export/rocks/install/rocks-dist/x86_64/RedHat/RPMS`,
and added to the xml metadata in `/state/partition1/rocks/install/rocks-dist/x86_64/repodata`,
presumably through a call to :bash:`createrepo` or one of its ilk.

:bash:`extend-compute.xml` (described below) has a different purpose: It specifies the set of RPMs
that should be appended to the list that anaconda installs on new compute nodes.  You can have a package
in the repository that isn't automatically installed on new compute nodes.

Procedures
**********

Add an RPM to the local repository on the head node
```````````````````````````````````````````````````

Adapted from https://wiki.rocksclusters.org/wiki/index.php/FAQ#Q:_How_can_I_install_new.2Fupdated_RPM_packages_in_all_nodes.3F::

  ssh hydra

You need rootly powers::

  su

or::

  sudo -s

Get the RPM somewhere like a home directory, and see whether its
dependencies are available and it can successfully install, e.g.::

  yum localinstall gsl-1.13-1.el6.x86_64.rpm
  yum localinstall gsl-devel-1.13-1.el6.x86_64.rpm

Put the rpm here, so it can be added to the ROCKS yum repo::

  cp gsl-1.13-1.el6.x86_64.rpm gsl-devel-1.13-1.el6.x86_64.rpm /state/partition1/rocks/install/contrib/6.1/x86_64/RPMS

Rebuild the distribution to copy the new package to the local repository and update the repository metadata::

  cd /export/rocks/install
  rocks create distro

Add an RPM to the set of packages installed on new nodes
````````````````````````````````````````````````````````

Extend the compute roll with entries for the new package(s)::

  vim /export/rocks/install/site-profiles/6.1/nodes/extend-compute.xml

Add one "package line" (there is a real XML name for this) for each new package::

  <package>gsl</package>
  <package>gsl-devel</package>

Rebuild the distribution to add the new package list to the .iso::

  cd /export/rocks/install
  rocks create distro

Add an RPM in the local repository to existing compute nodes
````````````````````````````````````````````````````````````
  :bash:`rocks run host "yum install gsl gsl-devel”`
