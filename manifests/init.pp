# == Class: freebsd_portshaker
#
# Full description of class freebsd_portshaker here.
#
# === Parameters
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#
class freebsd_portshaker (
  $package_name    = $::freebsd_portshaker::params::package_name,
  $package_ensure  = $::freebsd_portshaker::params::package_ensure,
  $config          = $::freebsd_portshaker::params::config,
  $config_template = $::freebsd_portshaker::params::config_template,
  $source_dir      = $::freebsd_portshaker::params::source_dir,
  $source_template = $::freebsd_portshaker::params::source_template,
  $base_dir        = $::freebsd_portshaker::params::base_dir,
  $use_zfs         = $::freebsd_portshaker::params::use_zfs,
  $target          = $::freebsd_portshaker::params::target,
  $source          = $::freebsd_portshaker::params::source,
) inherits ::freebsd_portshaker::params {

  class { '::freebsd_portshaker::install': } ->
  class { '::freebsd_portshaker::config': } ~>
  Class['::freebsd_portshaker']
}
