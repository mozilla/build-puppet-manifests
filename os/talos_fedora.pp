# talos_fedora.pp

class talos_fedora {
    Package{ provider => rpm, ensure => installed }

    package {
        "mercurial":
            source => "${platform_httproot}/RPMs/mercurial-1.5.1-1.fc12.${hardwaremodel}.rpm",
            ensure => '1.5.1-1.fc12';
        "gtk2-immodule-xim":
            ensure => absent,
            before => Package["gtk2"];
        "gtk2":
            source => "${platform_httproot}/RPMs/gtk2-2.18.9-3.fc12.${hardwaremodel}.rpm",
            ensure => '2.18.9-3.fc12';
    }

    # both fed and fed64 talos boxes were built without python-devel installed, so install it now
    package {
        "python-devel":
            source => "${platform_httproot}/RPMs/python-devel-2.6.2-2.fc12.${hardwaremodel}.rpm",
            ensure => '2.6.2-2.fc12';
    }

    # bug 789651 mesa-libGL-devel for b2g emulator testing
    case $hardwaremodel {
        'i686': {
            package {
                "kernel-headers":
                    source => "${platform_httproot}/RPMs/kernel-headers-2.6.31.5-127.fc12.${hardwaremodel}.rpm",
                    ensure => "2.6.31.5-127.fc12";
                "pkgconfig":
                    source => "${platform_httproot}/RPMs/pkgconfig-0.23-9.fc12.${hardwaremodel}.rpm",
                    ensure => "0.23-9.fc12";
                "libX11-devel":
                    source => "${platform_httproot}/RPMs/libX11-devel-1.3-1.fc12.${hardwaremodel}.rpm",
                    ensure => "1.3-1.fc12",
                    require => Package["pkgconfig"];
                "libXau-devel":
                    source => "${platform_httproot}/RPMs/libXau-devel-1.0.5-1.fc12.${hardwaremodel}.rpm",
                    ensure => "1.0.5-1.fc12",
                    require => Package["libX11-devel"];
                "libXdamage-devel":
                    source => "${platform_httproot}/RPMs/libXdamage-devel-1.1.2-1.fc12.${hardwaremodel}.rpm",
                    ensure => "1.1.2-1.fc12",
                    require => Package["libX11-devel"];
                "libXdmcp-devel":
                    source => "${platform_httproot}/RPMs/libXdmcp-devel-1.0.3-1.fc12.${hardwaremodel}.rpm",
                    ensure => "1.0.3-1.fc12",
                    require => Package["libX11-devel"];
                "libXext-devel":
                    source => "${platform_httproot}/RPMs/libXext-devel-1.1-1.fc12.${hardwaremodel}.rpm",
                    ensure => "1.1-1.fc12",
                    require => Package["libX11-devel"];
                "libXfixes-devel":
                    source => "${platform_httproot}/RPMs/libXfixes-devel-4.0.4-1.fc12.${hardwaremodel}.rpm",
                    ensure => "4.0.4-1.fc12",
                    require => Package["libX11-devel"];
                "libXxf86vm-devel":
                    source => "${platform_httproot}/RPMs/libXxf86vm-devel-1.1.0-1.fc12.${hardwaremodel}.rpm",
                    ensure => "1.1.0-1.fc12",
                    require => Package["libX11-devel"];
                "libdrm-devel":
                    source => "${platform_httproot}/RPMs/libdrm-devel-2.4.15-4.fc12.${hardwaremodel}.rpm",
                    ensure => "2.4.15-4.fc12";
                "libxcb-devel":
                    source => "${platform_httproot}/RPMs/libxcb-devel-1.4-1.fc12.${hardwaremodel}.rpm",
                    ensure => "1.4-1.fc12";
                "xorg-x11-proto-devel":
                    source => "${platform_httproot}/RPMs/xorg-x11-proto-devel-7.4-34.fc12.noarch.rpm",
                    ensure => "7.4-34.fc12",
                    require => Package["libX11-devel"];
                "mesa-libGL-devel":
                    source => "${platform_httproot}/RPMs/mesa-libGL-devel-7.6-0.13.fc12.${hardwaremodel}.rpm",
                    ensure => '7.6-0.13.fc12',
                    require => Package["kernel-headers"],
                    require => Package["libX11-devel"],
                    require => Package["libXau-devel"],
                    require => Package["libXdamage-devel"],
                    require => Package["libXdmcp-devel"],
                    require => Package["libXext-devel"],
                    require => Package["libXfixes-devel"],
                    require => Package["libXxf86vm-devel"],
                    require => Package["libdrm-devel"],
                    require => Package["libxcb-devel"],
                    require => Package["xorg-x11-proto-devel"];
            }
        }
    }

    # NetworkManager kinda sucks, so disable it
    service {
        "network":
            ensure => 'running',
            enable => true,
            hasstatus => true,
            require => Service['NetworkManager'];
        "NetworkManager":
            ensure => 'stopped',
            hasstatus => true,
            enable => false;
    }

    file {
        "/home/cltbld/.fonts.conf":
            owner => cltbld,
            group => cltbld,
            source => "${platform_fileroot}/etc/fonts.conf";
        "/home/cltbld/.bash_profile":
            owner => cltbld,
            group => cltbld,
            source => "${platform_fileroot}/home/cltbld/.bash_profile";
        "${home}/cltbld/.ssh":
            mode => 700,
            owner => "cltbld",
            group => "cltbld",
            ensure => directory;
        "${home}/cltbld/.ssh/authorized_keys":
            owner => "cltbld",
            group => "cltbld",
            mode => 644,
            source => "${platform_fileroot}${home}/cltbld/.ssh/authorized_keys";
        "${home}/cltbld/bin/node.exe":
            owner => "cltbld",
            group => "cltbld",
            mode => 755,
            source => "${platform_fileroot}${home}/cltbld/bin/node.exe";

        # this directory is referenced by the apache configs, and must exist
        "${home}/cltbld/talos-slave/talos-data":
            ensure => directory,
            owner => "cltbld",
            group => "cltbld",
            mode => 775;
    }

    # this really applies to all fedora hosts, but since those are all talos, too,
    # it's here for the moment.
    service { 'avahi-daemon':
        enable => 'false',
        ensure => 'stopped'
    }

    include buildslave::install
    include buildslave::startup
    include buildslave::cleanup
    include gui::resolution
    include network
    include boot
    include sudoers
}
