=========================
Salt Tutorial/Demo Step 2
=========================

The first file we need is called ``top.sls``. This file resides in the root
of the ``base`` directory you specified in your ``/etc/salt/minion`` file.

Here is a simple version:

.. code:: yaml
    .. include:: top.sls

In this case ``'*'`` represents the hostname of the target machine. Using
the wildcard will match all machines. You can replace the asterisk with your
machine's hostname, or a wildcard that partially matches your hostname.

In the future you can use other methods for 
`targeting <http://docs.saltstack.com/topics/targeting/index.html>`_ machines,
including based on their operating system and other parameters. For now, we'll
keep it simple.
