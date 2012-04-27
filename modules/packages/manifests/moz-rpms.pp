# moz-rpms.pp
# moz-rpms rpm packages

class packages::moz-rpms {
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
    packages::install_rpm {
        "valgrind":
            version => "3.6.0-1",
            creates => "/usr/bin/valgrind",
            # Required because some machines have valgrind-3.2.1 installed
            # twice somehow!  This can go away the next time we do a valgrind
            # upgrade
            require => Exec["check-valgrind-rpms"];
        "valgrind-devel":
            version => "3.6.0-1",
            creates => "/usr/include/valgrind/valgrind.h",
            require => Packages::Install_rpm["valgrind"];
    }
    exec {
        "/usr/bin/ccache -M 10G":
            environment => ["CCACHE_DIR=/builds/ccache", "CCACHE_COMPRESS=1"],
            user => "cltbld",
            group => "cltbld",
            require => [Package["ccache"], File["/builds/ccache"]];
        check-valgrind-rpms:
            command => "/bin/rpm -e --allmatches valgrind",
            onlyif => "/bin/rpm -qv valgrind | /bin/grep -q 3.2.1";
    }
    file {
        "/builds/ccache":
            owner => "cltbld",
            group => "cltbld",
            ensure => directory;
            # this requires Mount["/builds"] on some machines, and File["/builds"] on
            # others, so for now just hope it's there
            # require => Mount["/builds"];
    }
}
