class puppet-files-sandbox-network {
    case $operatingsystem {
        CentOS: {
            mount {
                "puppet-files":
                    name   => "/N",
                    atboot => true,
                    device => "10.2.76.136:/export/buildlogs/puppet-files",
                    ensure => "mounted",
                    fstype => "nfs",
                    options => "ro",
                    remounts => true;
            }
        }
        Darwin: {
            file {
                "/etc/fstab":
                    require => file["/etc/auto_master"],
                    notify => exec["mount-nfs"],
                    source => "${fileroot}darwin9/etc/fstab-sandbox";
            }
        }
    }
}
