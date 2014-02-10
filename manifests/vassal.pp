# == Class uwsgi::vassal
# Defines settings for a uwsgi vassal

define uwsgi::vassal (
  $chdir,
  $virtualenv,
  $wsgi_file,
  $processes=1,
  $master=true,
  $vacuum=true,
  $single_interpreter=true,
  $enable_threads=true
){
  file {"${title}.ini":
    ensure  => 'present',
    path    => "/etc/uwsgi/apps-enabled/${title}.ini",
    owner   => www-data,
    group   => www-data,
    mode    => '0640',
    content => template("${module_name}/vassal.ini.erb"),
    notify  => Class['uwsgi::service'],
  }
}
