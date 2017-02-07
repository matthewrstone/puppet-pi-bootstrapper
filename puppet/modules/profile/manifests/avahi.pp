class profile::avahi {
  class { 'avahi': firewall => true }
  service { 'avahi-daemon' :
    ensure  => running,
    require => Class['avahi'],
  }
}