=========================
Salt Tutorial/Demo Step 4
=========================

Let's do some Python!
=====================

Setting up a Python environment can be annoying enough that you'll put off
updating your operating system or buying a new computer. With Salt, it
doesn't have to be.

In this part of the tutorial we'll also experiment with multiple roles. Until
now, we've been putting everything in our ``foo`` role. It's much more 
convenient to create multiple roles and then mix-and-match those roles 
on a machine by machine basis.

Update top.sls
--------------

.. code:: yaml

    base:
        '*':
            - foo
            - pydev

Create the new directory::

    mkdir pydev
    touch pydev/init.sls

