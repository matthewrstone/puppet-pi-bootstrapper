# These packages were mentioned in the walkthrough but not found in apt:
#        'gutenprint',
#        'pycups',
#        'avahi',
#        'python2',
class profile::airprint {
#    $packages = [
#        'avahi-daemon',
#        'avahi-discover',
#        'libnss-mdns',
#        'cups',
#        'cups-pdf',
#        'python-cups',
#    ]
#    package { $packages : ensure => installed }
  contain profile::avahi
  vcsrepo { '/home/pi/airprint-generate' :
    ensure   => present,
    source   => 'https://github.com/tjfontaine/airprint-generate.git',
    provider => git,
  }
  exec { 'generate_airprint_config' : 
    command     => 'sudo ./airprint-generate.py -d /etc/avahi/services',
    refreshonly => true,
    notify      => Class['avahi'],
  }

}
