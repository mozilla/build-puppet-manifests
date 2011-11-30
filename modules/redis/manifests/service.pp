class redis::service {
    include nagios
    $nagios_plugins_dir = $nagios::service::plugins_dir
    file {
        "/etc/redis/default.conf":
            require => Class["redis::install"],
            source => "puppet:///modules/redis/default.conf";
        "${nagios::service::etcdir}/nrpe.d/redis.cfg":
            content => template("redis/redis.cfg.erb"),
            require => Class["nagios"],
            notify => Service["nrpe"],
            mode => 644,
            owner => "root",
            group => "root";
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
