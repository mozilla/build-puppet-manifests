# osx.pp

class osx {
    # This section contains things specific to the 10.5.2 build ref image
    case $operatingsystemrelease {
        "9.2.0": {
            # This version goes along with the setup-configuration.sh file
            # which is executed for 10.5 mac build machines. Anytime this file
            # is modified the version in it, and here, must be bumped.
            $config_version = "0.3"
            $platform_uuid = inline_template("<%= macaddress.gsub(/:/, '') %>")

            package {
                "xcode_3.1.dmg":
                    provider => pkgdmg,
                    ensure => installed,
                    source => "${platform_httproot}/DMGs/xcode_3.1.dmg",
                    require => Exec["setup-configuration"];
                "chud_4.5.0.dmg":
                    provider => pkgdmg,
                    ensure => installed,
                    source => "${platform_httproot}/DMGs/chud_4.5.0.dmg",
                    require => Exec["setup-configuration"];
                "MacPorts-1.7.1-10.5-Leopard.dmg":
                    provider => pkgdmg,
                    ensure => installed,
                    # this package does not install cleanly so it never creates the file
                    # telling pkgdmg that it was installed. So, we call a helper script
                    # that touches the file if it is already installed, thus preventing
                    # this installation from attempting every time
                    require => Exec["check-for-macports"],
                    source => "${platform_httproot}/DMGs/MacPorts-1.7.1-10.5-Leopard.dmg";
            }
            install_dmg {
                "macports-updates-10.5.dmg":
                    creates => "/opt/local/var/macports/sources/rsync.macports.org/release/ports/zope/zope-zsyncer/Portfile"
            }
            file {
                "/etc/postfix/main.cf":
                    content => template("/etc/puppet/templates/main.cf.erb"),
                    owner => "root",
                    group => "wheel";
                "/etc/ntp.conf":
                    source => "${platform_fileroot}/etc/ntp.conf",
                    owner => "root",
                    group => "wheel";
                "/tools/dist/logs":
                    require => File["/tools/dist"],
                    owner => "cltbld",
                    group => "admin",
                    ensure => directory;
                "/Users/cltbld/.profile":
                    source => "${platform_fileroot}/Users/cltbld/.profile",
                    owner => "cltbld",
                    group => "staff";
                "/Library/LaunchAgents/buildbot.start.slave.plist":
                    source => "${platform_fileroot}/Library/LaunchAgents/buildbot.start.slave.plist",
                    owner => "root",
                    group => "wheel";
                "/usr/local/bin/setup-configuration.sh":
                    source => "${platform_fileroot}/usr/local/bin/setup-configuration.sh",
                    owner => "root",
                    group => "wheel";
            }
            exec {
                setup-configuration:
                    command => "/usr/local/bin/setup-configuration.sh",
                    logoutput => true,
                    creates => "/var/puppet/config-$config_version",
                    subscribe => [File["/var/puppet"], File["/usr/local/bin/setup-configuration.sh"]];
                check-for-macports:
                    command => "/bin/bash -c 'if [ -a /opt/local/bin/port ]; then /usr/bin/touch /var/db/.puppet_pkgdmg_installed_MacPorts-1.7.1-10.5-Leopard.dmg; fi'";
                macports-sqlite3:
                    creates => "/opt/local/bin/sqlite3",
                    timeout => "600",
                    require => [Package["MacPorts-1.7.1-10.5-Leopard.dmg"], Install_dmg["macports-updates-10.5.dmg"], File["/opt/local/bin"]],
                    command => "/opt/local/bin/port install sqlite3";
                macports-autoconf213:
                    creates => "/opt/local/bin/autoconf213",
                    timeout => "600",
                    require => [Package["MacPorts-1.7.1-10.5-Leopard.dmg"], Install_dmg["macports-updates-10.5.dmg"], Exec["macports-sqlite3"]],
                    command => "/opt/local/bin/port install autoconf213 && /bin/sleep 10";
                macports-cvs:
                    creates => "/opt/local/bin/cvs",
                    timeout => "600",
                    require => [Package["MacPorts-1.7.1-10.5-Leopard.dmg"], Install_dmg["macports-updates-10.5.dmg"], Exec["macports-autoconf213"]],
                    command => "/opt/local/bin/port install cvs && /bin/sleep 10";
                macports-libidl:
                    creates => "/opt/local/lib/libIDL-2.a",
                    timeout => "600",
                    require => [Package["MacPorts-1.7.1-10.5-Leopard.dmg"], Install_dmg["macports-updates-10.5.dmg"], Exec["macports-cvs"]],
                    command => "/opt/local/bin/port install libidl && /bin/sleep 10";
                macports-subversion:
                    creates => "/opt/local/bin/svn",
                    timeout => "600",
                    require => [Package["MacPorts-1.7.1-10.5-Leopard.dmg"], Install_dmg["macports-updates-10.5.dmg"], Exec["macports-libidl"]],
                    command => "/opt/local/bin/port -v install subversion && /bin/sleep 10";
                macports-wget:
                    creates => "/opt/local/bin/wget",
                    timeout => "600",
                    require => [Package["MacPorts-1.7.1-10.5-Leopard.dmg"], Install_dmg["macports-updates-10.5.dmg"], Exec["macports-subversion"]],
                    command => "/opt/local/bin/port -v install wget && /bin/sleep 10";
                restart-ntp:
                    subscribe => File["/etc/ntp.conf"],
                    refreshonly => true,
                    command => "/bin/launchctl stop org.ntp.ntpd && /bin/launchctl start org.ntp.ntpd";
            }
        }
        "10.2.0": {
            $platform_uuid = inline_template("<%= sp_platform_uuid.downcase().split(/-/)[4] %>")

            file {
                "/Users/cltbld/.profile":
                    source => "${platform_fileroot}/Users/cltbld/.profile",
                    owner => "cltbld",
                    group => "staff",
                    require => File["/Users/cltbld"];
                "/Library/LaunchAgents/buildbot.start.slave.plist":
                    source => "${platform_fileroot}/Library/LaunchAgents/buildbot.start.slave.plist",
                    owner => "root",
                    group => "wheel";
                "/Library/Ruby/Gems/1.8/gems/puppet-0.24.8/lib/puppet/provider/package/pkgdmg.rb":
                    source => "${platform_fileroot}/Library/Ruby/Gems/1.8/gems/puppet-0.24.8/lib/puppet/provider/package/pkgdmg.rb",
                    owner => "root",
                    group => "admin",
                    alias => "pkgdmg.rb";
            }
        }
    }

