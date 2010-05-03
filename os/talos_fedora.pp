# talos_fedora.pp

class talos_fedora {
    Package{ provider => rpm, ensure => installed }

    package {
        "mercurial":
            source => "${httproot}/talos/linux/RPMS/${hardwaremodel}/mercurial-1.5.1-1.fc12.${hardwaremodel}.rpm";
        "gtk2-immodule-xim":
            ensure => absent,
            before => Package["gtk2"];
        "gtk2":
            source => "${httproot}/talos/linux/RPMS/${hardwaremodel}/gtk2-2.18.9-3.fc12.${hardwaremodel}.rpm",
            ensure => latest;
    }
}
