class puppet-files-build-network {
    mount {
        "puppet-files":
            name   => "/N",
            atboot => true,
            device => "10.2.71.136:/export/buildlogs/puppet-files",
            ensure => "mounted",
            fstype => "nfs",
            options => "ro",
            remounts => true;
    }
}
