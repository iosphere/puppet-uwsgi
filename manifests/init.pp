# == Class: uwsgi

class uwsgi {
    include uwsgi::service

    package { 'uwsgi':
        ensure   => present,
        provider => 'pip',
        require => Package['python-pip'],
    }

    file { ['/etc/uwsgi', '/etc/uwsgi/apps-enabled']:
        ensure  => 'directory',
        owner   => 'www-data',
        group   => 'www-data',
        require => Package['uwsgi'],
    }

    file { '/var/log/uwsgi':
        ensure  => 'directory',
        owner   => 'www-data',
        group   => 'www-data',
        require => Package['uwsgi'],
    }

    file {'/etc/init/uwsgi.conf':
        ensure  => 'present',
        source  => 'puppet:///modules/uwsgi/uwsgi-upstart.conf',
        owner   => root,
        group   => root,
        mode    => '0755',
        require => Package['uwsgi']
    }
}
