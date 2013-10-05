# == Define: cron::task
#
# This type manages the schedulation of any task trough crontab
#
# === Parameters
#
# [*ensure*]
# Defaults to present.
#
# [*command*]
# Mandatory, contain the full path to the task that will be scheduled.
#
# [*minute*]
# Optional, defaults to *
# Contain the minute at wich the task will be run.
#
# [*hour*]
# Optional, defaults to *
# Contain the hour at wich the task will be run.
#
# [*monthday*]
# Optional, defaults to *
# Contain the day of the month at wich the task will be run.
#
# [*month*]
# Optional, defaults to *
# Contain the month at wich the task will be run.
#
# [*weekday*]
# Optional, defaults to *
# Contain the day of the week at wich the task will be run.
#
# === Examples
#
# cron::task { 'cleanup':
# ensure => present,
# command => '/path/to/cleanup_script.sh',
# hour => '0'
# }
#
# === Authors
#
# 5Ub-Z3r0, Jeremy T. Bouse
#
define cron::task(
  $ensure   = 'present',
  $user     = 'root',
  $special  = undef,
  $command  = undef,
  $minute   = '*',
  $hour     = '*',
  $monthday = '*',
  $month    = '*',
  $weekday  = '*'
) {
  include cron

  cron { $name:
    ensure   => $ensure,
    command  => $command,
    user     => $user,
    special  => $special,
    minute   => $minute,
    hour     => $hour,
    month    => $month,
    monthday => $monthday,
    weekday  => $weekday
  }
}

