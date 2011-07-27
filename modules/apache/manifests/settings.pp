class apache::settings {
    case $operatingsystem {
        CentOS: {
            $configFile = "/etc/httpd/conf/httpd.conf"
            $configDir = "/etc/httpd/conf.d"
        }
    }
}
