class buildapi {
    include nginx
    include nagios
    include buildapi::settings
    include secrets
    $nagios_etcdir = $nagios::service::etcdir
    $plugins_dir = $nagios::service::plugins_dir
    $buildapi_python = "/home/buildapi/bin/python"
    $buildapi_dir = "/home/buildapi/src"
    package {
        "python26":
            ensure => latest;
        "python26-devel":
            ensure => latest;
        "mysql-devel":
            ensure => latest;
        "git":
            ensure => latest;
    }
    file {
        "/tools":
            ensure => directory;
        "/etc/init.d/buildapi":
            require => Exec["clone-buildapi"],
            mode => 755,
            source => "puppet:///modules/buildapi/buildapi.initd";
        "$nagios_etcdir/nrpe.d/buildapi.cfg":
            require => Class["nagios"],
            notify => Service["nrpe"],
            content => template("buildapi/buildapi-nagios.cfg.erb");
        "/home/buildapi/production.ini":
            content => template('buildapi/production.ini.erb'),
            notify => Service['buildapi'],
            owner => 'buildapi',
            group => 'buildapi';
        "/home/buildapi/reporter.cfg":
            content => template('buildapi/reporter.cfg.erb'),
            owner => 'buildapi',
            group => 'buildapi';
        "/var/www/buildapi":
            ensure => directory,
            owner => "buildapi",
            group => "buildapi";
        "/var/www/buildapi/index.html":
            source => "puppet:///modules/buildapi/buildapi-index.html",
            owner => "buildapi",
            group => "buildapi";
        "/var/www/buildapi/buildjson":
            ensure => directory,
            owner => "buildapi",
            group => "buildapi";
        "/var/www/buildapi/l10n_reports":
            ensure => directory,
            owner => "buildapi",
            group => "buildapi";
        "/home/buildapi/bin":
            ensure => directory,
            owner => "buildapi",
            group => "buildapi",
            mode => 0755;
        "/home/buildapi/bin/waittime_mailer.sh":
            content => template("buildapi/waittime_mailer.sh.erb"),
            owner => "buildapi",
            group => "buildapi",
            mode => 0755;
        "/home/buildapi/bin/report-4hr.sh":
            content => template("buildapi/report-4hr.sh.erb"),
            owner => "buildapi",
            group => "buildapi",
            mode => 0755;
        "/home/buildapi/bin/report-daily.sh":
            content => template("buildapi/report-daily.sh.erb"),
            owner => "buildapi",
            group => "buildapi",
            mode => 0755;
        "/home/buildapi/bin/report-today.sh":
            content => template("buildapi/report-today.sh.erb"),
            owner => "buildapi",
            group => "buildapi",
            mode => 0755;
        "/home/buildapi/bin/report-running.sh":
            content => template("buildapi/report-running.sh.erb"),
            owner => "buildapi",
            group => "buildapi",
            mode => 0755;
    }
    service {
        "buildapi":
            require => [
                File["/etc/init.d/buildapi"],
                File["/home/buildapi/production.ini"],
            ],
            hasstatus => true,
            enable => true,
            ensure => running;
    }
    user {
        "buildapi":
            ensure => present;
    }
    mailalias {
        "buildapi":
            notify => Exec["newaliases"],
            recipient => "release@mozilla.com";
        "root":
            notify => Exec["newaliases"],
            recipient => "release@mozilla.com";
    }
    nginx::site {
        "buildapi":
            content => template('buildapi/buildapi-nginx.conf.erb');
    }
    python::virtualenv {
        "/home/buildapi":
            require => [Package["python26"], Package["python26-devel"], Package["mysql-devel"]],
            packages => [
                "Beaker==1.5.4",
                "FormEncode==1.2.4",
                "Mako==0.4.1",
                "MarkupSafe==0.12",
                "MySQL-python==1.2.3",
                "Paste==1.7.5.1",
                "PasteDeploy==1.5.0",
                "PasteScript==1.7.3",
                "Pygments==1.4",
                "Pylons==1.0",
                "Routes==1.12.3",
                "SQLAlchemy==0.7.1",
                "Tempita==0.5.1",
                "WebError==0.10.3",
                "WebHelpers==1.3",
                "WebOb==1.0.8",
                "WebTest==1.2.3",
                "amqplib==0.6.1",
                "anyjson==0.3.1",
                "carrot==0.10.7",
                "decorator==3.3.1",
                "distribute==0.6.14",
                "nose==1.0.0",
                "pytz==2011h",
                "simplejson==2.1.6",
                "wsgiref==0.1.2",
                "redis==2.4.5",
                "gviz_api.py==1.7.0",
            ],
            user => "buildapi",
            group => "buildapi",
            python => "/usr/bin/python2.6";
    }
    exec {
        "clone-buildapi":
            require => Python::Virtualenv["/home/buildapi"],
            command => "/usr/bin/hg clone http://hg.mozilla.org/build/buildapi /home/buildapi/src",
            user => "buildapi",
            group => "buildapi",
            creates => "/home/buildapi/src";
        "install-buildapi":
            require => Exec["clone-buildapi"],
            user => "buildapi",
            group => "buildapi",
            command => "/home/buildapi/bin/python setup.py develop",
            creates => "/home/buildapi/lib/python2.6/site-packages/buildapi.egg-link",
            cwd => "/home/buildapi/src";
    }
    include service_manager::hg
    service_manager {
        "buildapi":
            require => Exec["clone-buildapi"],
            user => "buildapi",
            service => "buildapi",
            updatecmd => "${service_manager::hg::cmd} /home/buildapi/src",
            minute => "*/5";
    }
    cron {
        "4hour":
            require => [
                Exec["install-buildapi"],
                File["/home/buildapi/reporter.cfg"],
                File["/var/www/buildapi/buildjson"],
                File["/home/buildapi/bin/report-4hr.sh"],
                ],
            user => "buildapi",
            command => "/home/buildapi/bin/report-4hr.sh",
            minute => "*";
        "dailyreport":
            require => [
                Exec["install-buildapi"],
                File["/home/buildapi/reporter.cfg"],
                File["/var/www/buildapi/buildjson"],
                File["/home/buildapi/bin/report-daily.sh"],
                ],
            user => "buildapi",
            command => "/home/buildapi/bin/report-daily.sh",
            hour => "0",
            minute => "0";
        "todayreport":
            require => [
                Exec["install-buildapi"],
                File["/home/buildapi/reporter.cfg"],
                File["/var/www/buildapi/buildjson"],
                File["/var/www/buildapi/l10n_reports"],
                File["/home/buildapi/bin/report-today.sh"],
                ],
            user => "buildapi",
            command => "/home/buildapi/bin/report-today.sh",
            hour => "*",
            minute => "*/15";
        "waittime-build":
            require => [
                Service["buildapi"],
                File["/home/buildapi/bin/waittime_mailer.sh"],
                ],
            user => "buildapi",
            command => "/home/buildapi/bin/waittime_mailer.sh buildpool -a dev-tree-management@lists.mozilla.org",
            hour => "6",
            minute => "1";
        "waittime-try":
            require => [
                Service["buildapi"],
                File["/home/buildapi/bin/waittime_mailer.sh"],
                ],
            user => "buildapi",
            command => "/home/buildapi/bin/waittime_mailer.sh trybuildpool -a dev-tree-management@lists.mozilla.org",
            hour => "6",
            minute => "3";
        "waittime-test":
            require => [
                Service["buildapi"],
                File["/home/buildapi/bin/waittime_mailer.sh"],
                ],
            user => "buildapi",
            command => "/home/buildapi/bin/waittime_mailer.sh testpool -a dev-tree-management@lists.mozilla.org",
            hour => "6",
            minute => "5";
        "running":
            require => [
                Service["buildapi"],
                File["/home/buildapi/bin/report-running.sh"],
                File["/var/www/buildapi/buildjson"],
                ],
            user => "buildapi",
            command => "/home/buildapi/bin/report-running.sh",
            minute => "*";
    }
}
