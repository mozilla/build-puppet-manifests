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

    exec {
        "mercurial":
            command   => "/usr/bin/tar -xzf /N/talos/mac/${platform}/mercurial-${mercurialVersion}.tar.gz",
            cwd       => $pythonpath,
            creates   => "${pythonpath}/mercurial";
    }

    file {
        "/usr/local/bin/hg":
            mode   => 755,
            source => "/N/talos/mac/hg";
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
                   source => "/N/talos/mac/${platform}/.bash_profile",
                   alias  => "get_profile";
           }
       }
    }
}
