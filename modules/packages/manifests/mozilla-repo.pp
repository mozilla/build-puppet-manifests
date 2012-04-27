class packages::mozilla-repo {
    file {
        "/etc/yum.repos.d/packages-mozilla.repo":
            content => template("packages/packages-mozilla.repo.erb");
    }
}
