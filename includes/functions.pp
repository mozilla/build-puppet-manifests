define install_rpm($creates, $version) {
    # This check will mark a package as installed if the file or directory it
    # creates already exists. It is intended to only be run for packages that
    # are not installed yet (eg, isn't run for packages getting an updated
    # version). check-for-rpm.sh handles marking it as installed, if necessary.
    # The onlyif will ensure that this is only run for packages which do not
    # have any version installed.
    exec {
        "check-for-${name}":
            command => "/usr/local/bin/check-for-rpm.sh ${platform_httproot}/RPMs/${name}-${version}.${hardwaremodel}.rpm ${creates}",
            onlyif => "/bin/bash -c '! /bin/rpm -ql ${name}'",
            require => File["/usr/local/bin/check-for-rpm.sh"]
    }
    package {
        "${name}":
            provider => "rpm",
            ensure => "${version}",
            source => "${platform_httproot}/RPMs/${name}-${version}.${hardwaremodel}.rpm",
            require => Exec["check-for-${name}"]
    }
}

define install_dmg($creates) {
    # This check serves the same purpose as the one above, but simplified
    # because there's no upgrade case to worry about with the pkgdmg provider.
    exec {
        "check-for-${name}":
            command => "/usr/local/bin/check-for-package.sh ${name} ${creates}",
            creates => "/var/db/.puppet_pkgdmg_installed_${name}",
            require => File["/usr/local/bin/check-for-package.sh"];
    }
    case $operatingsystemrelease {
        "9.2.0", "9.8.0": {
            package {
                "${name}":
                    provider => pkgdmg,
                    ensure => installed,
                    source => "${platform_httproot}/DMGs/${name}",
                    require => Exec["check-for-${name}"];
            }
        }
        "10.2.0": {
            package {
                "${name}":
                    provider => pkgdmg,
                    ensure => installed,
                    source => "${platform_httproot}/DMGs/${name}",
                    require => [Exec["check-for-${name}"], File["pkgdmg.rb"]];
            }
        }
    }
}

