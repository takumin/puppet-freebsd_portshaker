# == Class freebsd_portshaker::params
#
# This class is meant to be called from freebsd_portshaker.
# It sets variables according to platform.
#
class freebsd_portshaker::params {
  case $::osfamily {
    'FreeBSD': {
      $package_name    = 'ports-mgmt/portshaker'
      $package_ensure  = 'present'
      $prefix          = '/usr/local'
      $config          = "$prefix/etc/portshaker.conf"
      $config_template = 'freebsd_portshaker/portshaker.conf.erb'
      $target_template = 'freebsd_portshaker/target.erb'
      $source_dir      = "$prefix/etc/portshaker.d"
      $source_template = 'freebsd_portshaker/source.erb'
      $base_dir        = '/var/cache/portshaker'
      $use_zfs         = false
      $base_zfs        = ''
      $target          = {
        system => {
          tree  => '/usr/ports',
          merge => 'freebsd',
        },
      }
      $source          = {
        freebsd => {
          method => 'portsnap',
        },
      }
    }
    default: {
      fail("${::operatingsystem} not supported")
    }
  }
}
