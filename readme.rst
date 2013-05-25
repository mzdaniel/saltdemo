=========================
Salt Tutorial/Demo Step 3
=========================

Installing and Running a Service
================================

Install nginx
-------------

Next, let's install and run a service. We'll use the ``nginx`` Web server.

In its most basic form, the task would look like this:

.. code:: yaml

    nginx:
        pkg:
            - installed 

Of course, we also want it to be running, so:

.. code:: yaml

    nginx:
        pkg:
            - installed 
        service:
            - running

Some Content
------------


Next, let's make it do something useful. Let's create an HTML
file to serve. This file is in our repo, so we just have to tell Salt
that by giving its ``source`` as a location with ``salt://`` as a prefix. 

.. code:: yaml

    /tmp/saltdemo/index.html:
        file.managed:
            - source: salt://foo/index.html

This is a simple yet incomplete version. Let's add some more:


.. code:: yaml

    /tmp/saltdemo/index.html:
        file.managed:
            - source: salt://foo/index.html
            - user: root
            - group: root
            - mode: 644
            - makedirs: True

nginx config
------------

We have a config file for our nginx server in our repo. Let's put it
in Salt's default config directory,
``/etc/nginx/sites-available/``. This should look pretty familiar by now.

.. code:: yaml

    #a basic nginx config file
    /etc/nginx/sites-available/saltdemo.conf:
        file.managed:
            - source: salt://foo/saltdemo.conf
            - user: root
            - group: root
            - mode: 644
            - require:
                - pkg: nginx

enable the site
---------------

Nginx decides which sites are active by looking in the ``sites-enabled``
configuration directory. Common practice is to add a symlink to the
config file in ``sites-available``. Salt uses ``target`` to refer to
the symlink's source.

.. code:: yaml

    /etc/nginx/sites-enabled/saltdemo.conf:
        file.symlink:
            - user: root
            - group: root
            - mode: 644
            - target: /etc/nginx/sites-available/saltdemo.conf

keeping nginx current
---------------------

At this point you may discover that the HTML is unavailable. This is because
nginx needs to be restarted when its configuration changes. To handle this,
salt provides the ``watch`` directive.

.. code:: yaml

    nginx:
        pkg:
            - installed 
        service:
            - running
            - watch:
                - file: /etc/nginx/sites-enabled/saltdemo.conf

Now nginx will be restarted by Salt whenever that file is updated by Salt.
Any time you update your Salt state files, you can run them on existing or
new minions to bring them all up to the latest version.

Success!
--------

Run salt-call again::
    
    sudo salt-call --local state.highstate

You should now see the HTML page served at
`http://localhost:9999/ <http://localhost:9999/>`_.


`previous <https://github.com/ShawnMilo/saltdemo_02>`_

`next <https://github.com/ShawnMilo/saltdemo/tree/step_04>`_
