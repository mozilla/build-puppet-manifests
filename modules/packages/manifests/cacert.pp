# cacert.pp
# this manifest installs cacert.pem and places it in /opt/local/etc/wgetrc

# This is for Darwin machines only

class packages::cacert {
    case $operatingsystem {
        Darwin: {
            case $macosx_productversion_major {
                "10.7": {
                     file {
                        "/etc/cacert.pem":
                            source => "${platform_fileroot}/etc/cacert.pem",
                            owner => "root",
                            group => "admin";
                        "/etc/wgetrc":
                            source => "${platform_fileroot}/etc/wgetrc",
                            owner => "root",
                            group => "admin";
                    }
        
                }
                default: {
                    file {
                        "/opt/local/etc/cacert.pem":
                            source => "${platform_fileroot}/opt/local/etc/cacert.pem",
                            owner => "root",
                            group => "admin";
                        "/opt/local/etc/wgetrc":
                            source => "${platform_fileroot}/opt/local/etc/wgetrc",
                            owner => "root",
                            group => "admin";
                    }
                }
            }
        }
    }
}

