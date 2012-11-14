# top level manifest for buildbot master puppet master
# symlink as site.pp, or set manifests = buildmaster-production.pp in
# puppet.conf

# For passwords, etc.
import "secrets.pp"

$puppetServer = "master-puppet1.build.scl1.mozilla.com"
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
    # The packages module includes a file we require for some other checks
    # on CentOS. There's no equivalent necessary on Mac.
    case $operatingsystem {
        CentOS: {
            include packages
        }
    }
    include ntp
}

node "buildbot-master04" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm04-tests1-macosx":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-macosx";
    }
}

node "buildbot-master06" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm06-tests1-macosx":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-macosx";
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
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm10-tests1-tegra":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-tegra";
    }
}

node "buildbot-master11" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm11-tests1-macosx":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-macosx";
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
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm17-tests1-linux":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-linux";
    }
}

node "buildbot-master18" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm18-tests1-linux":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-linux";
    }
}

node "buildbot-master19" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm19-tests1-tegra":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-tegra";
    }
}

node "buildbot-master20" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm20-tests1-tegra":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-tegra";
    }
}

node "buildbot-master21" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm21-tests1-macosx":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-macosx";
    }
}

node "buildbot-master22" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm22-tests1-tegra":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-tegra";
    }
}

node "buildbot-master23" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm23-tests1-windows":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-windows";
    }
}

node "buildbot-master24" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm24-tests1-linux":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-linux";
    }
}

node "buildbot-master25" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm25-build1":
            http_port => 8001,
            master_type => "build",
            basedir => "build1";
    }
}

node "buildbot-master26" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm26-build1":
            http_port => 8001,
            master_type => "build",
            basedir => "build1";
    }
}

node "buildbot-master27" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm27-try1":
            http_port => 8101,
            master_type => "try",
            basedir => "try1";
    }
}

node "buildbot-master29" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm29-tests1-panda":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-panda";
    }
}

node "buildbot-master30" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm30-build1":
            http_port => 8001,
            master_type => "build",
            basedir => "build1";
    }
}

node "buildbot-master31" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm31-try1":
            http_port => 8101,
            master_type => "try",
            basedir => "try1";
    }
}

node "buildbot-master32" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm32-build1":
            http_port => 8001,
            master_type => "build",
            basedir => "build1";
    }
}

node "buildbot-master33" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm33-try1":
            http_port => 8101,
            master_type => "try",
            basedir => "try1";
    }
}

node "buildbot-master34" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm34-build1":
            http_port => 8001,
            master_type => "build",
            basedir => "build1";
    }
}

node "buildbot-master35" inherits "masternode" {
    $num_masters = 2
    buildmaster::buildbot_master {
        "bm35-try1":
            http_port => 8101,
            master_type => "try",
            basedir => "try1";
    }
    buildmaster::buildbot_master {
        "bm35-build1":
            http_port => 8001,
            master_type => "build",
            basedir => "build1";
    }
}

node "buildbot-master36" inherits "masternode" {
    $num_masters = 2
    # The build and test schedulers run on here, but they aren't managed by puppet
    # so install all the prereqs of buildbot, but don't actually instantiate any masters
    include buildmaster

    # The selfserve agent runs here too
    include selfserve-agent
}

node "dev-master01" inherits "masternode" {
    $num_masters = 0
    # This is a development machine
    # Install all the prereqs of buildbot, but don't actually instantiate any masters
    include buildmaster

    # use LDAP and SSH keys for user-specific logins
    include userlogins

    mount {
        "builds":
            name   => "/builds",
            atboot => true,
            device => "/dev/vdb1",
            ensure => "mounted",
            fstype => "ext3",
    }
}

node "preproduction-master" inherits "masternode" {
    $num_masters = 0
    # This is a preproduction machine
    # Install all the prereqs of buildbot, but don't actually instantiate any masters
    include buildmaster
}

node "releng-mirror01" inherits "masternode" {
    include releng::master

    # use LDAP and SSH keys for user-specific logins
    include userlogins

    mozilla-mirror {
        "mozilla-prereleases": ;
    }
}

node "redis01" inherits "masternode" {
    include releng::master
    # use LDAP and SSH keys for user-specific logins
    include userlogins
    include redis
}

node "buildapi01" inherits "masternode" {
    include releng::master
    # use LDAP and SSH keys for user-specific logins
    include userlogins
    include buildapi
}

node "signing1" inherits "masternode" {
    $signing_formats = ["gpg", "signcode", "mar", "jar", "b2gmar"]
    include releng::master
    include signingserver
}

node "signing2" inherits "masternode" {
    $signing_formats = ["gpg", "signcode", "mar", "jar", "b2gmar"]
    include releng::master
    include signingserver
}

node "signing3" inherits "masternode" {
    $signing_formats = ["gpg", "signcode", "mar", "jar", "b2gmar"]
    include releng::master
    include signingserver
}

node "mac-signing1" inherits "masternode" {
    $signing_formats = ["gpg", "dmg", "mar"]
    include releng::master
    include signingserver
}

node "mac-signing2" inherits "masternode" {
    $signing_formats = ["gpg", "dmg", "mar"]
    include releng::master
    include signingserver
}

node "mac-signing3" inherits "masternode" {
    $signing_formats = ["gpg", "dmg", "mar"]
    include releng::master
    include signingserver
}

node "mac-signing4" inherits "masternode" {
    $signing_formats = ["gpg", "dmg", "mar"]
    include releng::master
    include signingserver
}

node "buildbot-master37" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm37-tests1-macosx":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-macosx";
    }
 }
    
node "buildbot-master38" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm38-tests1-macosx":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-macosx";
    }   
 }
    
node "buildbot-master39" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm39-tests1-panda":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-panda";
    }
 }

node "buildbot-master40" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm40-tests1-panda":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-panda";
    }
 }
 
node "buildbot-master41" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm41-tests1-panda":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-panda";
    }
 }
 
node "buildbot-master42" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm42-tests1-panda":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-panda";
    }
 }
 
node "buildbot-master43" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm43-tests1-panda":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-panda";
    }
 }
 
node "buildbot-master44" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm44-tests1-panda":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-panda";
    }
 }
 
node "buildbot-master45" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm45-tests1-panda":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-panda";
    }
 }
 
node "buildbot-master46" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm46-tests1-panda":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-panda";
    }
 }
 
node "buildbot-master47" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm47-tests1-panda":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-panda";
    }
 }
 
node "buildbot-master48" inherits "masternode" {
    $num_masters = 1
    buildmaster::buildbot_master {
        "bm48-tests1-panda":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1-panda";
    }
 }
