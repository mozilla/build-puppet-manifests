class ix {
    mount {
        "builds":
            name   => "/builds",
            atboot => true,
            device => "/dev/sda4",
            ensure => "mounted",
            fstype => "ext3",
            options => "noatime",
            remounts => true;
    }
    file {
        "/dev/ptmx":
            mode => 666,
            owner => "root",
            group => "tty";
    }
}
