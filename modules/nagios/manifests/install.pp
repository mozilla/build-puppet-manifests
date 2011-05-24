
class nagios::install {
    case $operatingsystem {
        CentOS: {
            case $slaveType {
                master: {
                    package {
                        "nrpe":
                            ensure => "2.12-16.el5";
                        "nagios-plugins-nrpe":
                            ensure => "2.12-16.el5";
                        "nagios-plugins-all":
                            ensure => "1.4.15-2.el5";
                    }
                }
                build: {
                    package {
                        "nagios-nrpe":
                            source => "${platform_httproot}/RPMs/nagios-nrpe-2.5.2-1.el5.rf.$hardwaremodel.rpm",
                            ensure => installed;
                        "nagios-plugins":
                            source => "${platform_httproot}/RPMs/nagios-plugins-1.4.9-1.el5.rf.$hardwaremodel.rpm",
                            ensure => installed;
                        "nagios-plugins-nrpe":
                            source => "${platform_httproot}/RPMs/nagios-plugins-nrpe-2.5.2-1.el5.rf.$hardwaremodel.rpm",
                            ensure => installed;
                    }
                }
            }
        }
        Darwin: {
            install_dmg {
                "nrpe-i386.dmg":
                    creates => "/usr/local/nagios-i386/sbin/nrpe";
            }
        }
    }
    case $slaveType {
        master: {
            $libdir = $hardwaremodel ? {
                i686   => "lib",
                x86_64 => "lib64"
            }
            file {
                "/usr/$libdir/nagios/plugins/check_http_redirect":
                    source => "puppet:///nagios/check_http_redirect",
                    mode   => 755,
                    owner  => root,
                    group  => root;
            }
        }
    }
}
