# repackaging-tools.pp
#  this manifest installs all of the packages required for repackaging builds

# Our repackaging is currently done on Darwin machines (Darwin9 or Darwin10)

class packages::repackaging-tools {
    file {
        "/usr/local/bin":
            ensure => directory,
            mode => 755;
    }

    case $operatingsystem {
        Darwin: {
            case $operatingsystemrelease {
                # 10.5 build machines only.
                "9.2.0": {
                    install_dmg { 
                        "repackaging-tools-10.5.dmg":
                            creates	=> "/usr/local/bin/upx",
                    }
                    file {
                        "/usr/local/bin/7z":
                            owner   => "root",
                            group   => "wheel",
                            ensure  => "/usr/local/bin/7za";
                    }
                }
                # 10.6 build machines only
                "10.2.0": {
                    install_dmg { 
                        "repackaging-tools-10.6.dmg":
                            creates     => "/usr/local/bin/upx",
                    }
                    file {
                        "/usr/local/bin/7z":
                            owner   => "root",
                            group   => "wheel",
                            ensure  => "/usr/local/bin/7za";
                    }
                }
            }
        }
    }
}

