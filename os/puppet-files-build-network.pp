class puppet-files-build-network {
    case $operatingsystem {
        CentOS: {
            mount {
                "puppet-files":
                    name   => "/N",
                    atboot => true,
                    device => "10.2.71.136:/export/buildlogs/puppet-files",
                    ensure => "mounted",
                    fstype => "nfs",
                    options => "ro",
                    remounts => true;
            }
        }
        Darwin: {
            file {
                "/etc/fstab":
                    require => File["/etc/auto_master"],
                    notify => Exec["mount-nfs"],
                    owner => "root",
                    group => "wheel",
                    source => "${local_fileroot}/etc/fstab";
            }
        }
    }
}
