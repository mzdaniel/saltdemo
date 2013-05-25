vim:
    pkg:
        - installed

#a simple HTML file
/tmp/saltdemo/index.html:
    file.managed:
        - source: salt://foo/index.html
        - user: root
        - group: root
        - mode: 644
        - makedirs: True
        - require: 
            - file: /etc/nginx/sites-available/saltdemo.conf

#a basic nginx config file
/etc/nginx/sites-available/saltdemo.conf:
    file.managed:
        - source: salt://foo/saltdemo.conf
        - user: root
        - group: root
        - mode: 644
        - require:
            - pkg: nginx

#a basic nginx config file
/etc/nginx/sites-enabled/saltdemo.conf:
    file.symlink:
        - user: root
        - group: root
        - mode: 644
        - target: /etc/nginx/sites-available/saltdemo.conf

nginx:
    pkg:
        - installed 
    service:
        - running
        - watch:
            - file: /etc/nginx/sites-enabled/saltdemo.conf


