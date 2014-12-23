# == Class freebsd_portshaker::config
#
# This class is called from freebsd_portshaker for service config.
#
class freebsd_portshaker::config {
  if $::freebsd_portshaker::use_zfs {
    if $::operatingsystemmajrelease {
      $compression = 'zle'
    } else {
      $compression = 'lz4'
    }

    zfs { "$::freebsd_portshaker::base_zfs":
      atime       => off,
      compression => $compression,
      setuid      => off,
      setexec     => off,
      mountpoint  => $::freebsd_portshaker::base_dir,
    }
  }

  file { "$::freebsd_portshaker::config":
    ensure  => file,
    owner   => 'root',
    group   => 'wheel',
    mode    => '0644',
    content => template($::freebsd_portshaker::config_template),
  }

  create_resources(freebsd_portshaker::source, $::freebsd_portshaker::source)
}
