# buildmaster::queue class
# sets up queue processors for pulse, commands, etc.

class buildmaster::queue {
    include buildmaster::settings
    $master_basedir = $buildmaster::settings::master_basedir
    $master_user = $buildmaster::settings::master_user
    $master_group = $buildmaster::settings::master_group
    $master_queue_venv = $buildmaster::settings::master_queue_venv
    python::virtualenv {
        $master_queue_venv:
            user => $master_user,
            group => $master_group,
            python => "/usr/bin/python2.6",
            packages => [
                "simplejson",
                "buildbot==0.8.4-pre-moz1",
                "Twisted==10.1.0",
                "zope.interface==3.6.1",
                "mozillapulse==.4",
                "carrot==0.10.7",
                "amqplib==0.6.1",
                "anyjson==0.3",
                "pytz==2011d",
            ],
    }
    exec {
        # Clone/install tools
        "clone-tools":
            require => [
                        Package["mercurial"],
                        Python::Virtualenv[$master_queue_venv],
                       ],
            creates => "$master_queue_venv/tools",
            command => "/usr/bin/hg clone http://hg.mozilla.org/build/tools $master_queue_venv/tools",
            user => $master_user;
        "install-tools":
            require => Exec["clone-tools"],
            creates => "$master_queue_venv/lib/python2.6/site-packages/buildtools.egg-link",
            command => "$master_queue_venv/bin/python setup.py develop",
            cwd => "$master_queue_venv/tools",
            user => $master_user;
    }

    $plugins_dir = $nagios::service::plugins_dir
    $nagios_etcdir = $nagios::service::etcdir
    file {
        "/etc/init.d/command_runner":
            content => template("buildmaster/command_runner.initd.erb"),
            notify => Service["command_runner"],
            mode => 755,
            owner => "root",
            group => "root";
        "${master_queue_venv}/run_command_runner.sh":
            require => Python::Virtualenv[$master_queue_venv],
            content => template("buildmaster/run_command_runner.sh.erb"),
            notify => Service["command_runner"],
            mode => 755,
            owner => "root",
            group => "root";
        "$nagios_etcdir/nrpe.d/command_runner.cfg":
            content => template("buildmaster/command_runner.cfg.erb"),
            notify => Service["nrpe"],
            require => Class["nagios"],
            mode => 644,
            owner => "root",
            group => "root";

        "/etc/init.d/pulse_publisher":
            content => template("buildmaster/pulse_publisher.initd.erb"),
            notify => Service["pulse_publisher"],
            mode => 755,
            owner => "root",
            group => "root";
        "${master_queue_venv}/run_pulse_publisher.sh":
            require => Python::Virtualenv[$master_queue_venv],
            content => template("buildmaster/run_pulse_publisher.sh.erb"),
            notify => Service["pulse_publisher"],
            mode => 755,
            owner => "root",
            group => "root";
        "${master_queue_venv}/passwords.py":
            require => Python::Virtualenv[$master_queue_venv],
            content => template("buildmaster/passwords.py.erb"),
            mode => 600,
            owner => $master_user,
            group => $master_group;
        "$nagios_etcdir/nrpe.d/pulse_publisher.cfg":
            content => template("buildmaster/pulse_publisher.cfg.erb"),
            notify => Service["nrpe"],
            require => Class["nagios"],
            mode => 644,
            owner => "root",
            group => "root";
    }
    service {
        "command_runner":
            hasstatus => true,
            require => [
                Python::Virtualenv[$master_queue_venv],
                File["/etc/init.d/command_runner"],
                File["${master_queue_venv}/run_command_runner.sh"],
                ],
            enable => true,
            ensure => running;
        "pulse_publisher":
            hasstatus => true,
            require => [
                Python::Virtualenv[$master_queue_venv],
                File["/etc/init.d/pulse_publisher"],
                File["${master_queue_venv}/run_pulse_publisher.sh"],
                ],
            enable => true,
            ensure => running;
    }
}
