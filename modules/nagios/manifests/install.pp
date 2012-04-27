# install a nagios plugin in the appropriate libdir, from this module's files
# directory
#
# title: name of the plugin to install

define nagios::install::plugin() {
    $plugin_name = $title

    $libdir = $hardwaremodel ? {
        i386   => "lib",
        i686   => "lib",
        x86_64 => "lib64"
    }

    file {
        "/usr/$libdir/nagios/plugins/$plugin_name":
            source => "puppet:///nagios/$plugin_name",
            mode   => 755,
            owner  => root,
            group  => root;
    }
}

class nagios::install {
    case $operatingsystem {
        CentOS: {
            $centosTag = $operatingsystemrelease ? {
                "5.5" => "el5",
                "5.8" => "el5",
                "6.2" => "el6",
            }
            case $slaveType {
                master: {
                    package {
                        "nrpe":
                            ensure => "2.12-16.${centosTag}";
                        "nagios-plugins-nrpe":
                            ensure => "2.12-16.${centosTag}";
                        "nagios-plugins-all":
                            ensure => "1.4.15-2.${centosTag}";
                    }
                }
                build: {
                    package {
                        "nagios-nrpe":
                            alias => "nrpe",
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
            case $slaveType {
                master: {
                    package {
                        "nrpe-i386.dmg":
                            ensure => installed,
                            provider => pkgdmg,
                            source => "${httproot}/Darwin10/nrpe-i386.dmg";
                    }
                }
                default: {
                    package {
                        "nrpe-i386.dmg":
                            ensure => installed,
                            provider => pkgdmg,
                            source => "${platform_httproot}/DMGs/nrpe-i386.dmg";
                    }
               }
           }
        }
    }

    # install plugins
    case $slaveType {
        master: {
            case $operatingsystem {
                CentOS: {
                    nagios::install::plugin {
                        "check_http_redirect_ip": ;
                        "check_ganglia":
                            require => Class["ganglia::client"];
                    }
                }
            }
        }
    }
}
