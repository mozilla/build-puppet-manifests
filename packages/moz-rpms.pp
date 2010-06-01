# moz-rpms.pp
# moz-rpms rpm packages

class moz-rpms {
    Package{ provider => rpm, ensure => installed }

    case $hardwaremodel {
        "x86_64": {
            $rpm_arch = "x86_64"
        }
        default: {
            $rpm_arch = "i386"
        }
    }
    package {
        "yasm":
            source => "${platform_httproot}/RPMs/yasm-1.0.1-1.$rpm_arch.rpm";
        "ccache":
            source => "${platform_httproot}/RPMs/ccache-2.4-99.11.$rpm_arch.rpm";
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
