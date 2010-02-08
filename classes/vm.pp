class vm {
    mount {
        "builds":
            name   => "/builds",
            atboot => true,
            device => "/dev/sdb1",
            ensure => "mounted",
            fstype => "ext3",
            options => "noatime",
            remounts => true;
    }
}
