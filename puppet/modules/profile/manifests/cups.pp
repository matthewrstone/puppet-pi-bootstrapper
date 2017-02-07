class profile::cups {
  class { 'cups' : } 
  user { 'printadmin':
    comment  => 'Printer Admin',
    home     => '/home/printadmin',
    password => '5baa61e4c9b93f3f0682250b6cf8331b7ee68fd8',
    ensure   => present,
    shell    => '/bin/bash',
    uid      => '501',
    gid      => '20',
    groups   => 'lpadmin',
  }
  service { 'cups' :
    ensure  => running,
    require => [User['printadmin'], Class['cups']],
  }
  file { '/etc/cups/cupsd.conf' :
    ensure  => file,
    content => 'puppet:///modules/profile/cupsd.conf',
    require => Class['cups'],
  }
}