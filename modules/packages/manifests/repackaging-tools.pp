# repackaging-tools.pp
#  this manifest installs all of the packages required for repackaging builds

# Our repackaging is currently done on Darwin machines (Darwin9 or Darwin10)
# repackaging-tools-X.dmg is a dmg+pkg file that contains (versions are for Darwin10):
#   -7za/7z version 9.13 Beta
#   -upx version 3.05
#   -pkg-dmg -- unknown version or source, SHA1(pkg-dmg)= 3a2fc3c0d52eb1296a3c1017beaee510874f34c3

class packages::repackaging-tools {
    case $operatingsystem {
        Darwin: {
            case $macosx_productversion_major {
                "10.7": {
                    file {
                        "/usr/local/bin/upx":
                            source => "${platform_fileroot}/usr/local/bin/upx",
                            owner => root,
                            group => wheel,
                            mode => 755;
                        "/usr/local/bin/pkg-dmg":
                            source => "${platform_fileroot}/usr/local/bin/pkg-dmg",
                            owner => root,
                            group => wheel,
                            mode => 755;
                    }
                }
                "10.6": {
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
                "10.5": {
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
            }
        }
    }
}

