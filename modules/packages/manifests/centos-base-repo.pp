class packages::centos-base-repo {
    file {
        "/etc/yum.repos.d/CentOS-Base.repo":
            content => template("packages/CentOS-Base.repo.erb");
    }
}
