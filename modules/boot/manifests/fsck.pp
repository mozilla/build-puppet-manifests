# Add options to ensure that an fsck does not fail for unwanted reasons

class boot::fsck {
    if $operatingsystem == "Fedora" {
        file {
            "/etc/e2fsck.conf":
                source => "puppet:///boot/e2fsck.conf";
        }
    }
}
