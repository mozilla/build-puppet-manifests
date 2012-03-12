class packages::alsa {
    Package{ provider => rpm, ensure => installed }

    case $hardwaremodel {
        x86_64: {
            exec {
                "upgrade-alsa-packages":
                    command => "/bin/rpm -U ${platform_httproot}/RPMs/alsa-lib-1.0.17-1.el5.i386.rpm ${platform_httproot}/RPMs/alsa-lib-1.0.17-1.el5.x86_64.rpm ${platform_httproot}/RPMs/alsa-lib-devel-1.0.17-1.el5.i386.rpm ${platform_httproot}/RPMs/alsa-lib-devel-1.0.17-1.el5.x86_64.rpm ${platform_httproot}/RPMs/alsa-utils-1.0.17-1.el5.x86_64.rpm",
                    creates => "/usr/share/doc/alsa-lib-1.0.17";
            }
        }

        default: {
            exec {
                "upgrade-alsa-packages":
                    command => "/bin/rpm -U ${platform_httproot}/RPMs/alsa-lib-1.0.17-1.el5.i386.rpm ${platform_httproot}/RPMs/alsa-lib-devel-1.0.17-1.el5.i386.rpm",
                    creates => "/usr/share/doc/alsa-lib-1.0.17";
            }
            package {
                "alsa-utils":
                    source => "${platform_httproot}/RPMs/alsa-utils-1.0.17-1.el5.i386.rpm",
                    ensure => "1.0.17-1.el5",
                    require => Exec["upgrade-alsa-packages"];
            }
        }
    }
}
