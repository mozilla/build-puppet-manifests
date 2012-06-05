class signingserver {
    include secrets
    include secrets::signingserver
    include python::pip

    case "$operatingsystem" {
        "CentOS": {
            case $operatingsystemrelease {
                "5.5", "5.8": {
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
                            ensure => latest,
                            alias => "libevent";
                        "jdk1.6":
                            provider => rpm,
                            source => "${httproot}/CentOS-5.5-x86_64/master/RPMs/jdk1.6-1.6.0_17-0moz1.i686.rpm";
                        "android-sdk":
                            provider => rpm,
                            source => "${httproot}/CentOS-5.5-x86_64/master/RPMs/android-sdk-r8-0moz3.i686.rpm";
                    }
                }
            }
        }
        Darwin: {
            file {
                "/usr/bin/virtualenv-2.6":
                    mode => 755,
                    source => "puppet:///${level}/python-packages/virtualenv.py";
            }
            case $macosx_productversion_major {
                "10.6": {
                    package {
                        "GPGTools-20111224.dmg":
                            ensure => installed,
                            source => "${httproot}/Darwin10/GPGTools-20111224.dmg";
                        "xcode_4.2_for_snow_leopard.dmg":
                            ensure => installed,
                            provider => pkgdmg,
                            source => "${httproot}/Darwin10/xcode_4.2_for_snow_leopard.dmg";
                        "libevent-2.0.17.dmg":
                            ensure => installed,
                            provider => pkgdmg,
                            source => "${httproot}/Darwin10/libevent-2.0.17.dmg",
                            alias => "libevent";
                    }
                    file {
                        "/usr/bin/gcc-4.2":
                            source => "/usr/bin/gcc",
                            subscribe => Package["xcode_4.2_for_snow_leopard.dmg"];
                    }
                }
            }
        }
        default: {
            fail("Unsupported OS: $operatingsystem $operatingsystemrelease")
        }
    }

    $homedir = $operatingsystem ? {
        CentOS => "/home/cltsign",
        Darwin => "/Users/cltsign",
    }

    case $operatingsystem {
        Darwin: {
            user {
                "cltsign":
                    name => "cltsign",
                    ensure => present,
                    home => $homedir,
                    password => $secrets::cltsign_password;
            }
            file {
                "/Users/cltsign":
                    ensure => directory,
                    owner => "cltsign",
                    mode => 700,
                    require => User["cltsign"];
            }
        }
        default: {
            user {
                "cltsign":
                    ensure => present,
                    home => $homedir,
                    password => $secrets::cltsign_password,
                    managehome => true;
            }
            file {
                "/home/cltsign":
                    ensure => directory,
                    owner => "cltsign",
                    mode => 700,
                    require => User["cltsign"];
            }
        }
    }

    $signing_server_ports = ["9100", "9110", "9120"]
    file {
        "${homedir}/instances":
            ensure => directory,
            owner => "cltsign",
            require => File[$homedir];
        "${homedir}/.ssh":
            mode => 755,
            owner => "cltsign",
            group => "cltsign",
            ensure => directory,
            require => File[$homedir];
        "${homedir}/.ssh/known_hosts":
            owner => "cltsign",
            group => "cltsign",
            source => "puppet:///${level}//home/cltsign/.ssh/known_hosts";
    }
    case $operatingsystem {
        CentOS: {
            file {
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
        }
    }

    signingserver::instance {
        "${homedir}/instances/nightly-key-signing-server-2":
            name           => "nightly",
            listenaddr     => "0.0.0.0",
            port           => "9100",
            code_tag       => "SIGNING_SERVER",
            user           => "cltsign",
            token_secret   => $secrets::signingserver::token_secret,
            new_token_auth => $secrets::signingserver::new_token_auth,
            mar_key_name   => "nightly1",
            formats        => $signing_formats,
            require        => [File["${homedir}/instances"], Package["mercurial"], Package["libevent"]];
    }

    signingserver::instance {
        "${homedir}/instances/dep-key-signing-server-2":
            name           => "dep",
            listenaddr     => "0.0.0.0",
            port           => "9110",
            code_tag       => "SIGNING_SERVER",
            user           => "cltsign",
            token_secret   => $secrets::signingserver::token_secret,
            new_token_auth => $secrets::signingserver::new_token_auth,
            mar_key_name   => "dep1",
            formats        => $signing_formats,
            require        => [File["${homedir}/instances"], Package["mercurial"], Package["libevent"]];
    }
    signingserver::instance {
        "${homedir}/instances/rel-key-signing-server-2":
            name           => "release",
            listenaddr     => "0.0.0.0",
            port           => "9120",
            code_tag       => "SIGNING_SERVER",
            user           => "cltsign",
            token_secret   => $secrets::signingserver::token_secret,
            new_token_auth => $secrets::signingserver::new_token_auth,
            mar_key_name   => "rel1",
            formats        => $signing_formats,
            require        => [File["${homedir}/instances"], Package["mercurial"], Package["libevent"]];
    }
}