define setup_master($master_dir, $master_cfg, $config_link, $masterconfig_link, $master_pretty_name, $master_url, $config_dir) {
    $full_master_dir = "/builds/buildbot/$master_dir"
    exec {
    "buildbotcustom-$master_dir":
        command => "/tools/python/bin/hg clone -r buildbot-0.8.0 http://hg.mozilla.org/build/buildbotcustom",
        onlyif => "/usr/bin/test ! -d $full_master_dir/buildbotcustom",
        user => "cltbld",
        group => "cltbld",
        cwd => $full_master_dir;

    "buildbot-configs-$master_dir":
        command => "/tools/python/bin/hg clone http://hg.mozilla.org/build/buildbot-configs",
        onlyif => "/usr/bin/test ! -d $full_master_dir/buildbot-configs",
        user => "cltbld",
        group => "cltbld",
        cwd => $full_master_dir;

    "virtualenv-$master_dir":
        command => "/tools/python-2.6.5/bin/virtualenv --distribute --no-site-packages $full_master_dir",
        user => "cltbld",
        group => "cltbld",
        onlyif => "/usr/bin/test ! -d $full_master_dir/bin";

    "twisted-$master_dir":
        command => "$full_master_dir/bin/pip install Twisted==10",
        user => "cltbld",
        group => "cltbld",
        require => Exec["virtualenv-$master_dir"],
        onlyif => "/usr/bin/test ! -d $full_master_dir/lib/python2.6/site-packages/twisted";

    "jinja2-$master_dir":
        command => "$full_master_dir/bin/pip install Jinja2",
        user => "cltbld",
        group => "cltbld",
        require => Exec["virtualenv-$master_dir"],
        onlyif => "/usr/bin/test ! -d $full_master_dir/lib/python2.6/site-packages/jinja2";

    "sqlalchemy-$master_dir":
        command => "$full_master_dir/bin/pip install sqlalchemy",
        user => "cltbld",
        group => "cltbld",
        require => Exec["virtualenv-$master_dir"],
        onlyif => "/usr/bin/test ! -d $full_master_dir/lib/python2.6/site-packages/sqlalchemy";

    "argparse-$master_dir":
        command => "$full_master_dir/bin/pip install argparse",
        user => "cltbld",
        group => "cltbld",
        require => Exec["virtualenv-$master_dir"],
        onlyif => "/usr/bin/test ! -d $full_master_dir/lib/python2.6/site-packages/argparse";

    "pycrypto-$master_dir":
        command => "$full_master_dir/bin/pip install pycrypto",
        user => "cltbld",
        group => "cltbld",
        require => Exec["virtualenv-$master_dir"],
        onlyif => "/usr/bin/test ! -d $full_master_dir/lib/python2.6/site-packages/pycrypto";

    "pyasn1-$master_dir":
        command => "$full_master_dir/bin/pip install pyasn1",
        user => "cltbld",
        group => "cltbld",
        require => Exec["virtualenv-$master_dir"],
        onlyif => "/usr/bin/test ! -d $full_master_dir/lib/python2.6/site-packages/pyasn1";

    "mysql-python-$master_dir":
        command => "$full_master_dir/bin/pip install mysql-python",
        user => "cltbld",
        group => "cltbld",
        onlyif => "/usr/bin/test ! -d $full_master_dir/lib/python2.6/site-packages/mysql-python",
        require => [Exec["virtualenv-$master_dir"], Package["mysql-devel"]];

    "pyopenssl-$master_dir":
        command => "$full_master_dir/bin/pip install pyopenssl",
        user => "cltbld",
        group => "cltbld",
        require => Exec["virtualenv-$master_dir"],
        onlyif => "/usr/bin/test ! -d $full_master_dir/lib/python2.6/site-packages/pyopenssl";

    "buildbot-$master_dir":
        command => "/tools/python/bin/hg clone http://hg.mozilla.org/build/buildbot",
        user => "cltbld",
        group => "cltbld",
        onlyif => "/usr/bin/test ! -d $full_master_dir/buildbot",
        cwd => $full_master_dir;

    "install_buildbot-$master_dir":
        command => "$full_master_dir/bin/python setup.py install",
        user => "cltbld",
        group => "cltbld",
        cwd => "$full_master_dir/buildbot/master",
        onlyif => "/usr/bin/test ! -f $full_master_dir/bin/buildbot",
        require => [Exec["buildbot-$master_dir"], Exec["virtualenv-$master_dir"], Exec["twisted-$master_dir"], Exec["jinja2-$master_dir"], Exec["sqlalchemy-$master_dir"], Exec["argparse-$master_dir"], Exec["pycrypto-$master_dir"], Exec["pyasn1-$master_dir"], Exec["mysql-python-$master_dir"], Exec["pyopenssl-$master_dir"]];

    "startup_file-$master_dir":
        command => "/bin/echo $full_master_dir > /etc/default/buildbot.d/$master_dir",
        onlyif => "/usr/bin/test ! -f /etc/default/buildbot.d/$master_dir",
        require => File["/etc/default/buildbot.d"];
    }
    file {
    "$full_master_dir":
        ensure => directory,
        owner => "cltbld",
        group => "cltbld",
        mode => 755;

    "$full_master_dir/master":
        ensure => directory,
        owner => "cltbld",
        group => "cltbld",
        mode => 755;

    "$full_master_dir/master/master.cfg":
        ensure => "$full_master_dir/buildbot-configs/$config_dir/$master_cfg",
        owner => "cltbld",
        group => "cltbld",
        force => true;

    "$full_master_dir/master/localconfig.py":
        ensure => "$full_master_dir/buildbot-configs/$config_dir/$config_link",
        owner => "cltbld",
        group => "cltbld",
        force => true;

    "$full_master_dir/master/master_localconfig.py":
        ensure => "$full_master_dir/buildbot-configs/$config_dir/$masterconfig_link",
        owner => "cltbld",
        group => "cltbld",
        force => true;

    "$full_master_dir/master/buildbot.tac":
        ensure => "$full_master_dir/buildbot.tac",
        owner => "cltbld",
        group => "cltbld",
        force => true;

    "$full_master_dir/buildbot.tac":
        owner => "cltbld",
        group => "cltbld",
        source => "${platform_fileroot}/buildbot/buildbot.tac";

    "$full_master_dir/master/BuildSlaves.py":
        owner => "cltbld",
        group => "cltbld",
        source => "${platform_fileroot}/buildbot/$config_dir/BuildSlaves.py";

    "$full_master_dir/master/passwords.py":
        owner => "cltbld",
        group => "cltbld",
            mode => 600,
        source => "${platform_fileroot}/buildbot/passwords.py";

    "$full_master_dir/lib/python2.6/site-packages/buildbotcustom":
        ensure => "$full_master_dir/buildbotcustom",
        force => true;

    "$full_master_dir/master/master_common.py":
        ensure => "$full_master_dir/buildbot-configs/$config_dir/master_common.py",
        owner => "cltbld",
        group => "cltbld";

    "$full_master_dir/master/config.py":
        ensure => "$full_master_dir/buildbot-configs/$config_dir/config.py",
        owner => "cltbld",
        group => "cltbld";

    "$full_master_dir/Makefile":
        source => "${platform_fileroot}/buildbot/Makefile",
        owner => "cltbld",
        group => "cltbld";


        "/home/cltbld/.${master_dir}_update_from_files.conf":
        content => template("/N/${level}/${os}-${hardwaremodel}/${slaveType}/home/cltbld/.bbcustom_update_from_files.conf.erb"),
        owner => "cltbld",
        group => "cltbld",
        mode => 600;

        "/etc/cron.d/$master_dir":
        content => template("/etc/puppet/manifests/templates/master-crontab.erb"),
        owner => "root",
        group => "root",
        mode => 600;

    }
}
