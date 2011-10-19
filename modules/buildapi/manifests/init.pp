class buildapi {
    include nginx
    include rabbitmq
    include nagios
    include buildapi::settings
    include secrets
    $nagios_etcdir = $nagios::service::etcdir
    $plugins_dir = $nagios::service::plugins_dir
    package {
        "python26":
            ensure => latest;
        "python26-devel":
            ensure => latest;
        "mysql-devel":
            ensure => latest;
        "mercurial":
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
    rabbitmq::user {
        "buildapi":
            password => $secrets::buildapi_rmq_password;
    }
    rabbitmq::vhost {
        "/buildapi": ;
    }
    rabbitmq::perms {
        "buildapi":
            vhost => "/buildapi",
            conf => '.*',
            write => '.*',
            read => '.*';
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
}
