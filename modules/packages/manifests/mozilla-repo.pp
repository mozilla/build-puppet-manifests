class packages::mozilla-repo {
    file {
        "/etc/yum.repos.d":
            source => "puppet:///modules/packages/yum.repos.d",
            ensure => directory,
            recurse => true,
            purge => true;
    }
}
