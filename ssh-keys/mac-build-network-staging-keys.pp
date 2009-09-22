class mac-build-network-staging-keys {
    file {
        "/Users/cltbld/.ssh":
            source => "${fileroot}darwin9/.ssh-staging",
            owner => "cltbld",
            group => "staff",
            mode => 600,
            recurse => true;
    }
}
