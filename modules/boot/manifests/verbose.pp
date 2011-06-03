# Enable verbose boot on macs.  We could do this on anything running Apple
# hardware, but I don't know how to do it from other OSes.

class boot::verbose {
    if $operatingsystem == "Darwin" {
        exec {
            "nvram-verbose":
                name => "/usr/sbin/nvram boot-args=-v",
                onlyif => "/bin/sh -c '! /usr/sbin/nvram boot-args > /tmp/nvram || grep -q -v boot-args.*-v /tmp/nvram'",
                logoutput => on_failure;
        }
    }
}
