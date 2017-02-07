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
  file { '/etc/cups/cupsd.conf' :
    ensure  => file,
    source => 'puppet:///modules/profile/cupsd.conf',
    require => Class['cups'],
  }
  cups_queue { 'Brother_HL-L2320D_series':
    ensure => 'printer',
    model  => 'drv:///sample.drv/generpcl.ppd',
    make_and_model => 'Generic PCL Laser Printer',
    require        => Class['cups'],
 }
}