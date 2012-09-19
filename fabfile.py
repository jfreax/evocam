from __future__ import with_statement
from fabric.api import run, local, cd, env

env.hosts = ['jdsoft.de']

def push():
    local("git push")
    
def deploy():
    push()
    
    code_dir = '/var/www/static/evoface'
    with cd(code_dir):
        run("git pull")
        run("coffee -c *.coffee")
