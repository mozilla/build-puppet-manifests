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
            owner => cltbld,
            group => cltbld,
            source => "${platform_fileroot}/etc/fonts.conf";
        "/home/cltbld/.bash_profile":
            owner => cltbld,
            group => cltbld,
            source => "${platform_fileroot}/home/cltbld/.bash_profile";
        "/home/cltbld/bin/buildbot":
            ensure => absent;
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

        "/etc/sudoers":
            mode => 440,
            source => "${platform_fileroot}/etc/sudoers";
    }

    # On Talos machines, puppet is only run at boot.  Network Manager is
    # handling the network connections, so we don't have any network until
    # cltbld is fully logged in, at which point puppet is run.  By setting
    # ensure => running we make sure that ntpdate is run here.  The service
    # doesn't actually need to be enabled because there's no network connection
    # at the point in the boot sequence when the ntpdate service would actually
    # get run.
    service { 'ntpdate':
        enable => false,
        ensure => running;
    }

    # this really applies to all fedora hosts, but since those are all talos, too,
    # it's here for the moment.
    service { 'avahi-daemon':
        enable => 'false',
        ensure => 'stopped'
    }

    include buildslave::startup
}
