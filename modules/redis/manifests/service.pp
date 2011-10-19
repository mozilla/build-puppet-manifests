class redis::service {
    file {
        "/etc/redis/default.conf":
            require => Class["redis::install"],
            source => "puppet:///modules/redis/default.conf";
    }
    service {
        "redis":
            require => File["/etc/redis/default.conf"],
            subscribe => File["/etc/redis/default.conf"],
            enable => true,
            hasstatus => true,
            ensure => running;
    }
}

