# top level manifest for buildbot master puppet master
# symlink as site.pp, or set manifests = buildmaster-production.pp in
# puppet.conf

# For passwords, etc.
import "secrets.pp"

$puppetServer = "master-puppet1.build.mozilla.org"
$level = "production"
$httproot = "http://${puppetServer}/${level}"

# disable filebuckets - we do not want to keep copies of files that
# puppet overwrites
File { backup => false }

node "masternode" {
    # This is required by the packages::install_rpm define
    # It would be nice to include packages from define itself, but this
    # sometimes leads to dependency cycles, which as near as I (catlee) can
    # tell, are caused by http://projects.puppetlabs.com/issues/2423.
    # This is supposedly fixed in puppet 0.25, so worth revisiting this once we
    # upgrade
    $slaveType = "master"
    include packages
}

node "buildbot-master04" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm04-tests1":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1";
    }
}

node "buildbot-master06" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm06-tests1":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1";
    }
}

node "buildbot-master07" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm07-build1":
            http_port => 8001,
            master_type => "build",
            basedir => "build1";
    }
}

node "buildbot-master08" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm08-build1":
            http_port => 8001,
            master_type => "build",
            basedir => "build1";
    }
}

node "buildbot-master09" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm09-try1":
            http_port => 8101,
            master_type => "try",
            basedir => "try1";
    }
}

node "buildbot-master10" inherits "masternode" {
    $num_masters = 2
    # The build and test schedulers run on here, but they aren't managed by puppet
    # so install all the prereqs of buildbot, but don't actually instantiate any masters
    include buildmaster

    # The selfserve agent runs here too
    include selfserve-agent

    $addonProfile = "/builds/buildbot/tests_scheduler/bin/activate"
    $addonSendchangePort = 9302
    $addonSendchangeUser = "cltbld"
    include addon-sendchanges
}

node "buildbot-master11" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm11-tests1":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1";
    }
}

node "buildbot-master12" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm12-build1":
            http_port => 8001,
            master_type => "build",
            basedir => "build1";
    }
}

node "buildbot-master13" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm13-build1":
            http_port => 8001,
            master_type => "build",
            basedir => "build1";
    }
}

node "buildbot-master14" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm14-try1":
            http_port => 8101,
            master_type => "try",
            basedir => "try1";
    }
}

node "buildbot-master15" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm15-tests1-windows":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-windows";
    }
}

node "buildbot-master16" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm16-tests1-windows":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-windows";
    }
}

node "buildbot-master17" inherits "masternode" {
    $num_masters = 0
    # Nothing allocated to this machine yet
    include buildmaster
}

node "dev-master01" inherits "masternode" {
    $num_masters = 0
    # This is a development machine
    # Install all the prereqs of buildbot, but don't actually instantiate any masters
    include buildmaster

    # use LDAP and SSH keys for user-specific logins
    include mozldap::logins
}

node "releng-mirror01" inherits "masternode" {
    $num_masters = 0
    include releng::master

    # use LDAP and SSH keys for user-specific logins
    include mozldap::logins

    mozilla-mirror {
        "mozilla-prereleases": ;
    }
}
