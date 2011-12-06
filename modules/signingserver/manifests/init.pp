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

    $signing_server_ports = ["9000", "9010"]
    file {
        "/home/cltsign/instances":
            ensure => directory,
            owner => "cltsign",
            require => User["cltsign"];
        "/etc/sysconfig/iptables":
            content => template("signingserver/iptables.erb");
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
        "/home/cltsign/instances/nightly-key-signing-server":
            listenaddr     => "0.0.0.0",
            port           => "9000",
            code_tag       => "SIGNING_SERVER",
            user           => "cltsign",
            token_secret   => $secrets::signingserver::token_secret,
            new_token_auth => $secrets::signingserver::new_token_auth,
            # XXX: get a real key for nightly
            mar_key_name   => "dep1",
            require        => File["/home/cltsign/instances"];
    }

    signingserver::instance {
        "/home/cltsign/instances/dep-key-signing-server":
            listenaddr     => "0.0.0.0",
            port           => "9010",
            code_tag       => "SIGNING_SERVER",
            user           => "cltsign",
            token_secret   => $secrets::signingserver::token_secret,
            new_token_auth => $secrets::signingserver::new_token_auth,
            mar_key_name   => "dep1",
            require        => File["/home/cltsign/instances"];
    }
}
