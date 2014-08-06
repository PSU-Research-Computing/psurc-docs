.. role:: bash(code)
   :language: bash

*********************************************************
Moving Home Directory Mountpoint on the Cluster Head Node
*********************************************************

edit :bash:`/opt/rocks/lib/python2.6/site-packages/rocks/commands/sync/users/plugin_fixnewusers.py`

make it "fix" existing users, not just new ones: in Plugin#run()::

  s@default_dir = '/export/home/'@default_dir = '/home/'@

because we are now regenerating :bash:`/etc/auto.home` entries for existing users, make it first delete :bash:`/etc/auto.home` to avoid duplicate entries (autofs appears to use the first entry for a given path, so subsequently appended entries are useless) (add before the line "for user in new_users:")::

  os.remove("/etc/auto.home")
  
now, copy all of the homedirs to the new mountpoint, e.g. :bash:`/newhome`

next, set an attribute in the rocks db :bash:`Info_HomeDirLoc` that :bash:`plugin_fixnewusers.py` uses to generate entries in :bash:`/etc/auto.home`::

  rocks set attr Info_HomeDirLoc /newhome

now we need to make sure the head node is sharing the new mountpoint with compute nodes via NFS.  add a line like this to :bash:`/etc/exports`::

  /newhome 10.6.1.1(rw,async,no_root_squash) 10.6.0.0/255.255.0.0(rw,async)
  
remember to reload :bash:`/etc/exports`::

  exportfs -r

then regenerate :bash:`/etc/auto.home` everywhere::

  rocks sync users

now make sure that nobody has file handles open under :bash:`/home` on the head node.  many ways to skin this cat, one is some black magic finding via::

  lsof | grep home
  
and killing of processes, making sure to kill the children before you kill parents to avoid dreaded zombies

then restart the automounter::

  service autofs restart
  
then restart the automounter on all the compute nodes::

  rocks run host "service autofs restart"
  
then it should work, unless I forgot something, which is likely.  we should revise this document when we do this on hydra tomorrow.
