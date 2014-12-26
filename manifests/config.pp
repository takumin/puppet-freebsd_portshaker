# == Class freebsd_portshaker::config
#
# This class is called from freebsd_portshaker for service config.
#
class freebsd_portshaker::config {
  if $::freebsd_portshaker::use_zfs {
    if $::operatingsystemmajrelease >= 10 {
      $compression = 'lz4'
    } else {
      $compression = 'zle'
    }

    zfs { $::freebsd_portshaker::base_zfs:
      atime       => off,
      compression => $compression,
      exec        => off,
      setuid      => off,
      mountpoint  => $::freebsd_portshaker::base_dir,
    }
  }

  concat { $::freebsd_portshaker::config:
    owner   => 'root',
    group   => 'wheel',
    mode    => '0644',
  }

  concat::fragment { 'config_header':
    target  => $::freebsd_portshaker::config,
    content => template($::freebsd_portshaker::config_template),
    order   => '0'
  }

  create_resources(freebsd_portshaker::target, $::freebsd_portshaker::target)
  create_resources(freebsd_portshaker::source, $::freebsd_portshaker::source)
}
