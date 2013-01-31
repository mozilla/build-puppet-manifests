# talos_fedora.pp

class talos_fedora {
    Package{ provider => rpm, ensure => installed }

    exec {
        # remove gnome-screensaver and its circular dependencies
        "rpm -e `rpm -q fedora-screensaver-theme fedorainfinity-screensaver-theme gnome-screensaver | grep -v 'is not installed'`":
            onlyif => "test `rpm -q fedora-screensaver-theme fedorainfinity-screensaver-theme gnome-screensaver | grep -v 'is not installed' | wc -l` -gt 0",
            path   => ["/bin","/usr/bin"];
        "/bin/rpm -U ${platform_httproot}/RPMs/alsa-plugins-pulseaudio-1.0.22-1.fc12.${hardwaremodel}.rpm \
            ${platform_httproot}/RPMs/pulseaudio-0.9.21-6.fc12.${hardwaremodel}.rpm \
            ${platform_httproot}/RPMs/pulseaudio-gdm-hooks-0.9.21-6.fc12.${hardwaremodel}.rpm \
            ${platform_httproot}/RPMs/pulseaudio-libs-0.9.21-6.fc12.${hardwaremodel}.rpm \
            ${platform_httproot}/RPMs/pulseaudio-libs-glib2-0.9.21-6.fc12.${hardwaremodel}.rpm \
            ${platform_httproot}/RPMs/pulseaudio-module-bluetooth-0.9.21-6.fc12.${hardwaremodel}.rpm \
            ${platform_httproot}/RPMs/pulseaudio-module-gconf-0.9.21-6.fc12.${hardwaremodel}.rpm \
            ${platform_httproot}/RPMs/pulseaudio-module-x11-0.9.21-6.fc12.${hardwaremodel}.rpm \
            ${platform_httproot}/RPMs/pulseaudio-utils-0.9.21-6.fc12.${hardwaremodel}.rpm":
                unless => "/bin/rpm -q pulseaudio-0.9.21-6.fc12 pulseaudio-gdm-hooks-0.9.21-6.fc12 \
                           pulseaudio-libs-0.9.21-6.fc12 pulseaudio-libs-glib2-0.9.21-6.fc12 \
                           pulseaudio-module-bluetooth-0.9.21-6.fc12 pulseaudio-module-gconf-0.9.21-6.fc12 \
                           pulseaudio-module-x11-0.9.21-6.fc12 pulseaudio-utils-0.9.21-6.fc12 \
                           alsa-plugins-pulseaudio-1.0.22-1.fc12 > /dev/null";
    }

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
        "/usr/bin/node":
            mode => 755,
            source => "${platform_fileroot}${home}/cltbld/bin/node.exe";

        # this directory is referenced by the apache configs, and must exist
        "${home}/cltbld/talos-slave/talos-data":
            ensure => directory,
            owner => "cltbld",
            group => "cltbld",
            mode => 775;
    }

    case $hardwaremodel {
        'i686': {
            file {
                # bug 789651
                # softlink /usr/lib/libGL.so -> /usr/lib/libGL.so.1.2
                "/usr/lib/libGL.so":
                    ensure => "/usr/lib/libGL.so.1.2",
                    owner => "root",
                    group => "root";
            }
        }
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
    include packages::tooltool
    include gui::resolution
    include network
    include boot
    include sudoers
}
