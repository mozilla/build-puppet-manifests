# ntp class
# include this to manage ntpd on your node
class ntp {
    file {
        "/etc/ntp.conf":
            source => "puppet:///modules/ntp/ntp.conf",
            mode => 644,
            owner => root,
            group => root;
    }
    service {
        "ntpd": 
            subscribe => File["/etc/ntp.conf"],
            enable => true,
            ensure => running;
    }
}
