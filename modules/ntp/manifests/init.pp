# ntp class
# include this to manage ntpd on your node
class ntp {
    $group = $operatingsystem ? {
        Darwin => wheel,
        default => root
    }
    file {
        "/etc/ntp.conf":
            content => template("ntp/ntp.conf.erb"),
            mode => 644,
            owner => root,
            group => $group;
    }
    case $operatingsystem {
        CentOS: {
            case $slaveType {
                master: {
                    service {
                        "ntpd": 
                            subscribe => File["/etc/ntp.conf"],
                            enable => true,
                            hasstatus => true,
                            ensure => running;
                    }
                }
                build: {
                    case $virtual {
                        vmware: {
                            service {
                                "ntpd":
                                    enable => false,
                                    hasstatus => true,
                                    ensure => stopped;
                            }
                        }
                        default: {
                            service {
                                "ntpd":
                                    subscribe => File["/etc/ntp.conf"],
                                    enable => true,
                                    hasstatus => true,
                                    ensure => running;
                            }
                        }
                    }
                }
            }
        }
        # On Fedora machines, puppet is only run at boot.  Network Manager is
        # handling the network connections, so we don't have any network until
        # cltbld is fully logged in, at which point puppet is run.  By setting
        # ensure => running we make sure that ntpdate is run here.  The service
        # doesn't actually need to be enabled because there's no network connection
        # at the point in the boot sequence when the ntpdate service would actually
        # get run.
        Fedora: {
            service {
                "ntpdate":
                    enable => false,
                    hasstatus => true,
                    ensure => running;
            }
        }
        Darwin: {
            exec {
                "restart-ntp":
                    command => "/bin/launchctl stop org.ntp.ntpd && /bin/launchctl start org.ntp.ntpd",
                    subscribe => File["/etc/ntp.conf"],
                    refreshonly => true;
            }
        }
    }
}
