# osx_lion.pp


class osx_lion {
    package {
        # Note that XCode 4 cannot be installed by the package resource type
        # There is an exec that verifies that the correct version is installed
        "wget-1.10.2.dmg":
            provider => pkgdmg,
            ensure => installed,
            source => "${platform_httproot}/DMGs/wget-1.10.2.dmg";
        "mercurial-2.0.2.dmg":
            provider => pkgdmg,
            ensure => installed,
            source => "${platform_httproot}/DMGs/mercurial-2.0.2.dmg";
        "buildbot-master-0.8.5.dmg":
            provider => pkgdmg,
            ensure => installed,
            source => "${platform_httproot}/DMGs/buildbot-master-0.8.5.dmg";
        "yasm-1.1.0.dmg":
            provider => pkgdmg,
            ensure => installed,
            source => "${platform_httproot}/DMGs/yasm-1.1.0.dmg";
        "autoconf-2.13.dmg":
            provider => pkgdmg,
            ensure => installed,
            source => "${platform_httproot}/DMGs/autoconf-2.13.dmg";
        "screenresolution-1.5.dmg":
            provider => pkgdmg,
            ensure => installed,
            source => "${platform_httproot}/DMGs/screenresolution-1.5.dmg";
        "p7zip-9.20.1.dmg":
            provider => pkgdmg,
            ensure => installed,
            source => "${platform_httproot}/DMGs/p7zip-9.20.1.dmg";
        "ccache-3.1.7.dmg":
            provider => pkgdmg,
            ensure => installed,
            source => "${platform_httproot}/DMGs/ccache-3.1.7.dmg";
    }

    file {
        "/usr/local/bin/autoconf-2.13": # Satisfy l10n, which calls 'autoconf-2.13'
            ensure => "/usr/local/bin/autoconf213";
        ["/builds/hg-shared", "/builds/slave", "/builds/ccache"]:
            ensure => directory,
            mode    => 755,
            owner   => cltbld,
            group   => admin;
        ["/builds", "/builds/logs"]:
            ensure => directory,
            owner => "root",
            group => "wheel";
        "/etc/sudoers":
            source => "${platform_fileroot}/etc/sudoers",
            owner => "root",
            group => "wheel",
            mode => 440;
        "/usr/local/bin/disable-screensaver.sh":
            source => "${platform_fileroot}/usr/local/bin/disable-screensaver.sh",
            owner => "root",
            group => "staff",
            mode => 755;
        "/Library/Ruby/Gems/1.8/gems/puppet-0.24.8/lib/puppet/provider/package/pkgdmg.rb":
            source => "${platform_fileroot}/Library/Ruby/Gems/1.8/gems/puppet-0.24.8/lib/puppet/provider/package/pkgdmg.rb",
            owner => "root",
            group => "admin",
            alias => "pkgdmg.rb";
        "/etc/ScreenSharing.launchd":
            ensure => "present";
        "/usr/local/bin/blueutil":
            source => "${platform_fileroot}/usr/local/bin/blueutil",
            owner => "root",
            group => "staff",
            mode => 755;
        ["/usr/local", "/usr/local/bin", "/usr/local/etc",
         "/usr/local/lib", "/usr/local/libexec", "/usr/local/share",
         "/usr/local/var", "/usr/local/include", "/usr/local/info"]:
            ensure => directory,
            owner => "root",
            group => "wheel",
            mode => 755;
        "/usr/local/bin/check-for-package.sh":
            owner => "root",
            group => "staff",
            mode  => 755,
            source => "${platform_fileroot}/usr/local/bin/check-for-package.sh";
        "/usr/local/bin/run-puppet.sh":
            owner => "root",
            group => "wheel",
            mode  => 755,
            source => "${platform_fileroot}/usr/local/bin/run-puppet.sh";
        "/Users/cltbld/Library/Preferences/com.apple.DownloadAssessment.plist":
            owner => "cltbld",
            group => "staff",
            source => "${platform_fileroot}/Users/cltbld/Library/Preferences/com.apple.DownloadAssessment.plist";
        "/Users/cltbld/Library/Preferences/com.apple.LaunchServices.plist":
            owner => "cltbld",
            group => "staff",
            source => "${platform_fileroot}/Users/cltbld/Library/Preferences/com.apple.LaunchServices.plist";
        "/Users/cltbld/Library/Preferences/com.apple.dock.plist":
            owner => "cltbld",
            group => "staff",
            mode => 644,
            source => "${platform_fileroot}/Users/cltbld/Library/Preferences/com.apple.dock.plist";
        "${home}/cltbld/.ssh":
            owner => "cltbld",
            group => "staff",
            mode => 700,
            ensure => directory;
        "${home}/cltbld/.ssh/config":
            owner => "cltbld",
            group => "staff",
            mode => 600,
            source => "${platform_fileroot}${home}/cltbld/.ssh/config";
        "${home}/cltbld/.ssh/known_hosts":
            owner => "cltbld",
            group => "staff",
            mode => 644,
            source => "${platform_fileroot}${home}/cltbld/.ssh/known_hosts";
        "${home}/cltbld/.ssh/authorized_keys":
            owner => "cltbld",
            group => "staff",
            mode => 644,
            source => "${platform_fileroot}${home}/cltbld/.ssh/authorized_keys";
        "/var/log/screensaver":
            owner => "cltbld",
            group => "staff",
            mode => 644,
            ensure => present;
        "${home}/cltbld/bin/":
            ensure => "directory",
            owner => "root",
            group => "staff";
        "${home}/cltbld/bin/chown_root":
            owner => "root",
            group => "staff",
            mode => "4755",
            require => File['/Users/cltbld/bin'],
            source => "${platform_fileroot}/${home}/cltbld/bin/chown_root";
        "${home}/cltbld/bin/chown_revert":
            owner => "root",
            group => "staff",
            mode => "4755",
            require => File['/Users/cltbld/bin'],
            source => "${platform_fileroot}/${home}/cltbld/bin/chown_revert";
        "${home}/cltbld/.hgrc":
            owner => "cltbld",
            group => "staff",
            mode  => "644",
            source => "${platform_fileroot}/${home}/cltbld/.hgrc";
   }

