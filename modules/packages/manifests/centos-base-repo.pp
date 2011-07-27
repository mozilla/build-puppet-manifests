class packages::centos-base-repo {
    file {
        "/etc/yum.repos.d/CentOS-Base.repo":
            source => "puppet:///modules/packages/CentOS-Base.repo";
    }
}
