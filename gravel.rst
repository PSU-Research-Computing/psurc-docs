Gravel Cluster Installation
===========================

This is a guide to reloading the Rocks 6.1.1 installation on the gravel cluster.

Before Reloading
````````````````

1. Create backup of current configuration, rsync the following to somewhere safe:
	* /state/partition1/home
	* /etc/auto.home
	* /etc/ssh/*key*
	* /root/ldap/*
	* /state/partition1/opt/maui/maui.cfg
	* /state/partition1/rocks/install/contrib/5.4/x86_64/RPMS
	* /state/partition1/rocks/install/contrib/5.4/x86_64/SRPMS
	* /etc/yum.conf
	* /etc/yum.repos.d/*
	* /etc/skel/examples

2. Create a Rocks Restore Roll for frontend, store ISO created somewhere safe::
	
	$ cd /export/site-roll/rocks/src/roll/restore
	$ make roll

3. Make note of network configurations. Current configurations (as of 7/11/14)::

	DNS Name: server.tld
	hostname: server.tld
	IP address (public): x.x.x.x (eth1)
	Netmask (public): x.x.x.x (eth1)
	IP address (private): x.x.x.x (eth0)
	Netmask (private): x.x.x.x (eth0)
	nameserver: x.x.x.x
	gateway (eth1): x.x.x.x
	gateway (eth2): x.x.x.x
	public network interface: eth1
	private network interface: eth0


Install Head Node
`````````````````

1. Load ROCKS 6.1.1 Jumbo DVD into external DVD drive connected to headnode.

2. Boot headnode to DVD drive.

3. When it boots to the splash screen, type `build` and hit enter. If you wait too long it will continue to default (compute node) isntallation and you will have to reboot.

4. In installer:
	- Use collected network information above.
	- Auto-partition harddrive

5. Allow installer to restart.

Configure Head Node
```````````````````

Configure ldap
**************

See link

Web Access Setup
****************

For security reasons wordpress and tripwire have to be disabled, this is
accomplished by editting `/etc/httpd/conf/httpd.conf` and adding the lines::

  <Directory "/var/www/html/wordpress">
  deny from all
  </Directory>

  <Directory "/var/www/html/tripwire">
  deny from all
  </Directory>

under the lines::

  #
  # Controls who can get stuff from this server.
  #
   Order allow,deny
      Allow from all

   </Directory>

Then run::
  $ service httpd restart

To enable ganglia as the frontpage, modify `/var/www/html/index.html` and change
`URL=/wordpress/` to `URL=/ganglia/`.

Now set the firewall rules to make ganglia face the external network::

  $ rocks remove firewall host=localhost rulename=A40-WWW-PUBLIC-LAN

  $ rocks add firewall host=localhost network=public protocol=tcp service=www chain=INPUT \ action=ACCEPT flags="-m state --state NEW --source 0.0.0.0/0.0.0.0" \ rulename=A40-WWW-PUBLIC-NEW

  $ rocks sync host firewall localhost

Ganglia should now be accessible by gravel.rc.pdx.edu in a browser.

Install Slurm
*************

	On the headnode::

		$ wget http://sourceforge.net/projects/slurm-roll/files/release-6.1.1-14.03.4-2/slurm-6.1.1-60.x86_64.disk1.iso
		$ rocks add roll slurm*.iso
		$ rocks enable roll slurm
		$ cd /export/rocks/install
		$ rocks create distro
		$ yum clean all 
		$ yum update
		$ rocks run roll slurm|sh 
		$ reboot



Install Compute Nodes
`````````````````````

Make sure all compute nodes are powered off.

For the first rack, on the headnode type `$ insert-ethers` and hit enter. Select "Compute" and hit enter.

Turn on the first compute node and press F12 to enter PXE and wait for it to register on the headnode.

Power on the second compute node. Repeat for rack.

For second rack, on headnode exit out of insert-ethers and run `$ insert-ethers --cabinet=1` and repeat.

Do the same for third rack but --cabinet=2



Reboot Nodes Over SSH in PXE
````````````````````````````
$ ssh compute-0-3 '/boot/kickstart/cluster-kickstart-pxe'
