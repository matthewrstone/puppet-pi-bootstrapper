class profile::avahi {
  class { 'avahi' : }
  service { 'avahi-daemon' :
    ensure  => running,
    require => Class['avahi'],
  }
}