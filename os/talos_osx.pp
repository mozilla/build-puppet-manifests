# talos_osx.pp

class talos_osx {
    ## Initialize the parameters for each platform
    case $operatingsystemrelease {
        "9.8.0": {
            $mercurialVersion = "1.2.1"
        }
        "10.2.0", "10.6.0": {
            $mercurialVersion = "1.3.1"
        }
    }

    install_dmg {
        "mercurial-${mercurialVersion}.dmg":
            creates => "/Library/Python/2.5/site-packages/mercurial/verify.py",
            alias   => "mercurial";
    }

    file {
        # Used to have an NFS mount here, not needed anymore.
        "/etc/fstab":
            ensure => absent;
        "/usr/local/bin/hg":
            owner => "root",
            group => "staff",
            mode   => 755,
            source => "${platform_fileroot}/usr/local/bin/hg";
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
        # Manage screen resolution
        "/Library/LaunchAgents/cscreen.resize.plist":
            owner => "root",
            group => "wheel",
            mode => 644,
            require => File["/Users/cltbld/cscreen"],
            source => "${platform_fileroot}/Library/LaunchAgents/cscreen.resize.plist";
        "/Users/cltbld/cscreen":
            owner => "cltbld",
            group => "staff",
            mode => 755,
            source => "${platform_fileroot}/Users/cltbld/cscreen";
        # Manage Dock position and others
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
        "${home}/cltbld/.ssh/authorized_keys":
            owner => "cltbld",
            group => "staff",
            mode => 644,
            source => "${platform_fileroot}${home}/cltbld/.ssh/authorized_keys";

        # this directory is referenced by the apache configs, and must exist
        "${home}/cltbld/talos-slave/talos-data":
            ensure => directory,
            owner => "cltbld",
            group => "staff",
            mode => 775;
    }

    exec {
        disable-indexing:
            command => "/usr/bin/mdutil -a -i off";
        remove-index:
            command => "/usr/bin/mdutil -a -E";
    }

    # get .bash_profile in place for Snow Leopard
    case $operatingsystemrelease {
       # Snow Leopard
       "10.2.0", "10.6.0": {
           file {
               "/Users/cltbld/bin/python":
                   ensure => "/usr/bin/python2.5",
                   owner  => "root",
                   group  => "staff",
                   alias  => "create_python_symlink";
               "/Users/cltbld/bin":
                   ensure => "directory",
                   owner  => "cltbld",
                   group  => "staff",
                   alias  => "create_bin_directory",
                   before => File["create_python_symlink"];
               "/Users/cltbld/.bash_profile":
                   source => "${platform_fileroot}/Users/cltbld/.bash_profile",
                   owner  => "root",
                   group  => "wheel";
                "/Library/Ruby/Gems/1.8/gems/puppet-0.24.8/lib/puppet/provider/package/pkgdmg.rb":
                    source => "${platform_fileroot}/Library/Ruby/Gems/1.8/gems/puppet-0.24.8/lib/puppet/provider/package/pkgdmg.rb",
                    owner => "root",
                    group => "admin",
                    alias => "pkgdmg.rb";
           }
       }
    }

    # disable bluetooth
    case $operatingsystemrelease {
        "9.8.0": {
            file {
                "/Library/Preferences/com.apple.Bluetooth.plist":
                    owner => "root",
                    group => "admin",
                    mode => 644,
                    source => "${platform_fileroot}/Library/Preferences/com.apple.Bluetooth.plist";
            }
        }
    }

    # The name of this service became 'blued' somewhere between 9.2.0 and
    # 9.8.0, but since we don't have any 9.2.0 talos slaves, we can just call
    # it blued.
    service {
        "com.apple.blued":
            ensure => "stopped",
            enable => false;
    }

    include buildslave::install
    include buildslave::startup
    include buildslave::cleanup
    include boot
}
