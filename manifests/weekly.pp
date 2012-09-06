# == Define: cron::weekly
#
# This type manages the schedulation of weekly task trough cron
#
# === Parameters
#
# [*ensure*]
# Defaults to present.
#
# [*command*]
# Mandatory, contain the full path to the task that will be scheduled.
#
# === Examples
#
# cron::weekly { 'backup':
# ensure => present,
# command => '/path/to/backup_script.sh'
# }
#
# === Authors
#
# 5Ub-Z3r0
#
define cron::weekly(
  $ensure  = present,
  $command = undef
){
  include cron
  validate_absolute_path($command)

  file { "${cron::params::weekly_dir}/${name}":
    ensure => link,
    target => $command
  }
}
