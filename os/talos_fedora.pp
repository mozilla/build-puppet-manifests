# talos_fedora.pp

class talos_fedora {
    Package{ provider => rpm, ensure => installed }

    package {
        "mercurial":
            source => "${platform_httproot}/RPMs/mercurial-1.5.1-1.fc12.${hardwaremodel}.rpm";
        "gtk2-immodule-xim":
            ensure => absent,
            before => Package["gtk2"];
        "gtk2":
            source => "${platform_httproot}/RPMs/gtk2-2.18.9-3.fc12.${hardwaremodel}.rpm",
            ensure => latest;
        "buildbot":
            source => "${platform_httproot}/RPMs/buildbot-0.8.0-0moz1.${hardwaremodel}.rpm",
            ensure => latest;
    }

    
    file {
        "/home/cltbld/.fonts.conf":
            source => "${platform_fileroot}/etc/fonts.conf";
        "/home/cltbld/.bash_profile":
            owner => cltbld,
            group => cltbld,
            source => "${platform_fileroot}/home/cltbld/.bash_profile";
        "/home/cltbld/bin/buildbot":
            ensure => absent;
    }
}
