class apache::install {
    case $operatingsystem {
        CentOS: {
            include packages::mozilla-repo

            package {
                httpd:
                    require => Class["packages::mozilla-repo"],
                    ensure => $operatingsystemrelease ? {
                        "5.5" => "2.2.3-45.el5.centos.1",
                        "5.8" => "2.2.3-45.el5.centos.1",
                        "6.2" => "2.2.15-15.el6.centos.1",
                    }
            }
        }
    }
}
