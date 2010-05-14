# talos_osx.pp

class talos_osx {
    $pythonpath = "/Library/Python/2.5/site-packages"

    ## Initialize the parameters for each platform
    case $operatingsystemrelease {
        "9.8.0": {
            $platform = "darwin9"
            $mercurialVersion = "1.2.1"
        }
        "10.2.0": {
            $platform = "darwin10"
            $mercurialVersion = "1.3.1"
        }
    }

    install_package {
        "mercurial-${mercurialVersion}.dmg":
            creates => "/Library/Python/2.5/site-packages/mercurial/verify.py",
            alias   => "mercurial";
    }

    file {
        "/usr/local/bin/hg":
            mode   => 755,
            source => "${platform_fileroot}/usr/local/bin/hg";
    }

    # get .bash_profile in place for Snow Leopard
    case $operatingsystemrelease {
       # Snow Leopard
       "10.2.0": {
           file {
               "/Users/cltbld/bin/python":
                   ensure => "/usr/bin/python2.5",
                   alias  => "create_python_symlink";
               "/Users/cltbld/bin":
                   ensure => "directory",
                   alias  => "create_bin_directory",
                   before => File["create_python_symlink"];
               "/Users/cltbld/.bash_profile":
                   source => "${platform_fileroot}/Users/cltbld/.bash_profile",
                   alias  => "get_profile";
                "/Library/Ruby/Gems/1.8/gems/puppet-0.24.8/lib/puppet/provider/package/pkgdmg.rb":
                    source => "${platform_fileroot}/Library/Ruby/Gems/1.8/gems/puppet-0.24.8/lib/puppet/provider/package/pkgdmg.rb",
                    owner => "root",
                    group => "admin";
           }
       }
    }
}
