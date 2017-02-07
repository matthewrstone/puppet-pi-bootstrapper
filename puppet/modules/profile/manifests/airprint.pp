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
        require => Package[$packages],
    }
    service { 'avahi-daemon' :
        ensure  => running,
        require => Package[$packages],
    }
    file { '/etc/cups/cupsd.conf' :
        ensure  => file,
        content => file('puppet:///${module_name}/cupsd.conf'),
    }
}
