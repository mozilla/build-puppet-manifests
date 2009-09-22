class mac-try-keys {
    file {
        "/Users/cltbld/.ssh":
            source => "${fileroot}darwin9/.ssh-try",
            owner => "cltbld",
            group => "staff",
            mode => 600,
            recurse => true;
    }
}