    # This section contains things shared by the 10.5.2 and 10.6 build ref images
    file {
        # Used to have an NFS mount here, not needed anymore.
        "/etc/fstab":
            ensure => absent;
        # this dir is a prereq for storing our trigger file in the configuration script
        "/var/puppet":
            ensure => directory,
            owner => "root",
            group => "wheel";
        "/builds":
            ensure => directory,
            owner => "root",
            group => "wheel";
        "/builds/logs":
            require => File["/builds"],
            owner => "root",
            group => "admin",
            ensure => directory;
        "/opt/local/bin/autoconf-2.13":
            ensure => "/opt/local/bin/autoconf213",
            require => File["/opt/local/bin"];
        "/usr/local/nagios/etc/nrpe.plist":
            source => "${platform_fileroot}/usr/local/nagios/etc/nrpe.plist",
            owner => "root",
            group => "wheel";
        "/usr/local/nagios/etc/nrpe.cfg":
            source => "${platform_fileroot}/usr/local/nagios/etc/nrpe.cfg",
            owner => "root",
            group => "wheel",
            require => [File["/usr/local/nagios/etc/nrpe.plist"], Install_dmg["nrpe-i386.dmg"]];
        "/usr/local/nagios-i386":
            ensure => "nagios",
            owner => "root",
            group => "wheel";
        "/opt":
            ensure => directory,
            owner => "root",
            group => "admin";
        "/opt/local":
            require => File["/opt"],
            owner => "root",
            group => "admin",
            ensure => directory;
        ["/opt/local/bin","/opt/local/var","/opt/local/lib"]:
            require => File["/opt/local"],
            owner => "root",
            group => "admin",
            ensure => directory;
        "/Users/cltbld":
            ensure => directory,
            owner => "cltbld",
            group => "staff";
        "/usr/local/bin/sleep-and-run-puppet.sh":
            source => "${platform_fileroot}/usr/local/bin/sleep-and-run-puppet.sh",
            owner => "root",
            group => "wheel",
            mode  => 644;
        "/usr/local/bin/buildbot-tac":
            source => "${platform_fileroot}/usr/local/bin/buildbot-tac",
            owner => "root",
            group => "wheel",
            mode  => 755;
        "/Library/LaunchAgents/buildbot-tac.generator.com.plist":
            source => "${platform_fileroot}/Library/LaunchAgents/buildbot-tac.generator.com.plist",
            owner => "root",
            group => "wheel";
        "/Users/cltbld/bin":
            owner => "cltbld",
            group => "staff",
            mode => 755,
            ensure => "directory";
        "/Users/cltbld/bin/chown_root":
            owner => "root",
            group => "staff",
            mode => "4755",
            require => File['/Users/cltbld/bin'],
            source => "${platform_fileroot}/Users/cltbld/bin/chown_root";
        "/Users/cltbld/bin/chown_revert":
            owner => "root",
            group => "staff",
            mode => "4755",
            require => File['/Users/cltbld/bin'],
            source => "${platform_fileroot}/Users/cltbld/bin/chown_revert";
        "/usr/local/bin/setup-nagios-user.sh":
            owner => "root",
            group => "staff",
            source => "${platform_fileroot}/usr/local/bin/setup-nagios-user.sh";
        "/usr/local/bin/check-for-package.sh":
            owner => "root",
            group => "staff",
            mode  => 755,
            source => "${platform_fileroot}/usr/local/bin/check-for-package.sh";
        "${home}/cltbld/.ssh":
            owner => "cltbld",
            group => "staff",
            mode => 700,
            ensure => directory;
        "${home}/cltbld/.ssh/config":
            owner => "cltbld",
            group => "staff",
            mode => 600,
            source => "${local_fileroot}${home}/cltbld/.ssh/config";
        "${home}/cltbld/.ssh/known_hosts":
            owner => "cltbld",
            group => "staff",
            mode => 644,
            source => "${local_fileroot}${home}/cltbld/.ssh/known_hosts";
    }

