node "slave" {
    $configExt = ""
}

node "build" inherits "slave" {
    $slaveType = "build"
    include location
    $platform_httproot = $location::platform_httproot
    $platform_fileroot = $location::platform_fileroot
    $local_httproot = $location::local_httproot
    $local_fileroot = $location::local_fileroot
    include base, packages::puppet-config, ntp
}

node "centos" inherits "build" {
    include cltbld
    # This is required by the packages::install_rpm define
    # It would be nice to include packages from define itself, but this
    # sometimes leads to dependency cycles, which as near as I (catlee) can
    # tell, are caused by http://projects.puppetlabs.com/issues/2423.
    # This is supposedly fixed in puppet 0.25, so worth revisiting this once we
    # upgrade
    include packages, root-user
}

node "centos5-i686-build" inherits "centos" {
}

node "centos5-x86_64-build" inherits "centos" {
}

node "darwin-build" inherits "build" {
}

node "darwin9-i386-build" inherits "darwin-build" {
}

node "darwin10-i386-build" inherits "darwin-build" {
}

node "byob-repack" inherits "darwin10-i386-build" {
}

node "test" inherits "slave" {
    $slaveType = "test"
    include location
    $platform_httproot = $location::platform_httproot
    $platform_fileroot = $location::platform_fileroot
    $local_httproot = $location::local_httproot
    $local_fileroot = $location::local_fileroot
    include packages::puppet-config, ntp
}

node "fedora" inherits "test" {
    include root-user
}

node "fedora12-i686-test" inherits "fedora" {
}

node "fedora12-x86_64-test" inherits "fedora" {
}

node "darwin-test" inherits "test" {
}

node "darwin9-i386-test" inherits "darwin-test" {
}

node "darwin10-i386-test" inherits "darwin-test" {
}

# These nodes are only used for non-MPT based slaves. When they first come up
# they will connect to the MPT puppet server. These classes will make sure
# they get redirected to their correct server.
node "mv-node" {
    $configExt = ".mv"
}

node "mv-build-node" inherits "mv-node" {
    $slaveType = "build"
    include location
    $local_fileroot = $location::local_fileroot
    include packages::puppet-config
}

node "mv-test-node" inherits "mv-node" {
    $slaveType = "test"
    include location
    $local_fileroot = $location::local_fileroot
    include packages::puppet-config
}

node "scl-node" {
    $configExt = ".scl"
}

node "scl-build-node" inherits "scl-node" {
    $slaveType = "build"
    include location
    $local_fileroot = $location::local_fileroot
    include packages::puppet-config
}

node "scl-test-node" inherits "scl-node" {
    $slaveType = "test"
    include location
    $local_fileroot = $location::local_fileroot
    include packages::puppet-config
}
node "stage-and-aus2-server" {
    $slaveType = "stage"
    include location
    $platform_httproot = $location::platform_httproot
    $platform_fileroot = $location::platform_fileroot
    $local_httproot = $location::local_httproot
    $local_fileroot = $location::local_fileroot
    include stagelayout, stage-rpms, stageaus2, root-pw
}

node "staging-node" {
    $configExt = ".staging"
}

node "staging-build-node" inherits "staging-node" {
    $slaveType = "build"
    include location
    $local_fileroot = $location::local_fileroot
    include packages::puppet-config
}

node "staging-test-node" inherits "staging-node" {
    $slaveType = "test"
    include location
    $local_fileroot = $location::local_fileroot
    include packages::puppet-config
}

