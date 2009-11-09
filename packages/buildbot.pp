# buildbot.pp
# installs buildbot scripts, ensures it is running

class buildbot {

    file {
        "/etc/default/buildbot":
            source => "/N/centos5/etc/default/buildbot",
            before => service["buildbot"];
        "/etc/init.d/buildbot":
            source => "/N/centos5/etc/init.d/buildbot",
            mode => 755,
            before => service["buildbot"];
    }
    service {
        'buildbot':
            provider => "redhat",
            ensure => 'running',
            enable => 'true',
            requires => service["buildbot-tac"];
        'buildbot-tac':
            provider => "redhat",
            ensure => 'running',
            enable => 'true';
            require => [file["/etc/init.d/buildbot-tac"], exec["untar-build-tools"]];

    }
}
