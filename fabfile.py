from __future__ import with_statement
from fabric.api import run, local, cd, env

env.hosts = ['jdsoft.de']
src_dir = '/home/jens/VCS/evoface'
public_dir = '/var/www/static/evoface'


# Local #
def push():
    local("git push")

    
def make(watch=False):
    local("coffee " + ("-w " if watch else "") +"-o public/js -c src/*.coffee")

# Remote #
def deploy():
    push()
    
    with cd(public_dir):
        run("git pull")
        run("fab make")
        run("cp -r " + src_dir + "/public/* " + public_dir + "/")
    
# Helper #
def server():
    make()
    local("cd public && python -m SimpleHTTPServer")