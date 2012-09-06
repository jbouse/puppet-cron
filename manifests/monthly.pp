# == Define: cron::monthly
#
# This type manages the schedulation of monthly task trough cron
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
# cron::monthly { 'backup':
# ensure => present,
# command => '/path/to/backup_script.sh'
# }
#
# === Authors
#
# 5Ub-Z3r0
#
define cron::monthly(
  $ensure  = present,
  $command = undef
){
  include cron
  validate_absolute_path($command)

  file { "${cron::params::monthly_dir}/${name}":
    ensure => link,
    target => $command
  }
}
