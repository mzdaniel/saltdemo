python-virtualenv:
    pkg:
        - installed

#replace with your username
#this is jinja2 syntax
# http://jinja.pocoo.org/docs/
{% set user = 'shawn' %}

/tmp/pyenv:
    virtualenv.managed:
        - runas: {{ user }}
        - requirements: salt://pydev/requirements.txt

my_repo:
    git.latest:
        - name: git://github.com/ShawnMilo/milo.git
        - target: /tmp/projects/milo
        - rev: master
        - runas: {{ user }}

