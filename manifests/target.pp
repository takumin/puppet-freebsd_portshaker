# == Class freebsd_portshaker::target
#
# This class is called from freebsd_portshaker for target ports tree
#
define freebsd_portshaker::target (
  $zfs        = undef,
  $tree       = undef,
  $merge      = undef,
  $preupdate  = undef,
  $postupdate = undef,
  $preupdate  = undef,
  $postupdate = undef,
) {
  concat::fragment { "target_$name":
    target  => $::freebsd_portshaker::config,
    content => template($::freebsd_portshaker::target_template),
    order   => '1',
    require => [
      File[$::freebsd_portshaker::config],
    ],
  }
}