    # This section contains items that need tweaking post-refimage install
    file {
        "/Users/cltbld/Library/Preferences/ByHost/com.apple.screensaver.${platform_uuid}.plist":
            owner => "cltbld",
            group => "staff",
            source => "${platform_fileroot}/Users/cltbld/Library/Preferences/ByHost/com.apple.screensaver.PLATFORM_UUID.plist";
        "/Users/cltbld/Library/Preferences/ByHost/com.apple.windowserver.${platform_uuid}.plist":
            owner => "cltbld",
            group => "staff",
            source => "${platform_fileroot}/Users/cltbld/Library/Preferences/ByHost/com.apple.windowserver.PLATFORM_UUID.plist";
        "/Users/cltbld/Library/Preferences/com.apple.desktop.plist":
            owner => "cltbld",
            group => "staff",
            source => "${platform_fileroot}/Users/cltbld/Library/Preferences/com.apple.desktop.plist";
        "/Users/cltbld/Library/Preferences/com.apple.DownloadAssessment.plist":
            owner => "cltbld",
            group => "staff",
            source => "${platform_fileroot}/Users/cltbld/Library/Preferences/com.apple.DownloadAssessment.plist";
        "/Users/cltbld/Library/Preferences/com.apple.LaunchServices.plist":
            owner => "cltbld",
            group => "staff",
            source => "${platform_fileroot}/Users/cltbld/Library/Preferences/com.apple.LaunchServices.plist";
        "/Library/Preferences/com.apple.VNCSettings.txt":
            owner => "root",
            group => "admin",
            mode => 600,
            source => "${platform_fileroot}/Library/Preferences/com.apple.VNCSettings.txt";
    }

    exec { 
        restart-buildbot-tac:
            subscribe => File["/Library/LaunchAgents/buildbot-tac.generator.com.plist"],
            refreshonly => true,
            command => "/bin/launchctl unload -w /Library/LaunchAgents/buildbot-tac.generator.com.plist && /bin/launchctl load -w /Library/LaunchAgents/buildbot-tac.generator.com.plist",
            require => [File["/usr/local/bin/buildbot-tac"], File["/Library/LaunchAgents/buildbot-tac.generator.com.plist"]];
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
    install_dmg {
        "nrpe-i386.dmg":
            creates => "/usr/local/nagios-i386/sbin/nrpe";
        "yasm-1.0.1.dmg":
            creates => "/usr/local/bin/yasm";
    }
}
