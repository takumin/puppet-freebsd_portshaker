# == Class freebsd_portshaker::sync
#
# This class is called from freebsd_portshaker for ports tree sync.
#
class freebsd_portshaker::sync {
  exec { 'portshaker -U -M':
    path        => "$::freebsd_portshaker::prefix/bin",
    refreshonly => true,
    require     => [
      File[$::freebsd_portshaker::config],
    ],
  }
}
