class profile::airprint {
    $packages = [
        'avahi-daemon',
        'avahi-discover',
        'libnss-mdns',
        'cups',
        'cups-pdf',
        'gutenprint',
        'pycups',
        'avahi',
        'python2',
        'python-cups',
    ]
    package { $packages : ensure => installed }
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
        require => Package[$packages]
    }
    service { 'avahi-daemon' :
        ensure  => running,
        require => Package[$packages]
    }
    file_line { 'cups port':
        ensure => present,
        path   => '/etc/cups/cupsd.config',
        line   => 'Port 631',
        match  => '^Listen localhost:631',
        before => Service['cups']
    }
    file_line { 'cups serveralias':
        ensure => present,
        path   => '/etc/cups/cupsd.config',
        line   => 'ServerAlias *'
        after  => '^DefaultAuthType Basic$'
        before => Service['cups']
    }
    file_line { 'cups order':
        ensure => present,
        path   => '/etc/cups/cupsd.config',
        line   => 'Allow @Local'
        after  => '^  Order allow,deny$'
        before => Service['cups']
    }
}
