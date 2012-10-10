class wowza (
  $wowzakey,
  $java_heap_size = $wowza::params::java_heap_size,
  $enable_jmxremote = $wowza::params::enable_jmxremote,
  $wowza_pkg = $wowza::params::wowza_pkg
) inherits wowza::params {

  class {'wowza::install':;} ~>
    class {'wowza::serverconfig':;} ~>
    class {'wowza::setenv':;} ~>
    class {'wowza::jmxconfig':;} ~>
    class {'wowza::service':;}

}

class wowza::disable inherits wowza{
  Service['WowzaMediaServer'] {
    ensure => 'stopped' ,
    enable => false,
  }
}
