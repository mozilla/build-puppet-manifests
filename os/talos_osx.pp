# talos_osx.pp

class talos_osx {
    $pythonpath = "/Library/Python/2.5/site-packages"

    ## Initialize the parameters for each platform
    case $operatingsystemrelease {
        "9.8.0": {
            $mercurialVersion = "1.2.1"
            $buildbotversion = "0.8.0"
        }
        "10.2.0": {
            $mercurialVersion = "1.3.1"
            $buildbotversion = "0.8.0"
        }
    }

    install_dmg {
        "mercurial-${mercurialVersion}.dmg":
            creates => "/Library/Python/2.5/site-packages/mercurial/verify.py",
            alias   => "mercurial";
        "buildbot-${buildbotversion}.dmg":
            creates => "/tools/buildbot-0.8.0/bin/buildbot";
    }

    file {
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
        "/Library/LaunchAgents/buildbot.start.talos.slave.plist":
            owner => "root",
            group => "wheel",
            mode => 644,
            source => "${platform_fileroot}/Library/LaunchAgents/buildbot.start.talos.slave.plist";
        "/usr/local/bin/run-puppet.sh":
            owner => "root",
            group => "wheel",
            mode  => 755,
            source => "${platform_fileroot}/usr/local/bin/run-puppet.sh";
        "/Users/cltbld/Library/Preferences/com.apple.DownloadAssessment.plist":
            owner => "cltbld",
            group => "staff",
            source => "${platform_fileroot}/Users/cltbld/Library/Preferences/com.apple.DownloadAssessment.plist";
    }

    # get .bash_profile in place for Snow Leopard
    case $operatingsystemrelease {
       # Snow Leopard
       "10.2.0": {
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
}
