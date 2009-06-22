# osx.pp

class osx {

      # version of the setup-configuration file (must match!!)
      $config_version = "0.2"

      package { "xcode312_2621_developerdvd.dmg":
        provider => pkgdmg,
        ensure => installed,
        source => "/private/nfs/darwin9/dist/xcode312_2621_developerdvd.dmg";    

        "chud_4.5.0.dmg":
          provider => pkgdmg,
          ensure => installed,
          source => "/private/nfs/darwin9/dist/chud_4.5.0.dmg";

        "MacPorts-1.6.0-10.5-Leopard.dmg":
          provider => pkgdmg,
          ensure => installed,
          # this package does not install cleanly so it never creates the file
          # telling pkgdmg that it was installed. So, we call a helper script
          # that touches the file if it is already installed, thus preventing
          # this installation from attempting every time
          require => exec["check-for-macports"],
          source => "http://test-mgmt/darwin9/dist/MacPorts-1.6.0-10.5-Leopard.dmg";
      }

      file {
        # this dir is a prereq for storing our trigger file in the configuration script
        "/var/puppet":
          ensure => directory;
        "/etc/postfix/main.cf":
          content => template("/etc/puppet/templates/main.cf.erb");
        "/etc/ntp.conf":
          source => "/private/nfs/darwin9/etc/ntp.conf";
        "/tools/dist/logs":
          ensure => directory;
        "/builds/logs":
          ensure => directory;
        "/opt/local/bin/autoconf-2.13":
          ensure => "/opt/local/bin/autoconf213";
        "/Library/LaunchAgents/buildbot.start.slave.plist":
          source => "/private/nfs/darwin9/buildbot.start.slave.plist",
          owner => "root",
          group => "wheel";
      }
      
    exec { 
        setup-configuration:
            command => "/private/nfs/darwin9/setup-configuration.sh",
            logoutput => true,
            creates => "/var/puppet/config-$config_version",
            subscribe => file["/var/puppet"];
        check-for-macports:
            command => "/bin/bash -c 'if [ -a /opt/local/bin/port ]; then /usr/bin/touch /var/db/.puppet_pkgdmg_installed_MacPorts-1.6.0-10.5-Leopard.dmg; fi'";
        install-macports-repo:
            creates => "/opt/local/var/macports/distfiles/.turd_MacPorts",
            command => "/usr/bin/tar -xjf /private/nfs/darwin9/dist/macports-10.5.tar.bz2 -C /opt/local/var/macports";
        macports-sqlite3:
            creates => "/opt/local/bin/sqlite3",
            command => "/opt/local/bin/port install sqlite3";
        macports-autoconf213:
            creates => "/opt/local/bin/autoconf213",
            command => "/opt/local/bin/port install autoconf213";
        macports-cvs:
            creates => "/opt/local/bin/cvs",
            command => "/opt/local/bin/port install cvs";
        macports-libidl:
            creates => "/opt/local/lib/libIDL-2.a",
            command => "/opt/local/bin/port install libidl";
        macports-subversion:
            creates => "/opt/local/bin/svn",
            command => "/opt/local/bin/port install subversion";
        macports-wget:
            creates => "/opt/local/bin/wget",
            command => "/opt/local/bin/port install wget";
        restart-ntp:
            subscribe => file["/etc/ntp.conf"],
            refreshonly => true,
            command => "/usr/bin/killall -2 ntpd";
        setup-nagios-user:
            creates => "/var/db/.puppet_nagios_user_setup",
            command => "/private/nfs/darwin9/setup-nagios-user.sh";
        setup-nrpe:
            creates => "/usr/local/nagios",
            require => exec["setup-nagios-user"],
            command => "/usr/bin/tar -xzf /private/nfs/darwin9/dist/nrpe-darwin-i386.tar.gz -C /usr/local";
        enable-nrpe:
            command => "/usr/local/nagios/sbin/enablenrpe",
            subscribe => exec["setup-nrpe"];
    }
}
