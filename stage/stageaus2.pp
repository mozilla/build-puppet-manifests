class stageaus2 {
    Package{ provider => rpm, ensure => installed }
    case $hardwaremodel {
        "x86_64": {
            package {
                "apr":
                    source => "${platform_httproot}/RPMs/apr-1.2.7-11.el5_5.3.x86_64.rpm";
                "postgresql-libs":
                    source => "${platform_httproot}/RPMs/postgresql-libs-8.1.23-1.el5_7.3.x86_64.rpm";
                "gmp":
                    source => "${platform_httproot}/RPMs/gmp-4.1.4-10.el5.x86_64.rpm";
                "php-common":
                    require => Package["gmp"],
                    source => "${platform_httproot}/RPMs/php-common-5.1.6-27.el5_5.3.x86_64.rpm";
                "php-cli":
                    require => Package["php-common"],
                    source => "${platform_httproot}/RPMs/php-cli-5.1.6-27.el5_5.3.x86_64.rpm";
                "apr-util":
                    require => [Package["apr"], Package["postgresql-libs"]],
                    source => "${platform_httproot}/RPMs/apr-util-1.2.7-11.el5_5.2.x86_64.rpm";
                "httpd":
                    require => Package["apr-util"],
                    source => "${platform_httproot}/RPMs/httpd-2.2.3-45.el5.centos.x86_64.rpm";

                "php":
                    require => [Package["httpd"], Package["php-cli"]],
                    source => "${platform_httproot}/RPMs/php-5.1.6-27.el5_5.3.x86_64.rpm";
            }
        }
        default: {
            package {
                "apr":
                    source => "${platform_httproot}/RPMs/apr-1.2.7-11.i386.rpm";
                "gmp":
                    source => "${platform_httproot}/RPMs/gmp-4.1.4-10.el5.i386.rpm";
                "php-common":
                    require => Package["gmp"],
                    source => "${platform_httproot}/RPMs/php-common-5.1.6-5.el5.i386.rpm";
                "php-cli":
                    require => Package["php-common"],
                    source => "${platform_httproot}/RPMs/php-cli-5.1.6-5.el5.i386.rpm";
                "apr-util":
                    require => Package["apr"],
                    source => "${platform_httproot}/RPMs/apr-util-1.2.7-6.i386.rpm";
                "httpd":
                    require => Package["apr-util"],
                    source => "${platform_httproot}/RPMs/httpd-2.2.3-6.el5.centos.1.i386.rpm";

                "php":
                    require => [Package["httpd"], Package["php-cli"]],
                    source => "${platform_httproot}/RPMs/php-5.1.6-5.el5.i386.rpm";
            }
        }
    }
    file {
        "/etc/httpd/conf.d/aus2.conf":
            source => "${platform_fileroot}/etc/httpd/conf.d/aus2.conf",
            mode => 644,
            require => [Package["httpd"], Package["php"]];
        "/usr/local/bin/aus2-setup.sh":
            source => "${platform_fileroot}/usr/local/bin/aus2-setup.sh",
            mode => 755;
        ["/builds/opt", "/builds/opt/aus2", "/builds/opt/aus2/app"]:
            ensure => directory,
            owner => "cltbld",
            group => "cltbld",
            mode => 755;
        ["/builds/opt/aus2/incoming/", "/builds/opt/aus2/incoming/3",
        "/builds/opt/aus2/incoming/0", "/builds/opt/aus2/snippets",
        "/builds/opt/aus2/snippets/backup",
        "/builds/opt/aus2/snippets/staging", "/builds/opt/aus2/build",
        "/builds/opt/aus2/build/0"]:
            ensure => directory,
            owner => "cltbld",
            group => "cltbld",
            mode => 775;
        ["/builds/opt/aus2/incoming/2"]:
            ensure => directory,
            owner => "ffxbld",
            group => "ffxbld",
            mode => 775;
        "/opt":
            ensure => "/builds/opt",
            force => true;
        "/var/www/html/aus2":
            ensure => "/builds/opt/aus2",
            force => true,
            require => [Package["httpd"], Package["php"]];
    }
    service {
        "httpd":
            provider => "redhat",
            enable => true,
            ensure => "running",
            subscribe => [Package["httpd"], Package["php"]];
        "iptables":
            provider => "redhat",
            enable => false,
            ensure => "stopped";
    }
    exec {
        "update-aus2":
            command => "/usr/local/bin/aus2-setup.sh",
            logoutput => true,
            subscribe => File["/usr/local/bin/aus2-setup.sh"],
            require => [Package["cvs"], File["/usr/local/bin/aus2-setup.sh"],
                        File["/root/.ssh/config"], File["/root/.ssh/known_hosts"],
                        File["/root/.ssh/cvs"], File["/root/.ssh/cvs"]];
    }
}
