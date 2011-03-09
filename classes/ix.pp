class ix {
    case $hardwaremodel {
        "x86_64": {
            mount {
                "builds":
                    name   => "/builds",
                    atboot => true,
                    device => "/dev/mapper/vg_linux64-lv_builds",
                    ensure => "mounted",
                    fstype => "ext3",
                    options => "noatime",
                    remounts => true;
            }
        }
        default: {
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
        }
    }
    file {
        "/dev/ptmx":
            mode => 666,
            owner => "root",
            group => "tty";
    }
}
