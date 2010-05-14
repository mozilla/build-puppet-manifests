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
    }

    
    file {
        "/home/cltbld/.fonts.conf":
            source => "${platform_fileroot}/etc/fonts.conf";
    }
}
