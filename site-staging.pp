# This should change to mpt-staging at some point
$location = "staging"
$level = "staging"

$puppetServer = "${location}-puppet.build.mozilla.org"

import "base/*"
import "includes/*"
import "os/*"
import "classes/*"
import "build/*"
import "packages/*"

### Node definitions

node "moz2-linux-slave03.build.mozilla.org" inherits "centos5-i686-build" {
    include staging-buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave04.build.mozilla.org" inherits "centos5-i686-build" {
    include staging-buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave17.build.mozilla.org" inherits "centos5-i686-build" {
    include staging-buildslave, puppet-files-build-network, vm
}

node "moz2-linux64-slave07.build.mozilla.org" inherits "centos5-x86_64-build" {
    include base, staging-buildslave, cltbld, build-network, vm
}

node "mv-moz2-linux-ix-slave01.build.mozilla.org" inherits "centos5-i686-build" {
    include base, staging-buildslave, cltbld, build-network, ix
}

node "moz2-linux-slave51.build.mozilla.org" inherits "centos5-i686-build" {
    include staging-buildslave, puppet-files-build-network, vm
}

node "moz2-darwin9-slave03.build.mozilla.org" inherits "darwin9-i386-build" {
    include staging-buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave04.build.mozilla.org" inherits "darwin9-i386-build" {
    include staging-buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave08.build.mozilla.org" inherits "darwin9-i386-build" {
    include staging-buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave01.build.mozilla.org" inherits "darwin10-i386-build" {
    include staging-buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave02.build.mozilla.org" inherits "darwin10-i386-build" {
    include staging-buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave03.build.mozilla.org" inherits "darwin10-i386-build" {
    include staging-buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave04.build.mozilla.org" inherits "darwin10-i386-build" {
    include staging-buildslave, puppet-files-build-network
}

node "bm-xserve14.build.mozilla.org" inherits "darwin9-i386-build" {
    include staging-buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave68.build.mozilla.org" inherits "darwin9-i386-build" {
    include staging-buildslave, puppet-files-build-network
}

node default {
    #include base
}

