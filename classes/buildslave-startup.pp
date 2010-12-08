class buildslave-startup {
    # currently, CentOS means build, so buildbot's started as root, while
    # Fedora means test, so buildbot's started via console.  This may get
    # more complicated later, maybe requiring a regexp on the slave name?
    # (which would require Puppet 0.25.0).  This could also be based on
    # $slaveType, although that includes 'stage', which throws things off.
    $startuptype = $operatingsystem ? {
        CentOS      => "initd",
        Fedora      => "desktop",
        Darwin      => "launchd"
    }

    # everyone uses runslave.py in the same place
    file {
        "/usr/local/bin/runslave.py":
            source => "${platform_fileroot}/usr/local/bin/runslave.py",
            owner  => "root",
            group  => "root",
            mode => 755;
    }

    case $startuptype {
        initd: {
            file {
                "/etc/init.d/buildbot":
                    source => "${platform_fileroot}/etc/init.d/buildbot",
                    owner  => "root",
                    group  => "root",
                    mode => 755,
                    notify => Exec["reset-buildbot-service"];

                # this file is no longer used
                "/etc/default/buildbot":
                    ensure  => absent;
            }

            exec {
                reset-buildbot-service:
                    command => "/sbin/chkconfig --del buildbot && /sbin/chkconfig --add buildbot",
                    refreshonly => true;
            }

            # buildbot-tac is no longer used, so disable it.
            service {
                "buildbot-tac":
                    provider => "redhat",
                    ensure => 'stopped',
                    enable => 'false',
                    before => File["/etc/init.d/buildbot-tac"]
            }
            file {
                "/etc/init.d/buildbot-tac":
                    ensure => absent
            }
        }

        desktop: {
            # this is set up to run by the puppet-config class
            file {
                "/home/cltbld/run-puppet-and-buildbot.sh":
                    owner => cltbld,
                    group => cltbld,
                    source => "${platform_fileroot}/home/cltbld/run-puppet-and-buildbot.sh";
            }
        }
    }
}
