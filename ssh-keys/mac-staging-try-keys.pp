class mac-staging-try-keys {
    file {
        "/Users/cltbld/.ssh":
            ensure => absent,
            force => true;
    }
}