   exec {
        # See http://docs.info.apple.com/article.html?path=remotedesktop/3.0/en/ardc881.html
        "turn-off-sleep":
            command => "/usr/sbin/systemsetup -setsleep Never";
        "turn-on-auto-power":
            command => "/usr/sbin/systemsetup -setrestartpowerfailure on";
        "restart-on-panic":
            command => "/usr/sbin/systemsetup -setrestartfreeze on";
        "turn-on-wol":
            command => "/usr/sbin/systemsetup -setwakeonnetworkaccess on";
        "disable-screensaver":
            command => "/usr/bin/sudo -u cltbld /usr/local/bin/disable-screensaver.sh",
            require => File["/usr/local/bin/disable-screensaver.sh"];
        "disallow-sleep-button":
            command => "/usr/sbin/systemsetup -setallowpowerbuttontosleepcomputer off";
        "disable-updater":
            command => "/usr/sbin/softwareupdate --schedule off";
        "set-time-server":
            command => "/usr/sbin/systemsetup -setnetworktimeserver ntp1.build.mozilla.org";
        # This checks (and sets if needed) the resolution of the machine on boot
        # we are still deploying the launchagent for when the machine is loaned to
        # devs.  If you change the resolution here, please change it in
        # "${platform_fileroot}/Library/LaunchAgents/screenresolution.plist"
        # as well
        "verify-resolution":
            command => "/usr/local/bin/screenresolution set 1280x1024x32",
            unless => "/usr/local/bin/screenresolution get 2>&1 | /usr/bin/grep 'Display 0: 1280x1024x32'",
            require => Package["screenresolution-1.5.dmg"];
        # Using -w will enable the service for future boots, this command does tick the box
        # for remote-login in the Sharing prefpane (survives reboot)
        "turn-on-ssh":
            command => "/bin/launchctl load -w /System/Library/LaunchDaemons/ssh.plist",
            onlyif => "/bin/bash -xc '/bin/echo | /usr/bin/nc localhost 22 | /usr/bin/grep SSH-2.0 ; if [ $? -eq 0 ] ; then exit 1 ; else exit 0 ; fi'";
        "disable-bluetooth":
            command => "/usr/local/bin/blueutil off",
            require => File["/usr/local/bin/blueutil"];
        #Probably too late at this point, but lets get rid of them for the next reboot
        "clean-saved-state":
            command => '/bin/rm -rf /Users/cltbld/Library/Saved\ Application\ State/*.savedState';
        "disable-indexing":
            command => "/usr/bin/mdutil -a -i off";
        "remove-index":
            command => "/usr/bin/mdutil -a -E";
        # We can't install xcode through puppet, but lets ensure that
        # all build slaves have the expected version of Xcode before
        # finishing puppet
        "verify-xcode":
            command => "/usr/bin/defaults read /Developer/Library/XcodeTools Version | grep '^4.1$'";
        #increase maximum ccache size  
        "setmaxccachesize":
            command=> "/usr/local/bin/ccache -M 10G",
            environment => ["CCACHE_DIR=/builds/ccache", "CCACHE_COMPRESS=1"],
            user => "cltbld",
            require => [ Package["ccache-3.1.7.dmg"], File["/builds/ccache"]];
    }

    include buildslave::install
    include buildslave::startup
    include buildslave::cleanup
    include buildslave::purgebuilds
    include boot
}
