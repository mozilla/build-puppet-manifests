# centos.pp
# 6/2/09 - consolidated a lot of the duplication and refactored a bit - cshields

class centos5 {

    $os = "centos5"
    $centos5root = "${fileroot}${os}/"

    Package{ provider => rpm }
    File{ owner => root, group => root, mode => 644 }

    #################################################
    # Custom configuration files
    #################################################
    file {
        "/etc/inittab":
            source => "${centos5root}etc/inittab";

        "/etc/sudoers":
            mode => 440,
            source => "${centos5root}etc/sudoers";

        "/boot/grub.conf":
            mode => 600,
            source => "${centos5root}boot/grub.conf";

        "/etc/sysconfig/vncservers":
            source => "${centos5root}etc/sysconfig/vncservers";

        "/etc/mail/sendmail.cf":
            source => "${centos5root}etc/mail/sendmail.cf";

        "/etc/fstab":
            source => "${centos5root}etc/fstab";

        "/etc/sysconfig/network-scripts/ifcfg-eth0":
            content => template("/etc/puppet/templates/ifcfg-eth0.erb");
            ### We may want to put a notify here to restart networking.
            ### would this pull the rug out from under puppet?

        "/etc/sysctl.conf":
            source => "${centos5root}etc/sysctl.conf";

        # this is a hack, puppet's groupadd provider can not
        # add a user (like cltbld) to a group (like sbox)
        # so we have to do it by hand
        "/etc/group":
            source => "${centos5root}etc/group";
    }

    exec { 
        subscribe-sendmail:
            command => "/etc/init.d/sendmail restart",
            logoutput => true,
            refreshonly => true,
            subscribe => file["/etc/mail/sendmail.cf"];

        remount-drives:
            command => "/bin/mount / -o remount,noatime; /bin/mount /builds -o remount,noatime",
            logoutput => true,
            refreshonly => true,
            subscribe => file["/etc/fstab"];

        sysctl-reload:
            command => "/sbin/sysctl -p",
            logoutput => true,
            refreshonly => true,
            subscribe => file["/etc/sysctl.conf"];
    }


    #################################################
    # Custom Packages
    #################################################
    package {
        "ruby-shadow":
            ensure   => installed,
            source   => "/N/centos5/RPMS/i386/ruby-shadow-1.4.1-6.i386.rpm";
        "yum-utils":
            ensure   => installed,
            source   => "/N/centos5/RPMS/i386/yum-utils-1.0.4-3.el5.centos.2.noarch.rpm";
        "libnotify-devel":
            ensure   => installed,
            source   => "/N/centos5/RPMS/i386/libnotify-devel-0.4.2-6.el5.i386.rpm";
        "wireless-tools-devel":
            ensure   => installed,
            source   => "/N/centos5/RPMS/i386/wireless-tools-devel-28-2.el5.i386.rpm";
        "lcov":
            ensure   => installed,
            source   => "/N/centos5/RPMS/noarch/lcov-1.7-1.noarch.rpm";
    }


    #################################################
    # VMWare setup
    #################################################
    case $productname {
        'VMware Virtual Platform': {
            notice "Detected vmware guest"
## deploying this package from puppet isn't working quite right
#            package {
#                "VMwareTools":
#                    ensure   => installed,
#                    provider => rpm,
#                    source   => "/N/centos5/custom/dist/VMwareTools-3.0.1-38803.i386.rpm";
#            }
            file {
                "/tmp/VMwareTools-3.0.1-38803.i386.rpm":
                    source => "${centos5root}custom/dist/VMwareTools-3.0.1-38803.i386.rpm"
            }
        }

        default: {
            notice "Did not detect vmware guest"
        }
    }

    case $operatingsystem {
        'CentOS': {
            notice "CentOS detected"
        }
        default: {
            notice "CentOS not detected"
        }
    }

    #################################################
    # Security updates
    #################################################
    package { "openssh":
        ensure => "4.3p2-26.el5_2.1",
        provider => yum
    }

    package { "openssh-server":
        ensure => "4.3p2-26.el5_2.1",
        provider => yum
    }

    # will need to restart sshd when updated, lest bad things happen
    exec { "restartsshd":
        command => "/etc/init.d/sshd restart",
		logoutput => true,
		refreshonly => true,
        subscribe => package["openssh-server"]
    }


    #################################################
    # Services
    #################################################
        service { 'vncserver':
            enable => 'false'
			## puppet's ensure looks at ps, isn't 'vncserver'
			#ensure => 'running',
	}
        service { 'auditd':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'avahi-daemon':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'acpid':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'bluetooth':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'cpuspeed':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'hplip':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'hidd':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'mcstrans':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'pcscd':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'ntpd':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'cups':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'cups-config-daemon':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'mdmonitor':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'smartd':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'atd':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'gpm':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'anacron':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'autofs':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'apmd':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'kudzu':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'yum-updatesd':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'rpcidmapd':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'rpcgssd':
            enable => 'false',
            ensure => 'stopped'
        }
        service { 'restorecond':
            enable => 'false',
            ensure => 'stopped'
        }
}
