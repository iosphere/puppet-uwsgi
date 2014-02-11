# == Class: uwsgi::service
# Ensures that the uwsgi service is running.

class uwsgi::service {
  service {'uwsgi':
    ensure     => running,
    provider   => 'upstart',
    require    => File['/etc/init/uwsgi.conf'],
  }
}
