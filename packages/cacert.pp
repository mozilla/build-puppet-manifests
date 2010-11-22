# cacert.pp
# this manifest installs cacert.pem and places it in /opt/local/etc/wgetrc

# This is for Darwin machines only

class cacert {
    case $operatingsystem {
        Darwin: {
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

