# NB that selfserve-agent.ini still needs to be created manually since we
# don't have a way of managing all the branch definitions
class selfserve-agent {
    $plugins_dir = $nagios::service::plugins_dir
    $nagios_etcdir = $nagios::service::etcdir
    $selfserve_dir = "/builds/buildbot/selfserve-agent"
    $python_package_dir = "$httproot/python-packages"
    file {
        "/etc/init.d/selfserve-agent":
            source => "puppet:///modules/selfserve-agent/selfserve-agent.initd",
            mode => 755,
            owner => "root",
            group => "root";
        "$nagios_etcdir/nrpe.d/selfserve-agent.cfg":
            content => template("selfserve-agent/selfserve-agent.cfg.erb"),
            notify => Service["nrpe"],
            require => Class["nagios"],
            mode => 644,
            owner => "root",
            group => "root";
        "$selfserve_dir/run_agent.sh":
            require => Python::Virtualenv[$selfserve_dir],
            content => template("selfserve-agent/run_agent.sh.erb"),
            mode => 755,
            owner => "cltbld",
            group => "cltbld";
        # For virtualenv
        "/tools":
            ensure => directory,
            mode => 755,
            owner => "root",
            group => "root";
    }
    service {
        "selfserve-agent":
            require => [
                    File["/etc/init.d/selfserve-agent"],
                    File["$selfserve_dir/run_agent.sh"],
                    Exec["install-buildapi"],
                    ],
            ensure => running,
            enable => true;
    }
    python::virtualenv {
        $selfserve_dir:
            user => "cltbld",
            group => "cltbld",
            python => "/usr/bin/python2.6",
            packages => [
                "buildbot==0.8.4-pre-moz1",
                "Twisted==10.1.0",
                "zope.interface==3.6.1"
                ];
    }
    exec {
        # Clone/install buildapi itself
        "clone-buildapi":
            require => [
                        Package["mercurial"],
                        Python::Virtualenv[$selfserve_dir],
                       ],
            creates => "$selfserve_dir/buildapi",
            command => "/usr/bin/hg clone http://hg.mozilla.org/build/buildapi $selfserve_dir/buildapi",
            user => "cltbld";
        "install-buildapi":
            require => Exec["clone-buildapi"],
            creates => "$selfserve_dir/lib/python2.6/site-packages/buildapi.egg-link",
            command => "$selfserve_dir/bin/pip install --no-index --find-links=$python_package_dir --download-cache=pip_cache -e buildapi",
            cwd => $selfserve_dir,
            user => "cltbld";
    }
}
