# buildbot.pp
# installs buildbot scripts, ensures it is running

class buildbot {

    file {
        "/etc/default/buildbot":
            source => "/N/centos5/etc/default/buildbot";
        "/etc/init.d/buildbot":
            source => "/N/centos5/etc/init.d/buildbot",
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
            require => [file["/etc/init.d/buildbot-tac"], exec["untar-build-tools"]];

    }
}
