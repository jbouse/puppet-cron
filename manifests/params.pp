# == Class: cron::params
#
# This class manages the parameters used for running the cron module
#
# === Parameters
#
# [*hourly_dir*]
# The shortcut directory for hourly task
#
# [*daily_dir*]
# The shortcut directory for daily task
#
# [*weekly_dir*]
# The shortcut directory for weekly task
#
# [*monthly_dir*]
# The shortcut directory for monthly task
#
# === Examples
#
# include cron
#
# === Authors
#
# 5Ub-Z3r0
#
class cron::params{
  case $::osfamily {
    'windows':{
      fail ("The ${::ofsamily} OS is not supported by this module")
    }
    default:{
      $hourly_dir = '/etc/cron.hourly'
      $daily_dir = '/etc/cron.daily'
      $weekly_dir = '/etc/cron.weekly'
      $monthly_dir = '/etc/cron.monthly'
    }
  }
}
