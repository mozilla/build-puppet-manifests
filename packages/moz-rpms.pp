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
            source => "${platform_httproot}/RPMs/yasm-1.1.0-1.$rpm_arch.rpm",
            ensure => latest;
        "ccache":
            source => "${platform_httproot}/RPMs/ccache-3.0.1-99.11.$rpm_arch.rpm",
            ensure => latest;
    }
    install_rpm {
        "valgrind":
            version => "3.6.0-1",
            creates => "/usr/bin/valgrind";
        "valgrind-devel":
            version => "3.6.0-1",
            creates => "/usr/include/valgrind/valgrind.h",
            require => Install_rpm["valgrind"];
    }
    exec {
        "/usr/bin/ccache -M 2G":
            environment => ["CCACHE_DIR=/builds/ccache", "CCACHE_COMPRESS=1"],
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
