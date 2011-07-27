class apache::install {
    case $operatingsystem {
        CentOS: {
            include packages::centos-base-repo

            package {
                httpd:
                    require => Class["packages::centos-base-repo"],
                    ensure => "2.2.3-45.el5.centos.1";
            }
        }
    }
}
