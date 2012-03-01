# install a nagios plugin in the appropriate libdir, from this module's files
# directory
#
# title: name of the plugin to install

define nagios::install::plugin() {
    $plugin_name = $title

    $libdir = $hardwaremodel ? {
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
            case $macosx_productversion_major {
                "10.7":{
                    package {
                        "nrpe-i386.dmg":
                            ensure => installed,
                            provider => pkgdmg,
                            source => "${platform_httproot}/DMGs/nrpe-i386.dmg";
                    }
                }
                default: {
                    install_dmg {
                        "nrpe-i386.dmg":
                            creates => "/usr/local/nagios-i386/sbin/nrpe";
                    }
                }
            }
        }
    }

    # install plugins
    case $slaveType {
        master: {
            nagios::install::plugin {
                "check_http_redirect_ip": ;
                "check_ganglia":
                    require => Class["ganglia::client"];
            }
        }
    }
}
