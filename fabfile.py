from fabric.api import env, task, run, cd
from dockerfabric.apiclient import docker_fabric
from dockerfabric import tasks as docker

env.docker_tunnel_local_port = 22024


@task
def rm_weave():
    run('docker rm -f weave weavedns weaveproxy')


@task
def start_weave():
    with cd('/data/repos/docker-scripts'):
        run('git pull')
        run('./weave/weave.sh')


@task
def restart_weave():
    rm_weave()
    start_weave()


@task
def rm_nginx():
    run('docker stop nginx && docker rm nginx')


@task
def start_nginx():
    with cd('/data/repos/docker-scripts'):
        run('git pull')
        run('./nginx/nginx.sh')


@task
def restart_nginx():
    rm_nginx()
    start_nginx()


@task
def restart_gitlab():
    with cd('/data/repos/docker-scripts'):
        run('git pull')
        run('docker stop gitlab && docker rm gitlab')
        run('docker stop postgresql-gitlab redis-gitlab')
        run('docker rm postgresql-gitlab redis-gitlab')
        run('./gitlab/gitlab.sh')


@task
def rm_rocketchat():
    run('docker stop rocketchat')
    run('docker rm rocketchat')


@task
def start_rocketchat():
    with cd('/data/repos/docker-scripts'):
        run('git pull')
        run('./rocketchat/rocketchat.sh')


@task
def restart_rocketchat():
    rm_rocketchat()
    start_rocketchat()


@task
def rm_mongodb():
    run('docker stop mongodb')
    run('docker rm mongodb')


@task
def start_mongodb():
    with cd('/data/repos/docker-scripts'):
        run('git pull')
        with cd('mongodb'):
            run('./mongodb.sh')


@task
def rm_btsync():
    run('docker stop btsync')
    run('docker rm btsync')


@task
def start_btsync():
    with cd('/data/repos/docker-scripts'):
        run('git pull')
        run('./btsync/btsync.sh')


@task
def restart_btsync():
    rm_btsync()
    start_btsync()


@task
def rm_mysql():
    run('docker stop mysql')
    run('docker rm mysql')


@task
def start_mysql():
    with cd('/data/repos/docker-scripts'):
        run('git pull')
        run('./mysql/mysql.sh')


@task
def restart_mysql():
    rm_mysql()
    start_mysql()


@task
def rm_memcached():
    run('docker stop memcached')
    run('docker rm memcached')


@task
def start_memcached():
    with cd('/data/repos/docker-scripts'):
	run('git pull')
	run('./memcached/memcached.sh')


@task
def restart_memcached():
    rm_memcached()
    start_memcached()


@task
def rm_jetty():
    run('docker stop jetty')
    run('docker rm jetty')


@task
def start_jetty():
    with cd('/data/repos/docker-scripts'):
	run('git pull')
	run('./jetty/jetty.sh')


@task
def restart_jetty():
    rm_jetty()
    start_jetty()


@task
def rm_jetty_manager():
    run('docker stop manager')
    run('docker rm manager')


@task
def start_jetty_manager():
    with cd('/data/repos/docker-scripts'):
	run('git pull')
	run('./jetty/jetty-manager.sh')


@task
def restart_jetty_manager():
    rm_jetty_manager()
    start_jetty_manager()


@task
def rm_elasticsearch():
    run('docker stop elasticsearch')
    run('docker rm elasticsearch')


@task
def start_elasticsearch():
    with cd('/data/repos/docker-scripts'):
	run('git pull')
	run('./elasticsearch/elasticsearch.sh')


@task
def restart_elasticsearch():
    rm_elasticsearch()
    start_elasticsearch()


