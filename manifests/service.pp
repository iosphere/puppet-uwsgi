# == Class: uwsgi::service
# Ensures that the uwsgi service is running.

class uwsgi::service {
  service {'uwsgi':
    ensure     => running,
    enable     => true,
    status     => 'ps -p $(cat /var/run/uwsgi.pid) &>/dev/null',
    hasstatus  => false,
    hasrestart => false,
    require    => Package['uwsgi'],
  }
}
