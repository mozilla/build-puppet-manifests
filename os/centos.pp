# centos.pp

class centos5 {
    Package{ provider => rpm }
    File{ owner => root, group => root, mode => 644, backup => false }

    #################################################
    # Custom configuration files
    #################################################
    file {
        "/etc/inittab":
            source => "${platform_fileroot}/etc/inittab";

        "/etc/sudoers":
            mode => 440,
            source => "${platform_fileroot}/etc/sudoers";

        "/etc/sysconfig/vncservers":
            source => "${platform_fileroot}/etc/sysconfig/vncservers";

        "/etc/mail/sendmail.cf":
            source => "${platform_fileroot}/etc/mail/sendmail.cf";

        # this is a hack, puppet's groupadd provider can not
        # add a user (like cltbld) to a group (like sbox)
        # so we have to do it by hand
        "/etc/group":
            source => "${platform_fileroot}/etc/group";

        "/etc/init.d/puppet":
            source => "puppet:///puppet/puppet-centos5-initd",
            mode => 755;

        "/tmp":
            ensure => directory,
            mode => 1777;

        # The "rpm" tool uses /var/tmp as a location to download remote RPMs to
        # Because we couldn't find a way to change this through config files,
        # environments variables, or otherwise; and because we download
        # very large RPMs sometimes, we need this directory on a partition
        # with a good amount of free space, hence using /builds/tmp.
        "/builds/tmp":
            ensure => directory,
            mode => 1777;

        "/var/tmp":
            ensure => "/builds/tmp",
            force => true;

        "/builds/hg-shared":
            ensure => directory,
            mode    => 755,
            owner   => cltbld,
            group   => cltbld;

    }

    #################################################
    # Manage cltbld user files
    #################################################

    case $hardwaremodel {
        "x86_64": {
        }
        default: {
            file {
                "/home/cltbld/.android":
                    mode   => 775,
                    owner  => cltbld,
                    group  => cltbld,
                    ensure => directory;

                "/home/cltbld/.android/android.keystore":
                    require => File["/home/cltbld/.android"],
                    source  => "${local_fileroot}/home/cltbld/.android/android.keystore",
                    mode    => 600,
                    owner   => cltbld,
                    group   => cltbld;

                "/home/cltbld/.mozpass.cfg":
                    source => "${local_fileroot}/home/cltbld/.mozpass.cfg",
                    mode   => 600,
                    owner  => cltbld,
                    group  => cltbld;
            }
        }
    }

    #################################################
    # Arch-specific configuration files
    #################################################

    file {
        "/boot/grub.conf":
            mode => 600,
            source => "${platform_fileroot}/boot/grub.conf";
        "/etc/sysctl.conf":
            source => "${platform_fileroot}/etc/sysctl.conf";
    }

    exec { 
        subscribe-sendmail:
            command => "/etc/init.d/sendmail restart",
            logoutput => true,
            refreshonly => true,
            subscribe => File["/etc/mail/sendmail.cf"];

        sysctl-reload:
            command => "/sbin/sysctl -p",
            logoutput => true,
            refreshonly => true,
            subscribe => File["/etc/sysctl.conf"];
    }

    mount {
        "root":
            name   => "/",
            atboot => true,
            device => "LABEL=/",
            ensure => "mounted",
            fstype => "ext3",
            options => "noatime",
            remounts => true;
        "puppet-files":
            name   => "/N",
            ensure => absent;
    }

    case $hardwaremodel {
        "x86_64": {
        }
        default: {
            file {
                "/scratchbox/users/cltbld/home/cltbld/.ssh":
                    ensure => "directory";
            }
            mount {
                "/scratchbox/users/cltbld/home/cltbld/.ssh":
                    device  => '/home/cltbld/.ssh',
                    fstype  => 'auto',
                    options => 'bind',
                    ensure  => mounted,
                    require => File['/scratchbox/users/cltbld/home/cltbld/.ssh'],
            }
        }
    }

    #################################################
    # Custom Packages per arch
    #################################################

    case $hardwaremodel {
        "x86_64": {
            package {
        	"ruby-shadow":
        	    ensure   => installed,
        	    source   => "${platform_httproot}/RPMs/ruby-shadow-1.4.1-7.el5.kb.x86_64.rpm";
        	"libnotify-devel":
        	    ensure   => installed,
        	    source   => "${platform_httproot}/RPMs/libnotify-devel-0.4.2-6.el5.x86_64.rpm";
        	"wireless-tools-devel":
        	    ensure   => installed,
        	    source   => "${platform_httproot}/RPMs/wireless-tools-devel-28-2.el5.x86_64.rpm";
            }
        }
        default: {
            package {
        	"ruby-shadow":
        	    ensure   => installed,
        	    source   => "${platform_httproot}/RPMs/ruby-shadow-1.4.1-6.i386.rpm";
        	"libnotify-devel":
        	    ensure   => installed,
        	    source   => "${platform_httproot}/RPMs/libnotify-devel-0.4.2-6.el5.i386.rpm";
        	"wireless-tools-devel":
        	    ensure   => installed,
        	    source   => "${platform_httproot}/RPMs/wireless-tools-devel-28-2.el5.i386.rpm";
            "fontconfig":
                ensure   => latest,
                source   => "${platform_httproot}/RPMs/fontconfig-2.4.2-2.i686.rpm",
                require  => Package["fontconfig-devel"];
            "fontconfig-devel":
                ensure   => latest,
                source   => "${platform_httproot}/RPMs/fontconfig-devel-2.4.2-2.i686.rpm";
            "qt-sdk":
                ensure   => latest,
                source   => "${platform_httproot}/RPMs/qt-sdk-4.6.3-2010.04moz1.i686.rpm",
                require  => Package["fontconfig"];
            }
        }
    }

    #################################################
    # Custom Packages - noarch
    #################################################

    package {
        "yum-utils":
       	    ensure   => installed,
            source   => "${platform_httproot}/RPMs/yum-utils-1.0.4-3.el5.centos.2.noarch.rpm";
       	"lcov":
            ensure   => installed,
       	    source   => "${platform_httproot}/RPMs/lcov-1.7-1.noarch.rpm";
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

    include buildslave::install
    include buildslave::startup
    include buildslave::cleanup
    include network
    include buildslave::purgebuilds
}
