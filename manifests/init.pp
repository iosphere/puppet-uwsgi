# == Class: uwsgi

class uwsgi {
    include uwsgi::service

    package { 'uwsgi':
        ensure   => installed,
        provider => 'pip',
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

    file {'/etc/init.d/uwsgi':
        ensure  => 'present',
        content => template("${module_name}/initd.erb"),
        owner   => root,
        group   => root,
        mode    => '0755',
        require => Package['uwsgi']
    }
}
