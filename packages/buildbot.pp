# buildbot.pp
# installs buildbot scripts, ensures it is running

class buildbot {

    file {
        "/etc/default/buildbot":
            source => "${fileroot}centos5/etc/default/buildbot",
            before => service["buildbot"];
        "/etc/init.d/buildbot":
            source => "${fileroot}centos5/etc/init.d/buildbot",
            mode => 755,
            before => service["buildbot"];
    }
    service {
        'buildbot':
            provider => "redhat",
            ensure => 'running',
            enable => 'true';
    }
}
