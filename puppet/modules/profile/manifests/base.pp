class profile::base {
  $packages = ['vim', 'git', 'puppet-lint']
  class { 'apt':
    update => {
      frequency => 'daily',
    },
    before => Package[$packages],
  }
  exec { 'apt upgrade':
    command     => '/bin/sh apt-get upgrade -y',
    refreshonly => true,
    subscribe   => Class['apt'],
  }
  class { 'locales':
    default_locale => 'en_US.UTF-8',
    locales   => ['en_US.UTF-8 UTF-8'],
  }
  package { $packages :
    ensure => installed,
  }

}
