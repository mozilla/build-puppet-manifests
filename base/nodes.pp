node "slave" {
    $configExt = ""
}

node "build" inherits "slave" {
    $slaveType = "build"
    include location
    $platform_httproot = $location::platform_httproot
    $platform_fileroot = $location::platform_fileroot
    $local_httproot = $location::local_httproot
    $local_fileroot = $location::local_fileroot
    include base, puppet-config
}

node "centos" inherits "build" {
    include cltbld
}

node "centos5-i686-build" inherits "centos" {
}

node "centos5-x86_64-build" inherits "centos" {
}

node "darwin-build" inherits "build" {
}

node "darwin9-i386-build" inherits "darwin-build" {
}

node "darwin10-i386-build" inherits "darwin-build" {
}

node "byob-repack" inherits "darwin10-i386-build" {
}

node "test" inherits "slave" {
    $slaveType = "test"
    include location
    $platform_httproot = $location::platform_httproot
    $platform_fileroot = $location::platform_fileroot
    $local_httproot = $location::local_httproot
    $local_fileroot = $location::local_fileroot
    include puppet-config
}

node "fedora" inherits "test" {
}

node "fedora12-i686-test" inherits "fedora" {
}

node "fedora12-x86_64-test" inherits "fedora" {
}

node "darwin-test" inherits "test" {
}

node "darwin9-i386-test" inherits "darwin-test" {
}

node "darwin10-i386-test" inherits "darwin-test" {
}

# These nodes are only used for non-MPT based slaves. When they first come up
# they will connect to the MPT puppet server. These classes will make sure
# they get redirected to their correct server.
node "mv-node" {
    $configExt = ".mv"
}

node "mv-build-node" inherits "mv-node" {
    $slaveType = "build"
    include location
    $local_fileroot = $location::local_fileroot
    include puppet-config
}

node "mv-test-node" inherits "mv-node" {
    $slaveType = "test"
    include location
    $local_fileroot = $location::local_fileroot
    include puppet-config
}

node "scl-node" {
    $configExt = ".scl"
}

node "scl-build-node" inherits "scl-node" {
    $slaveType = "build"
    include location
    $local_fileroot = $location::local_fileroot
    include puppet-config
}

node "scl-test-node" inherits "scl-node" {
    $slaveType = "test"
    include location
    $local_fileroot = $location::local_fileroot
    include puppet-config
}
node "stage-and-aus2-server" {
    $slaveType = "stage"
    include location
    $platform_httproot = $location::platform_httproot
    $platform_fileroot = $location::platform_fileroot
    $local_httproot = $location::local_httproot
    $local_fileroot = $location::local_fileroot
    include stageusergroups, stage-rpms, stagelayout, stageaus2
}

node "staging-node" {
    $configExt = ".staging"
}

node "staging-build-node" inherits "staging-node" {
    $slaveType = "build"
    include location
    $local_fileroot = $location::local_fileroot
    include puppet-config
}

node "staging-test-node" inherits "staging-node" {
    $slaveType = "test"
    include location
    $local_fileroot = $location::local_fileroot
    include puppet-config
}

node "master" {
    $slaveType = "master"
    include location
    $platform_httproot = $location::platform_httproot
    $platform_fileroot = $location::platform_fileroot
    $local_httproot = $location::local_httproot
    $local_fileroot = $location::local_fileroot
    file {
       "/etc/cron.d/cltbld":
            source => "${platform_fileroot}/etc/cron.d/cltbld",
            owner => "root",
            group => "root",
            mode => 600;
        "/builds/buildbot":
            ensure => directory,
            owner => "cltbld",
            group => "cltbld",
            mode => 755;
        "/etc/init.d/buildbot":
            source => "${platform_fileroot}/etc/init.d/buildbot",
            owner => "root",
            group => "root",
            mode => 755;
        "/etc/default/buildbot.d":
            ensure => directory,
            owner => "root",
            group => "root",
            mode => 755;
        "/etc/nagios/nrpe.cfg":
            source => "${platform_fileroot}/etc/nagios/nrpe.cfg",
            require => Package["nagios-nrpe"],
            owner  => "root",
            group  => "root";
        "/etc/munin/munin-node.conf":
            source => "${platform_fileroot}/etc/munin/munin-node.conf",
            require => Package["munin-node"],
            owner  => "root",
            group  => "root";
        "/etc/ntp.conf":
            source => "${platform_fileroot}/etc/ntp.conf",
            owner  => "root",
            group  => "root";
    }
    exec {
        "buildbot-tools":
             command => "/tools/python/bin/hg clone http://hg.mozilla.org/build/tools",
             onlyif => "/usr/bin/test ! -d /home/cltbld/tools",
             user => "cltbld",
             group => "cltbld",
             cwd => "/home/cltbld";
    }
    service {
        "nrpe":
            require => Package["nagios-nrpe"],
            enable => 'true',
            subscribe => File["/etc/nagios/nrpe.cfg"],
            ensure => 'running';
        "munin-node":
            require => Package["munin-node"],
            enable => 'true',
            subscribe => File["/etc/munin/munin-node.conf"],
            ensure => 'running';
        "ntpd":
            enable => 'true',
            ensure => 'running';
    }
}

