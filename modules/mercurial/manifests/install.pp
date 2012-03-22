class mercurial::install {
    case $operatingsystem {
        CentOS: {
            packages::hg {
                "latest":
            }
        }
        Darwin: {
            $version = "2.0.2"
            case $macosx_productversion_major {
                "10.6": {
                    package {
                        "mercurial-${version}.dmg":
                            ensure => installed,
                            provider => pkgdmg,
                            source => "${httproot}/Darwin10/mercurial-${version}.dmg",
                            alias => "mercurial";
                    }
                    file {
                        "/usr/bin/hg":
                            ensure => "/usr/local/bin/hg",
                            require => Package["mercurial"];
                    }
                }
            }
        }
    }
}
