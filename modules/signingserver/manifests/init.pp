class signingserver {
    include secrets
    include secrets::signingserver

    case "$operatingsystem $operatingsystemrelease" {
        "CentOS 5.5": {
            package {
                "python26":
                    ensure => latest;
                "python26-virtualenv":
                    require => Package['python26'],
                    ensure => latest;
                "mono-devel":
                    ensure => latest;
                "git":
                    ensure => latest;
                "openssl":
                    ensure => latest;
                "gnupg":
                    ensure => latest;
                "nss-tools":
                    ensure => latest;
                "libevent-devel":
                    ensure => latest;
                "jdk1.6":
                    provider => rpm,
                    source => "${httproot}/CentOS-5.5-x86_64/master/RPMs/jdk1.6-1.6.0_17-0moz1.i686.rpm";
                "android-sdk":
                    provider => rpm,
                    source => "${httproot}/CentOS-5.5-x86_64/master/RPMs/android-sdk-r8-0moz3.i686.rpm";
            }
        }
        default: {
            fail("Unsupported OS: $operatingsystem $operatingsystemrelease")
        }
    }

    user {
        "cltsign":
            ensure => present,
            home => '/home/cltsign',
            password => $secrets::cltsign_password,
            managehome => true;
    }

    $signing_server_ports = ["9100", "9110", "9120"]
    file {
        "/home/cltsign/instances":
            ensure => directory,
            owner => "cltsign",
            require => User["cltsign"];
        "/etc/sysconfig/iptables":
            content => template("signingserver/iptables.erb");
        "/home/cltsign/.ssh":
            mode => 755,
            owner => "cltsign",
            group => "cltsign",
            ensure => directory;
        "/home/cltsign/.ssh/known_hosts":
            owner => "cltsign",
            group => "cltsign",
            source => "${local_fileroot}/home/cltsign/.ssh/known_hosts";
    }

    service {
        "iptables":
            enable => true,
            subscribe => File["/etc/sysconfig/iptables"],
            # XXX: It doesn't really make sense to set this to running,
            #      but without this, the new rules don't apply until
            #      the NEXT run of the service.
            ensure => running,
            require => File["/etc/sysconfig/iptables"];
    }

    signingserver::instance {
        "/home/cltsign/instances/nightly-key-signing-server-2":
            listenaddr     => "0.0.0.0",
            port           => "9100",
            code_tag       => "SIGNING_SERVER",
            user           => "cltsign",
            token_secret   => $secrets::signingserver::token_secret,
            new_token_auth => $secrets::signingserver::new_token_auth,
            mar_key_name   => "nightly1",
            require        => File["/home/cltsign/instances"];
    }

    signingserver::instance {
        "/home/cltsign/instances/dep-key-signing-server-2":
            listenaddr     => "0.0.0.0",
            port           => "9110",
            code_tag       => "SIGNING_SERVER",
            user           => "cltsign",
            token_secret   => $secrets::signingserver::token_secret,
            new_token_auth => $secrets::signingserver::new_token_auth,
            mar_key_name   => "dep1",
            require        => File["/home/cltsign/instances"];
    }
    signingserver::instance {
        "/home/cltsign/instances/rel-key-signing-server-2":
            listenaddr     => "0.0.0.0",
            port           => "9120",
            code_tag       => "SIGNING_SERVER",
            user           => "cltsign",
            token_secret   => $secrets::signingserver::token_secret,
            new_token_auth => $secrets::signingserver::new_token_auth,
            mar_key_name   => "rel1",
            require        => File["/home/cltsign/instances"];
    }
}
