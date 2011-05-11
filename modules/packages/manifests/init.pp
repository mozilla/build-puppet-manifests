class packages {
    case $operatingsystem {
        CentOS: {
            file {  
                "/usr/local/bin/check-for-rpm.sh":
                    source => "puppet:///packages/check-for-rpm.sh",
                    mode => 755;
            }
        }
        default: { fail("Unsupported operating system: $operatingsystem") }
    }
}
