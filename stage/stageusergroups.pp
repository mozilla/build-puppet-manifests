# stageusergroups.pp

class stageusergroups {
    include secrets

    Group { ensure => 'present' }
    group {
        "cltbld":
            name => "cltbld",
            provider => 'groupadd',
            gid => 500;
        "cvs":
            name => "cvs",
            provider => 'groupadd',
            gid => 510;
        "buildslave":
            name => "buildslave",
            provider => 'groupadd',
            gid => 503;
        "firefox":
            name => "firefox",
            provider => 'groupadd',
            gid => 504;
        "symbols":
            name => "symbols",
            provider => 'groupadd',
            gid => 505;
        "ffxbld":
            name => "ffxbld",
            provider => 'groupadd',
            gid => 506;
        "xrbld":
            name => "xrbld",
            provider => 'groupadd',
            gid => 507;
        "xulrunner":
            name => "xulrunner",
            provider => 'groupadd',
            gid => 508;
        "trybld":
            name => "trybld",
            provider => 'groupadd',
            gid => 509;
        "tbirdbld":
            name => "tbirdbld",
            provider => 'groupadd',
            gid => 511;
    }

    User{ ensure => 'present', managehome => true, shell => "/bin/bash", provider => 'useradd'}

    user {
        "cltbld":
            name => "cltbld",
            uid => 500,
            gid => 500,
            groups => ["cvs", "firefox"],
            password => $secrets::cltbld_password,
            home => "/home/cltbld";
        "buildslave":
            name => "buildslave",
            uid => 502,
            gid => 503,
            groups => ["cltbld", "cvs", "firefox"],
            home => "/home/buildslave";
        "symbols":
            name => "symbols",
            uid => 503,
            gid => 505,
            home => "/home/symbols";
        "ffxbld":
            name => "ffxbld",
            uid => 504,
            gid => 504,
            home => "/home/ffxbld";
        "xrbld":
            name => "xrbld",
            uid => 505,
            gid => 507,
            groups => "xulrunner",
            home => "/home/xrbld";
        "trybld":
            name => "trybld",
            uid => 507,
            gid => 509,
            home => "/home/trybld";
        "tbirdbld":
            name => "tbirdbld",
            uid => 511,
            gid => 511,
            home => "/home/tbirdbld";
    }


    File{ mode => 644, owner => "cltbld", group => "cltbld" }

    file {
            "/home/cltbld/.bash_profile":
                source => "${platform_fileroot}/home/cltbld/.bash_profile";
            "/home/cltbld/.ssh":
                mode => 755,
                ensure => directory;
            "/home/ffxbld":
                mode => 711,
                owner => "ffxbld",
                group => "ffxbld",
                ensure => directory;
            "/home/ffxbld/.ssh":
                mode => 755,
                owner => "ffxbld",
                group => "ffxbld",
                ensure => directory;
            "/home/symbols/.ssh":
                mode => 755,
                owner => "symbols",
                group => "symbols",
                ensure => directory;
            "/home/trybld/.ssh":
                mode => 755,
                owner => "trybld",
                group => "trybld",
                ensure => directory;
            "/home/tbirdbld/.ssh":
                mode => 755,
                owner => "tbirdbld",
                group => "tbirdbld",
                ensure => directory;
            "/home/xrbld/.ssh":
                mode => 755,
                owner => "xrbld",
                group => "xrbld",
                ensure => directory;
            "/home/cltbld/.ssh/config":
                mode => 600,
                source => "${local_fileroot}/home/cltbld/.ssh/config";
            "/home/cltbld/.ssh/known_hosts":
                mode => 644,
                source => "${local_fileroot}/home/cltbld/.ssh/known_hosts";
            "/home/cltbld/.ssh/authorized_keys":
                mode => 644,
                source => "${local_fileroot}/home/cltbld/.ssh/authorized_keys";
            "/home/ffxbld/.ssh/authorized_keys":
                mode => 644,
                owner => "ffxbld",
                group => "ffxbld",
                source => "${local_fileroot}/home/ffxbld/.ssh/authorized_keys";
            "/home/symbols/.ssh/authorized_keys":
                mode => 644,
                owner => "symbols",
                group => "symbols",
                source => "${local_fileroot}/home/symbols/.ssh/authorized_keys";
            "/home/trybld/.ssh/authorized_keys":
                mode => 644,
                owner => "trybld",
                group => "trybld",
                source => "${local_fileroot}/home/trybld/.ssh/authorized_keys";
            "/home/xrbld/.ssh/authorized_keys":
                mode => 644,
                owner => "xrbld",
                group => "xrbld",
                source => "${local_fileroot}/home/xrbld/.ssh/authorized_keys";
            "/home/cltbld/crontab":
                source => "${platform_fileroot}/home/cltbld/crontab";
            "/root/.ssh":
                mode => 755,
                owner => "root",
                group => "root",
                ensure => directory;
            "/root/.ssh/config":
                mode => 600,
                owner => "root",
                group => "root",
                source => "${local_fileroot}/root/.ssh/config";
            "/root/.ssh/known_hosts":
                owner => "root",
                group => "root",
                source => "${local_fileroot}/root/.ssh/known_hosts";
            "/root/.ssh/cvs":
                mode => 600,
                owner => "root",
                group => "root",
                source => "${local_fileroot}/root/.ssh/cvs";
            "/root/.ssh/cvs.pub":
                owner => "root",
                group => "root",
                source => "${local_fileroot}/root/.ssh/cvs.pub";
            "/root/crontab":
                owner => "root",
                group => "root",
                content => template("/etc/puppet/templates/stage.root.crontab.erb");
    }
    exec {
        "/usr/bin/crontab -u cltbld /home/cltbld/crontab":
            subscribe => File["/home/cltbld/crontab"];
        "/usr/bin/crontab -u root /root/crontab":
            subscribe => File["/root/crontab"];
    }
}
