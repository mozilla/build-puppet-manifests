class staging-mac {
    file {
        "/Users/cltbld/.ssh":
            source => "${fileroot}darwin9/.ssh",
            owner => "cltbld",
            mode => 600,
            recurse => true;
    }
}
