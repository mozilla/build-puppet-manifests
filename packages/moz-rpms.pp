# moz-rpms.pp
# moz-rpms rpm packages

class moz-rpms {
    Package{ provider => rpm, ensure => installed }

    case $hardwaremodel {
        "x86_64": {
        }
        default: {
            package {
                "ccache":
                    source => "${platform_httproot}/RPMs/ccache-2.4-99.11.i386.rpm";
            }
            exec {
                "/usr/bin/ccache -M 2G":
                    environment => ["CCACHE_DIR=/builds/ccache"],
                    refreshonly => true,
                    user => "cltbld",
                    group => "cltbld",
                    subscribe => File["/builds/ccache"],
                    require => Package["ccache"];
            }
            file {
                "/builds/ccache":
                    owner => "cltbld",
                    group => "cltbld",
                    ensure => directory,
                    require => Mount["/builds"];
            }
        }
    }
}
