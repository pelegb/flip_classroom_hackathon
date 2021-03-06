from fabric.api import *
import fabric.contrib.files
import os
import tempfile

# Configuration for DigitalOcean
# You need to create the user manually
env.hosts = ['95.85.30.156']
# env.hosts = ['107.170.4.199']
env.user = 'flip'

# Ec2 configuration

env.django_base_dir = os.path.join('/home/%s/' % (env.user), 'flip_classroom_hackathon/web/flipped')
env.repo = 'https://github.com/adamatan/flip_classroom_hackathon.git'
env.repo_dir = 'flip_classroom_hackathon'  # dir after clone
env.dns = 'the-openclass.org'
env.new_relic_key = 'd89f0ba6cb16fd69396907526703743e4bbc9e4d'


def get_ctx():
    ctx = {
        'HOME': '/home/' + env.user,
        'IP': env.host,
        'USER': env.user,
        'DJANGO_BASE_DIR': env.django_base_dir,
        'DNS': env.dns
    }
    return ctx


@task
def create_new():
    """ run all tasks to after new instance is created """
    update_host()
    update_apt()
    install_pipenv()
    update_pip()
    update_git()
    update_newrelic_config()
    update_conf()
    put_local_settings()
    db_first_time()
    collect_static()


@task
def update_host():
    """ general host update """
    sudo('echo deb http://apt.newrelic.com/debian/ newrelic non-free > sudo tee /etc/apt/sources.list.d/newrelic.list')
    sudo('wget -O- https://download.newrelic.com/548C16BF.gpg | apt-key add -')
    sudo(
        'echo deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main > sudo tee /etc/apt/sources.list.d/pgdg.list')
    sudo('wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -')
    sudo('apt-get update')
    sudo('apt-get --yes -q upgrade')


@task
def update_apt(package=None):
    """ updates/install all apt packages """
    packages = ('git',
                'nginx',
                'postgresql-client',
                'postgresql',
                'supervisor',
                'python-pip',
                'libpq-dev',
                'python-dev',
                'newrelic-sysmond',
                's3cmd',
                'unattended-upgrades',
                'gunicorn'
                )

    for p in packages:
        if not package or p == package:
            print 'Installing package ' + p
            sudo('apt-get install -q --yes --upgrade %s' % (p))


@task
def install_pipenv():
    sudo('pip install pipenv')


@task
def update_git():
    """ clone/pull git repo """
    clone = not fabric.contrib.files.exists(env.repo_dir)
    if clone:
        run('git clone %s' % (env.repo))
    else:
        with cd(env.repo_dir):
            run('git pull')


@task
def collect_static():
    # collect static
    with cd(env.django_base_dir):
        run('python manage.py collectstatic --noinput')


@task
def update_site():
    update_git()
    collect_static()
    with cd(env.django_base_dir):
        run('python manage.py migrate')
    reload_gunicorn()


@task
def update_pip():
    """ updates/install all pip packages """
    sudo('pip install --upgrade pip')
    sudo('pip install setuptools --upgrade')
    put('files/Pipfile', '/tmp/Pipfile')
    put('files/Pipfile.lock', '/tmp/Pipfile.lock')
    with cd('/tmp'):
        sudo('pipenv install --deploy --system')


@task
def update_newrelic_config():
    run('newrelic-admin generate-config %s newrelic.ini' % env.new_relic_key)
    sudo('nrsysmond-config --set license_key=%s' % env.new_relic_key)
    sudo('service newrelic-sysmond restart')


@task
def update_conf():
    """ update conf file for supervisor/nginx """
    ctx = get_ctx()

    run('mkdir -p log')
    run('mkdir -p bin')

    # copy gunicorn script
    fabric.contrib.files.upload_template('files/run_gunicorn.sh',
                                         'bin',
                                         context=ctx
                                         )
    with cd('bin'):
        run('chmod +x run_gunicorn.sh')

    # NGINX
    fabric.contrib.files.upload_template('files/nginx/flip.conf',
                                         '/etc/nginx/sites-available/',
                                         context=ctx,
                                         use_sudo=True)
    sudo('rm -f /etc/nginx/sites-enabled/flip.conf')
    sudo('rm -f /etc/nginx/sites-enabled/default')
    sudo('ln -s /etc/nginx/sites-available/flip.conf /etc/nginx/sites-enabled/flip.conf')
    # This is an issue in DigitalOcean
    fabric.contrib.files.uncomment('/etc/nginx/nginx.conf', 'server_names_hash_bucket_size', use_sudo=True)
    sudo('service nginx reload')
    sudo('service nginx restart')

    # restart conf
    fabric.contrib.files.upload_template('files/supervisor/flip.conf',
                                         '/etc/supervisor/conf.d/',
                                         context=ctx,
                                         use_sudo=True)
    sudo('sudo supervisorctl reread')
    sudo('supervisorctl update')
    sudo('supervisorctl restart flip')


@task
def status():
    sudo('supervisorctl status')


@task
def db_first_time():
    """ initialize Postgres DB """
    with cd(env.django_base_dir):
        run('python manage.py sqlcreate --router=default| sudo -u postgres psql')
        run('python manage.py syncdb --noinput')


@task
def db_reset():
    """ Reset (deletes and recreate) Postgres DB """
    with cd(env.django_base_dir):
        run('echo "DROP DATABASE flipped;" | sudo -u postgres psql')
        run('python manage.py sqlcreate --router=default| grep -v "CREATE USER" | sudo -u postgres psql')
        run('python manage.py syncdb --noinput')


@task
def reload_gunicorn():
    """ reload the gunicorn process """
    run('kill -HUP `cat %(HOME)s/flipped.id`' % get_ctx())


@task
def put_local_settings():
    ctx = get_ctx()

    with cd(env.django_base_dir):
        fabric.contrib.files.upload_template('files/local_settings.template.py',
                                             'local_settings.py',
                                             context=ctx)
    reload_gunicorn()


@task
def get_logs():
    ctx = get_ctx()
    remote_logs_archive = '/tmp/logs.tar.gz'
    with cd(ctx['HOME']):
        run('tar -cvzf %s log' % remote_logs_archive)
        with tempfile.NamedTemporaryFile(prefix='django-openclass-', suffix='.tar.gz', delete=False) as temp_file:
            get(remote_logs_archive, temp_file)
