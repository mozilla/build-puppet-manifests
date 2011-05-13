class packages::mozilla-repo {
    file {
        "/etc/yum.repos.d/packages-mozilla.repo":
            source => "puppet:///modules/packages/packages-mozilla.repo";
    }
}
