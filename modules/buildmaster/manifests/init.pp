# buildmaster class
# include this in your node to have all the base requirements for running a
# buildbot master installed
# To setup a particular instance of a buildbot master, see
# buildmaster::buildbot_master
# 
# buildmaster requires that $num_masters be set on the node prior to including this class
# $num_masters should be a count of how many master instances are on the
# machine, and it used to set up nagios checks appropriately
#
# TODO: munin / ganglia?
# TODO: move $libdir stuff into template?
# TODO: you still have to set up ssh keys!
# TODO: determine num_masters from json (bug 647374)
class buildmaster {
    include master
    include secrets
    $master_user = "cltbld"
    $master_group = "cltbld"
    $master_user_uid = 500
    $master_group_gid = 500
    $master_basedir = "/builds/buildbot"
    if $num_masters == '' {
        fail("you must set num_masters")
    }
    package {
        "python26":
            ensure => "2.6.5-6.el5";
        "python26-virtualenv":
            ensure => "1.5.1-3.el5";
        "mysql-devel":
            ensure => "5.0.77-4.el5_5.5";
        "git":
            ensure => "1.7.4.1-1.el5";
    }
    service {
        "buildbot":
            require => File["/etc/init.d/buildbot"],
            enable => true;
        "nrpe":
            require => [
                Package["nagios-plugins-all"],
                Package["nrpe"]
            ],
            subscribe => File["/etc/nagios/nrpe.cfg"],
            enable => true,
            ensure => running;
    }
    user {
        $master_user:
            require => Group[$master_group],
            ensure => "present",
            name => $master_user,
            uid => $master_user_uid,
            gid => $master_group_gid,
            comment => "Client Builder",
            managehome => true,
            home => "/home/$master_user",
            shell => "/bin/bash",
            password => $secrets::cltbld_password;
    }
    group {
        $master_group:
            ensure => "present",
            name => $master_group,
            gid => $master_group_gid;
    }
    # nrpe.cfg needs to point to an architecture appropriate lib directory
    case $architecture {
        "x86_64": { $libdir = "lib64" }
        default:  { $libdir = "lib" }
    }
    file {
        "/builds":
            ensure => directory,
            owner => $master_user,
            group => $master_group;
        $master_basedir:
            ensure => directory,
            owner => $master_user,
            group => $master_group;
        "/etc/default/buildbot.d/":
            owner => "root",
            group => "root",
            mode => 755,
            ensure => directory;
        "/etc/init.d/buildbot":
            source => "puppet:///modules/buildmaster/buildbot.initd",
            mode => 755,
            owner => "root",
            group => "root";
        "/etc/nagios/nrpe.cfg":
            content => template("buildmaster/nrpe.cfg.erb"),
            owner => "root",
            group => "root";
        "/root/.my.cnf":
            content => template("buildmaster/my.cnf.erb"),
            mode => 600,
            owner => "root",
            group => "root";
    }
    exec {
        "clone-configs":
            creates => "$master_basedir/buildbot-configs",
            command => "/usr/bin/hg clone -r production http://hg.mozilla.org/build/buildbot-configs",
            user => $master_user,
            cwd => $master_basedir;
    }
}
