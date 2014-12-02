# == Class freebsd_portshaker::config
#
# This class is called from freebsd_portshaker for service config.
#
class freebsd_portshaker::config {
  if $::freebsd_portshaker::use_zfs {
    zfs { "$::freebsd_portshaker::base_zfs":
      atime       => off,
      compression => lzjb,
      mountpoint  => "$::freebsd_portshaker::base_dir",
      setuid      => off,
    }
  }

  file { "$::freebsd_portshaker::config":
    ensure  => file,
    owner   => 'root',
    group   => 'wheel',
    mode    => '0644',
    content => template($::freebsd_portshaker::config_template),
  }

  define portshaker_source ($method, $repos = '') {
    file { "$::freebsd_portshaker::source_dir/$name":
      ensure  => file,
      owner   => 'root',
      group   => 'wheel',
      mode    => '0755',
      content => template($::freebsd_portshaker::source_template),
    }
  }
  create_resources(portshaker_source, $::freebsd_portshaker::source)
}
