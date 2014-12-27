# == Class freebsd_portshaker::sync
#
# This class is called from freebsd_portshaker for ports tree sync.
#
class freebsd_portshaker::sync {
  exec { 'portshaker -U -M':
    path        => [
      '/sbin',
      '/bin',
      '/usr/sbin',
      '/usr/bin',
      "$::freebsd_portshaker::prefix/sbin",
      "$::freebsd_portshaker::prefix/bin",
    ],
    refreshonly => true,
    require     => [
      File[$::freebsd_portshaker::config],
    ],
  }
}
