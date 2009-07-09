class puppet-files-sandbox-network {
    mount {
        "puppet-files":
            name   => "/N",
            atboot => true,
            device => "10.2.76.136:/export/buildlogs/puppet-files",
            ensure => "mounted",
            fstype => "nfs",
            options => "ro",
            remounts => true;
    }
}