node "centos5-i686-master" inherits "master" {
    package {
        "mysql":
            source => "${platform_httproot}/RPMs/mysql-5.0.77-4.el5_5.3.i386.rpm",
            provider => rpm,
            ensure => installed,
            require => Package['perl-DBI'];
        "perl-DBI":
            source => "${platform_httproot}/RPMs/perl-DBI-1.52-2.el5.i386.rpm",
            provider => rpm,
            ensure => installed;
        "mysql-devel":
            source => "${platform_httproot}/RPMs/mysql-devel-5.0.77-4.el5_5.3.i386.rpm",
            provider => rpm,
            require => [Package["mysql"], Package["perl-DBI"]],
            ensure => installed;
        "nagios-nrpe":
            provider => rpm,
            ensure => installed,
            source => "${platform_httproot}/RPMs/nagios-nrpe-2.5.2-1.el5.rf.i686.rpm";
        "nagios-plugins":
             provider => rpm,
             ensure => installed,
             require => Package["nagios-nrpe"],
               source => "${platform_httproot}/RPMs/nagios-plugins-1.4.9-1.el5.rf.i686.rpm";
        "nagios-plugins-nrpe":
             provider => rpm,
             ensure => installed,
             require => Package["nagios-nrpe"],
               source => "${platform_httproot}/RPMs/nagios-plugins-nrpe-2.5.2-1.el5.rf.i686.rpm";
        "perl-HTML-Tagset":
             provider => rpm,
             ensure => installed,
             source => "${platform_httproot}/RPMs/perl-HTML-Tagset-3.10-2.1.1.noarch.rpm";
        "perl-Digest-SHA1":
             provider => rpm,
             ensure => installed,
             source => "${platform_httproot}/RPMs/perl-Digest-SHA1-2.11-1.2.1.i386.rpm";
        "perl-Compress-Zlib":
             provider => rpm,
             ensure => installed,
             source => "${platform_httproot}/RPMs/perl-Compress-Zlib-1.42-1.fc6.i386.rpm";
        "perl-HTML-Parser":
             provider => rpm,
             ensure => installed,
             source => "${platform_httproot}/RPMs/perl-HTML-Parser-3.55-1.fc6.i386.rpm";
        "perl-IO-Multiplex":
             provider => rpm,
             ensure => installed,
             source => "${platform_httproot}/RPMs/perl-IO-Multiplex-1.08-5.el5.noarch.rpm";
        "perl-Digest-HMAC":
             provider => rpm,
             ensure => installed,
             source => "${platform_httproot}/RPMs/perl-Digest-HMAC-1.01-15.noarch.rpm",
             require => Package['perl-Digest-SHA1'];
        "perl-Crypt-DES":
             provider => rpm,
             ensure => installed,
             source => "${platform_httproot}/RPMs/perl-Crypt-DES-2.05-3.el5.i386.rpm";
        "perl-Net-Server":
             provider => rpm,
             ensure => installed,
             source => "${platform_httproot}/RPMs/perl-Net-Server-0.96-2.el5.noarch.rpm",
             require => Package['perl-IO-Multiplex'];
        "perl-libwww-perl":
             provider => rpm,
             ensure => installed,
             require => [Package["perl-HTML-Parser"]],
             source => "${platform_httproot}/RPMs/perl-libwww-perl-5.805-1.1.1.noarch.rpm";
        "perl-Net-SNMP":
             provider => rpm,
             ensure => installed,
             require => [Package["perl-Digest-HMAC"]],
             source => "${platform_httproot}/RPMs/perl-Net-SNMP-5.2.0-1.el5.1.noarch.rpm";
        "sysstat":
             provider => rpm,
             ensure => installed,
             source => "${platform_httproot}/RPMs/sysstat-7.0.2-3.el5_5.1.i386.rpm";
        "munin-common":
             provider => rpm,
             ensure => installed,
             source => "${platform_httproot}/RPMs/munin-common-1.4.5-4.el5.noarch.rpm";
        "munin-node":
             provider => rpm,
             ensure => installed,
             require => [Package["munin-common"], Package["perl-HTML-Tagset"],
                         Package["perl-Digest-SHA1"], Package["perl-Compress-Zlib"],
                         Package["perl-Digest-SHA1"], Package["perl-IO-Multiplex"],
                         Package["sysstat"], Package["perl-Crypt-DES"],
                         Package["perl-Net-Server"], Package["perl-libwww-perl"],
                         Package["perl-DBI"], Package["perl-Net-SNMP"]],
            source => "${platform_httproot}/RPMs/munin-node-1.4.5-4.el5.noarch.rpm";
    }
}
