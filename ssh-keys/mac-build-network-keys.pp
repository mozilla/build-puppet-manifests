class mac-build-network-keys {
    file {
        "/Users/cltbld/.ssh":
            source => "${fileroot}darwin9/.ssh",
            owner => "cltbld",
            group => "staff",
            mode => 600,
            recurse => true;
    }
}
