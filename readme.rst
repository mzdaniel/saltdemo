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
convenient to create multiple roles and then mix & match those roles 
on a machine-by-machine basis.

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

pydev/init.sls
--------------

Like all good Python developers, we want to use the excellent
`virtualenv <https://pypi.python.org/pypi/virtualenv>`_. So let's make
sure that's installed first.

.. code:: yaml

    python-virtualenv:
        pkg:
            - installed

Next, let's add a bit of `jinja2 <http://jinja.pocoo.org/docs/>`_ syntax. This
is natively supported by Salt:

.. code:: yaml

    #replace with your username
    #this is jinja2 syntax
    # http://jinja.pocoo.org/docs/
    {% set user = 'shawn' %}

You should change this to your username.

Next, let's create a virtualenv and also pip install some packages:

.. code:: yaml

    /tmp/pyenv:
        virtualenv.managed:
            - runas: {{ user }}
            - requirements: salt://pydev/requirements.txt

Last but not least, we'll check out a git repo to work on. Salt uses
the keyword ``rev`` to denote the branch.

.. code:: yaml

    my_repo:
        git.latest:
            - name: git://github.com/ShawnMilo/milo.git
            - target: /tmp/projects/milo
            - rev: master
            - runas: {{ user }}

