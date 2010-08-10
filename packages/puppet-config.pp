class puppet-config {
    exec {
        restart:
            command => "/sbin/reboot",
            refreshonly => true;
    }
    case $operatingsystem {
        CentOS: {
            file {
                "/etc/sysconfig/puppet":
                    source => "${local_fileroot}/etc/sysconfig/puppet${configExt}",
                    owner => "root",
                    group => "root",
                    notify => Exec["reset-ssl"]
            }
            exec {
                reset-ssl:
                    command => "/bin/rm -rf /var/lib/puppet/ssl",
                    notify => Exec["restart"],
                    refreshonly => true;
            }
        }
        Fedora: {
            file {
                "/home/cltbld/.config/autostart/gnome-terminal.desktop":
                    source => "${local_fileroot}/home/cltbld/.config/autostart/gnome-terminal.desktop${configExt}",
                    owner => "cltbld",
                    group => "cltbld",
                    notify => Exec["reset-ssl"];
            }
            exec {
                reset-ssl:
                    command => "/bin/rm -rf /var/lib/puppet/ssl",
                    notify => Exec["restart"],
                    refreshonly => true;
            }
        }
        Darwin: {
            file {
                "/Library/LaunchDaemons/com.reductivelabs.puppet.plist":
                    source => "${local_fileroot}/Library/LaunchDaemons/com.reductivelabs.puppet.plist${configExt}",
                    owner => "root",
                    group => "wheel",
                    notify => Exec["reset-ssl"];
            }
            exec {
                reset-ssl:
                    command => "/bin/rm -rf /etc/puppet/ssl",
                    notify => Exec["restart"],
                    refreshonly => true;
            }
        }
    }
}
