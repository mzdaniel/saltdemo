=========================
Salt Tutorial/Demo Step 5
=========================

Other Goodies
=============

You now know enough to embark on your own Salt adventure. Here are just 
a few tidbits that you'll want to know.

Salt States
-----------

Here is `a list <http://docs.saltstack.com/py-modindex.html>`_ of Salt states.
This list includes everything Salt knows how to handle natively, as you've
seen with git and virtualenv, for example.

Notice: The documentation linked to above contains multiple sections, including
modules, states, returners, and others. For the purposes of an ``sls`` file
you want *states*, **not modules**. This is important, because they are 
completely different and not interchangeable. For example, the directives
in the `git state <http://docs.saltstack.com/ref/states/all/salt.states.git.html#module-salt.states.git>`_
are *not* the same as in the `git module <http://docs.saltstack.com/ref/modules/all/salt.modules.git.html#module-salt.modules.git>`_,
and accidentially confusing the two will result in errors.

The modules can be used at the command line manually to call arbitrary 
actions on a minion computer. This is fairly simple but outside the scope
of this tutorial.

include
-------

In addition to simply adding multiple state files to your ``top.sls`` (as we
did with ``foo`` and ``pydev``), it's also possible to use inheritance.

Instead of adding ``pydev`` to our ``top.sls`` file, we could have just 
added this to ``foo/init.sls``:

.. code:: yaml

    include: 
        - pydev

This would have achieved the same result. This allows the flexbility of 
separating concerns as you see fit. For example, you may create a database
state file which you include in multiple other state files. On the other hand,
may have personal config files which you want to manually add to ``top.sls``
for certain machines only.

extend
------

Once you've included another state file, you can also customize it. For 
example, if your state file includes a different nginx config file you
want it to "watch" for than your default:

.. code:: yaml

    extend:
        nginx:
            service:
                - running
                - watch:
                    - file: /some/other/file

file.append
-----------

When it's undesirable or dangerous to overwrite a file on the minion 
completely, it's easy to simply append to it. In this example, I want to 
add a couple of lines to my ``.bashrc``:

.. code:: yaml

    /home/shawn/.bashrc:
        file.append:
            - text
                - alias ls='ls -rtlh --color=auto'
                - export EDITOR=vim

Salt will first check the file and will not duplicate the lines if they 
already exist.

Note that the strings to add here are not surrounded with quotation marks.
They are optional except when they contain characters which will confuse
Salt.

cron
----

Setting up a cron job is also easy:

.. code:: yaml

    my_cron_job:
        cron.present:
            - name: /path/to/script
            - user: shawn
            - minute: '*/5'

All of the cron arguments (weekday, etc.) are optional, so you can leave
them blank if they're going to be an asterisk. The ``user`` tells it whose
crontab to add it to.

As with ``file.append``, it's smart enough to not duplicate a cron job.

We did have to surround ``*/5`` with quotation marks, otherwise the asterisk
would have caused an error when Salt parsed the file.

Have fun!
---------

Enjoy Salt, in all its glory.


