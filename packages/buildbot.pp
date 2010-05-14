# buildbot.pp
# installs buildbot scripts, ensures it is running

class buildbot {

    file {
        "/etc/default/buildbot":
            source => "${platform_fileroot}/etc/default/buildbot";
        "/etc/init.d/buildbot":
            source => "${platform_fileroot}/etc/init.d/buildbot",
            mode => 755,
            notify => Exec["reset-buildbot-service"];
    }
    exec {
        reset-buildbot-service:
            command => "/sbin/chkconfig --del buildbot && /sbin/chkconfig --add buildbot",
            refreshonly => true;
    }
    service {
        'buildbot-tac':
            provider => "redhat",
            ensure => 'running',
            enable => 'true',
            require => [File["/etc/init.d/buildbot-tac"], Exec["untar-build-tools"]];

    }
}
