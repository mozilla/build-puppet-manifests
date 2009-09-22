# osx.pp

class osx {

      # version of the setup-configuration file (must match!!)
      $config_version = "0.3"

      package { "xcode_3.1.dmg":
        provider => pkgdmg,
        ensure => installed,
        source => "http://192.168.31.131/darwin9/dist/xcode_3.1.dmg",
        require => [file["/etc/fstab"], exec["setup-configuration"]];

        "chud_4.5.0.dmg":
          provider => pkgdmg,
          ensure => installed,
          source => "http://192.168.31.131/darwin9/dist/chud_4.5.0.dmg",
          require => [file["/etc/fstab"], exec["setup-configuration"]];

        "MacPorts-1.7.1-10.5-Leopard.dmg":
          provider => pkgdmg,
          ensure => installed,
          # this package does not install cleanly so it never creates the file
          # telling pkgdmg that it was installed. So, we call a helper script
          # that touches the file if it is already installed, thus preventing
          # this installation from attempting every time
          require => [exec["check-for-macports"], file["/etc/fstab"]],
          source => "http://192.168.31.131/darwin9/dist/MacPorts-1.7.1-10.5-Leopard.dmg";
      }

      file {
        # this dir is a prereq for storing our trigger file in the configuration script
        "/var/puppet":
          ensure => directory;
        "/N":
          ensure => directory;
        "/etc/auto_master":
          require => file["/N"],
#          notify => exec["refresh-automount"],
          owner  => "root",
          group  => "wheel",
          source => "${fileroot}darwin9/etc/auto_master";
        "/etc/postfix/main.cf":
          content => template("/etc/puppet/templates/main.cf.erb");
        "/etc/ntp.conf":
          source => "${fileroot}darwin9/etc/ntp.conf",
          owner => "root",
          group => "wheel",
          require => file["/etc/fstab"];    
        "/tools/dist/logs":
          require => file["/tools/dist"],
          ensure => directory;
        "/builds":
          ensure => directory;
        "/builds/logs":
          require => file["/builds"],
          ensure => directory;
        "/opt/local/bin/autoconf-2.13":
          ensure => "/opt/local/bin/autoconf213",
          require => file["/opt/local/bin"];
        "/Library/LaunchAgents/buildbot.start.slave.plist":
          source => "${fileroot}darwin9/buildbot.start.slave.plist",
          owner => "root",
          group => "wheel",
          require => file["/etc/fstab"];    
        "/opt":
          ensure => directory;
        "/opt/local":
          require => file["/opt"],
          ensure => directory;
        ["/opt/local/bin","/opt/local/var","/opt/local/lib"]:
          require => file["/opt/local"],
          ensure => directory;
        "/Users/cltbld":
          ensure => directory,
          owner => "cltbld",
          group => "staff";
        "/Users/cltbld/.profile":
          source => "${fileroot}darwin9/.profile",
          owner => "cltbld",
          group => "staff",
          require => file["/Users/cltbld"];
      }
      
    exec { 
        refresh-automount:
            command => "/usr/sbin/automount -vc",
            subscribe => file["/etc/auto_master"];
        mount-nfs:
            command => "/sbin/mount /N && /bin/sleep 10",
            creates => "/N/darwin9",
            subscribe => file["/etc/fstab"],
            require => [file["/etc/fstab"], file["/etc/auto_master"]];
        setup-configuration:
            command => "/N/darwin9/setup-configuration.sh",
            logoutput => true,
            creates => "/var/puppet/config-$config_version",
            subscribe => [file["/var/puppet"], file["/etc/fstab"]];
        check-for-macports:
            command => "/bin/bash -c 'if [ -a /opt/local/bin/port ]; then /usr/bin/touch /var/db/.puppet_pkgdmg_installed_MacPorts-1.7.1-10.5-Leopard.dmg; fi'";
        install-macports-repo:
            creates => "/opt/local/var/macports/sources/rsync.macports.org/release/ports/zope/zope-zsyncer/Portfile",
            command => "/usr/bin/tar -xjf /N/darwin9/dist/macports-updates-10.5.tar.bz2 -C /opt/local/var/macports && /opt/local/bin/port info wget",
            timeout => "600",
            require => [file["/etc/fstab"], file["/opt/local/var"], package["MacPorts-1.7.1-10.5-Leopard.dmg"]];
        macports-sqlite3:
            creates => "/opt/local/bin/sqlite3",
            timeout => "600",
            require => [package["MacPorts-1.7.1-10.5-Leopard.dmg"], exec["install-macports-repo"], file["/opt/local/bin"]],
            command => "/opt/local/bin/port install sqlite3";
        macports-autoconf213:
            creates => "/opt/local/bin/autoconf213",
            timeout => "600",
            require => [package["MacPorts-1.7.1-10.5-Leopard.dmg"], exec["install-macports-repo"], exec["macports-sqlite3"]],
            command => "/opt/local/bin/port install autoconf213 && /bin/sleep 10";
        macports-cvs:
            creates => "/opt/local/bin/cvs",
            timeout => "600",
            require => [package["MacPorts-1.7.1-10.5-Leopard.dmg"], exec["install-macports-repo"], exec["macports-autoconf213"]],
            command => "/opt/local/bin/port install cvs && /bin/sleep 10";
        macports-libidl:
            creates => "/opt/local/lib/libIDL-2.a",
            timeout => "600",
            require => [package["MacPorts-1.7.1-10.5-Leopard.dmg"], exec["install-macports-repo"], exec["macports-cvs"]],
            command => "/opt/local/bin/port install libidl && /bin/sleep 10";
        macports-subversion:
            creates => "/opt/local/bin/svn",
            timeout => "600",
            require => [package["MacPorts-1.7.1-10.5-Leopard.dmg"], exec["install-macports-repo"], exec["macports-libidl"]],
            command => "/opt/local/bin/port -v install subversion && /bin/sleep 10";
        macports-wget:
            creates => "/opt/local/bin/wget",
            timeout => "600",
            require => [package["MacPorts-1.7.1-10.5-Leopard.dmg"], exec["install-macports-repo"], exec["macports-subversion"]],
            command => "/opt/local/bin/port -v install wget && /bin/sleep 10";
        restart-ntp:
            subscribe => file["/etc/ntp.conf"],
            refreshonly => true,
            command => "/bin/launchctl stop org.ntp.ntpd && /bin/launchctl start org.ntp.ntpd",
            require => file["/etc/fstab"];
        setup-nagios-user:
            creates => "/var/db/.puppet_nagios_user_setup",
            command => "/N/darwin9/setup-nagios-user.sh",
            require => file["/etc/fstab"];    
        setup-nrpe:
            creates => "/usr/local/nagios",
            require => [exec["setup-nagios-user"], file["/etc/fstab"]],
            command => "/usr/bin/tar -vxzf /N/darwin9/dist/nrpe-darwin-i386.tar.gz -C /usr/local",
            require => [file["/etc/fstab"], exec["mount-nfs"]];
        enable-nrpe:
            command => "/usr/local/nagios/sbin/enablenrpe",
            subscribe => exec["setup-nrpe"];
    }
}
