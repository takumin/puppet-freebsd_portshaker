# == Class freebsd_portshaker::install
#
# This class is called from freebsd_portshaker for install.
#
class freebsd_portshaker::install {

  package { $::freebsd_portshaker::package_name:
    ensure => $::freebsd_portshaker::package_ensure,
  }
}
