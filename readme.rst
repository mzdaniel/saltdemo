=========================
Salt Tutorial/Demo Step 2
=========================

Create the ``top`` file
=======================

The first file we need is called ``top.sls``. This file resides in the root
of the ``base`` directory you specified in your ``/etc/salt/minion`` file.

Here is a simple version:

.. code:: yaml

    base:
        '*':
            - foo

In this case ``'*'`` represents the hostname of the target machine. Using
the wildcard will match all machines. You can replace the asterisk with your
machine's hostname, or a wildcard that partially matches your hostname.

In the future you can use other methods for 
`targeting <http://docs.saltstack.com/topics/targeting/index.html>`_ machines,
including based on their operating system and other parameters. For now, we'll
keep it simple.

Create a group directory
========================

Next, let's create a directory named ``foo`` to match the group name we
specified ``top.sls``::

    mkdir foo
    
Next, edit ``init.sls`` in the ``foo`` directory and add the following:

.. code:: yaml

    vim:
        pkg:
            - installed

Done!
=====

You now have a working Salt repository. You can test it now::

    sudo salt-call --local state.highstate

If it's not already installed, this will install ``vim`` on your system.



