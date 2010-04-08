# talos_fedora.pp

class talos_fedora {
    Package{ provider => rpm, ensure => installed }

    package {
        "mercurial":
            source => "${httproot}/talos/linux/RPMS/${hardwaremodel}/mercurial-1.5.1-1.fc12.${hardwaremodel}.rpm";
    }
}
