# == Class freebsd_portshaker::config
#
# This class is called from freebsd_portshaker for service config.
#
define freebsd_portshaker::source ($method, $repos = '') {
  validate_re($method, [ '^portsnap$', '^svn$', '^git$', '^hg$', '^rsync$' ])

  file { "$::freebsd_portshaker::source_dir/$name":
    ensure  => file,
    owner   => 'root',
    group   => 'wheel',
    mode    => '0755',
    content => template($::freebsd_portshaker::source_template),
    require => [
      File[$::freebsd_portshaker::config],
    ],
  }
}