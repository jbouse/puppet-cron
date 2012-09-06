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
# 5Ub-Z3r0
#
define cron::task(
  $ensure   = 'present',
  $command  = undef,
  $minute   = '*',
  $hour     = '*',
  $monthday = '*',
  $month    = '*',
  $weekday  = '*'
) {
  include cron

  validate_absolute_path($command)

  if !($minute == '*' or ($minute >= 0 and $minute <= 59)) {
    fail('Specify a minute in the range 0-59')
  }
  if !($hour == '*' or ($hour >= 0 and $hour <= 23)) {
    fail('Specify an hour in the range 0-23')
  }
  if !($monthday == '*' or ($monthday >= 1 and $monthday <= 31)) {
    fail('Specify a day of month in the range 1-31')
  }
  if !($month == '*' or ($month >= 1 and $month <= 12)) {
    fail('Specify a month in the range 1-12')
  }
  if !($weekday == '*' or ($weekday >= 0 and $weekday <= 6)) {
    fail('Specify a day of week in the range 0-6')
  }

  cron { $name:
    ensure   => $ensure,
    command  => $command,
    user     => 'root',
    minute   => $minute,
    hour     => $hour,
    month    => $month,
    monthday => $monthday,
    weekday  => $weekday
  }
}

