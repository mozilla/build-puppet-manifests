# nagios class
class nagios::service {
    # nagios requires sudoers to run nrpe checks as root in some cases
    include sudoers

    case $slaveType {
        master: {
            # This include only exists on Buildmaster Puppets, so we must
            # include it inside of this block.
            include secrets
        }
    }
    case $operatingsystem {
        Darwin: {
            $plugins_dir = "/usr/local/nagios/plugins"
            $etcdir = "/usr/local/nagios/etc"
            file {
                "/usr/local/nagios/etc/nrpe.cfg":
                    content => template("nagios/nrpe.cfg.erb"),
                    owner  => "root",
                    group  => "wheel";
                "$etcdir/nrpe.d":
                    ensure => directory,
                    owner  => "root",
                    group  => "wheel";
            }
        }
        CentOS: {
            $libdir = $hardwaremodel ? {
                i686   => "lib",
                x86_64 => "lib64"
            }
            $plugins_dir = "/usr/${libdir}/nagios/plugins"
            $etcdir = "/etc/nagios"
            file {
                "$etcdir/nrpe.cfg":
                    content => template("nagios/nrpe.cfg.erb"),
                    owner   => "root",
                    group   => "root";
                "$etcdir/nrpe.d":
                    ensure => directory,
                    owner  => "root",
                    group  => "wheel";
            }
        }
    }
    case $operatingsystem {
        CentOS: {
            service {
                "nrpe":
                    enable => "true",
                    subscribe => [File["$etcdir/nrpe.cfg"], File["$etcdir/nrpe.d"]],
                    ensure => "running",
                    require => $slaveType ? {
                        master => [
                            Package["nagios-plugins-all"],
                            Package["nrpe"]
                        ],
                        build => [
                            Package["nagios-nrpe"]
                        ]
                    };
            }
        }
        Darwin: {
            file {
                "/usr/local/nagios/etc/nrpe.plist":
                    source => "puppet:///nagios/darwin/nrpe.plist",
                    owner => "root",
                    group => "wheel";
                "/usr/local/nagios-i386":
                    ensure => "nagios",
                    owner => "root",
                    group => "wheel";
                "/usr/local/bin/setup-nagios-user.sh":
                    owner => "root",
                    group => "staff",
                    mode => 0755,
                    source => "puppet:///nagios/darwin/setup-nagios-user.sh";
            }
            exec { 
                setup-nagios-user:
                    creates => "/var/db/.puppet_nagios_user_setup",
                    command => "/usr/local/bin/setup-nagios-user.sh",
                    require => File["/etc/fstab"],
                    subscribe => Install_dmg["nrpe-i386.dmg"];
                enable-nrpe:
                    creates => "/Library/LaunchDaemons/nrpe.plist",
                    command => "/usr/local/nagios/sbin/enablenrpe",
                    subscribe => [Install_dmg["nrpe-i386.dmg"], File["/usr/local/nagios/etc/nrpe.plist"]];
            }
        }
    }
}
