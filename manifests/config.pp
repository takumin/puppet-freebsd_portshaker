# == Class freebsd_portshaker::config
#
# This class is called from freebsd_portshaker for service config.
#
class freebsd_portshaker::config {
  file { "$config":
    ensure  => file,
    owner   => 'root',
    group   => 'wheel',
    mode    => '0644',
    content => template($::config_template),
  }
  define portshaker_source ($param) {
    file { "$source_dir/$name":
      ensure  => file,
      owner   => 'root',
      group   => 'wheel',
      mode    => '0755',
      content => template($source_template),
    }
  }
  create_resources(portshaker_source, $source)
}
