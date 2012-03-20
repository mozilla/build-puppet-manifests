# Set up a particular buildbot master instance
# The master information must already be in production-masters.json and setup-masters.py
#
# $basedir refers to the name of the directory under $master_basedir
# (/builds/buildbot) where the master's files will live. It corresponds to the
# 'basedir' key in the masters json.
#
# The master's name must reference one of the masters supported by setup-masters.py
#
# $master_type must be one of 'build', 'try', 'tests', or 'scheduler'
#
# TODO: Discover http_port from json?
# TODO: determine master_type from json?
define buildmaster::buildbot_master($basedir, $master_type, $http_port) {
    include buildmaster
    $master_group = $buildmaster::master_group
    $master_user = $buildmaster::master_user
    $master_basedir = $buildmaster::master_basedir

    $master_name = $name
    $full_master_dir = "$master_basedir/$basedir"
    $python_package_dir = "$httproot/python-packages"
    
    # Different types of masters require different BuildSlaves.py files
    case $master_type {
        'build': {
            $buildslaves_template = 'BuildSlaves-build.py.erb'
        }
        'try': {
            $buildslaves_template = 'BuildSlaves-try.py.erb'
        }
        'tests': {
            $buildslaves_template = 'BuildSlaves-tests.py.erb'
        }
        'scheduler': {
            $buildslaves_template = undef
        }
    }

    if ($buildslaves_template) {
        file {
            "$full_master_dir/master/BuildSlaves.py":
                require => Exec["setup-$basedir"],
                owner => $master_user,
                group => $master_group,
                mode => 600,
                content => template("buildmaster/$buildslaves_template");
        }
    }
            
    file {
        "$full_master_dir/master/passwords.py":
            require => Exec["setup-$basedir"],
            owner => $master_user,
            group => $master_group,
            mode => 600,
            content => template("buildmaster/passwords.py.erb");

        "$full_master_dir/master/postrun.cfg":
            require => Exec["setup-$basedir"],
            owner => $master_user,
            group => $master_group,
            mode => 600,
            content => template("buildmaster/postrun.cfg.erb");

        "/etc/default/buildbot.d/$basedir":
            content => $full_master_dir,
            require => [
                File["/etc/default/buildbot.d"],
                Exec["setup-$basedir"],
                ];

        "/tools":
            ensure => "directory";

        "/etc/cron.d/$master_name":
            require => Exec["setup-$basedir"],
            owner => "root",
            group => "root",
            mode => 600,
            content => template("buildmaster/buildmaster-cron.erb");
    }
    exec {
        "setup-$basedir":
            require => [
                Exec["clone-configs"],
                Package["python26"],
                Package["mysql-devel"],
                Package["python26-virtualenv"],
                Package["mercurial"]
                ],
            command => "/bin/bash -c '\$HG pull -u && make -f Makefile.setup all BASEDIR=$full_master_dir MASTER_NAME=$master_name'",
            creates => "$full_master_dir/master",
            user => $master_user,
            logoutput => on_failure,
            environment => [
                "HG=/usr/bin/hg",
                "VIRTUALENV=/usr/bin/virtualenv-2.6",
                "PYTHON=/usr/bin/python2.6",
                "PIP_DOWNLOAD_CACHE=$master_basedir/pip_cache",
                "PIP_FLAGS=--no-deps --no-index --find-links=$python_package_dir",
                "MASTERS_JSON=http://hg.mozilla.org/build/tools/raw-file/default/buildfarm/maintenance/production-masters.json",
            ],
            cwd => "$master_basedir/buildbot-configs";
    }
}
