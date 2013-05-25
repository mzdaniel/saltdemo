==================
Salt Tutorial/Demo
==================

This repository is a step-by-step demonstration of the 
`Salt Stack <http://docs.saltstack.com/>`_ system. 

The master branch of this repo is *not* the "latest" version -- it is step
one. Check out each branch one at a time to see the progression of the 
tutorial.

This tutorial will allow you to easily understand arbirtrarily complex 
Salt configurations by starting with a minimum configuration.

You will need root access to your computer to follow along with this demo.
Salt must be run as root, and installation requires root access.

Every branch of this repo (except ``master``) contains a fully-functional
set of Salt configuration files. You should be able to execute them without
error to follow along. Each branch builds upon the previous branch.

Installing Salt
===============

Installing Salt is straightforward. This documentation explains installation
on a Ubuntu system, and was developed on a machine running Xubuntu 13.04.

See `Salt's installation documentation 
<http://docs.saltstack.com/topics/installation/index.html>`_ for instructions
for other platforms.

Install Prerequites
-------------------

::

    sudo apt-get install python-software-properties software-properties-common -y

Add the SaltStack PPA and update your package manager's listings::

    sudo add-apt-repository ppa:saltstack/salt
    sudo apt-get update

Install Salt Minion
-------------------

::

    sudo apt-get install salt-minion -y

This tutorial will use Salt Minion for simplicity. A normal master/minion 
setup is only trivially different than this method. Once you complete this
tutorial you will have no difficulty using Salt in its master/minion mode.

Configure Salt
--------------

The location of the configuration file is ``/etc/salt/minion``.

Only one setting needs to be added. This is the ``file_roots`` setting.
It looks like this::

    file_roots:
        base:
            - /srv/salt

The default location is accessible only to root. I recommend making this 
directory somewhere in your home folder, so it will be easier to work with
this git project and, later, your own Salt files.

After making this change you may have to restart the salt minion::

    sudo service salt-minion restart

Let's Go!
---------

If you've gotten to this step, then you're ready to check out the
next branch in this repo. Move on to step_02.
