class network::hosts {
    case $operatingsystem {
        Fedora: { $hostsfile = "fedora-hosts" }
        Darwin: { $hostsfile = "darwin-hosts" }
        CentOS: { $hostsfile = "centos-hosts" }
    }

    file {
        "/etc/hosts":
            source => "puppet:///network/$hostsfile";
    }
}
