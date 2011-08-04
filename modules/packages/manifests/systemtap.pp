class packages::systemtap {
    Package{ provider => rpm, ensure => installed }

    case $hardwaremodel {
        x86_64: {
            package {
                "systemtap-sdt-devel":
                    source => "${platform_httproot}/RPMs/systemtap-sdt-devel-1.6-1moz1.x86_64.rpm";
            }
        }

        default: {
            package {
                "systemtap-sdt-devel":
                    source => "${platform_httproot}/RPMs/systemtap-sdt-devel-1.6-1moz1.i386.rpm";
            }
        }
    }
}

