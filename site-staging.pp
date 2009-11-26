# site.pp

import "os/*"
import "classes/*"
import "build/*"
import "packages/*"
import "ssh-keys/*"

$puppetServer = "staging-puppet.build.mozilla.org"
$fileroot = "puppet://${puppetServer}/"
$httproot = "http://${puppetServer}/"

### Node definitions

node "moz2-linux-slave03.build.mozilla.org" {
    include base, staging-buildslave, cltbld, build-network
}

node "moz2-linux-slave04.build.mozilla.org" {
    include base, staging-buildslave, cltbld, build-network
}

node "moz2-linux-slave17.build.mozilla.org" {
    include base, staging-buildslave, cltbld, build-network
}

node "try-linux-slave05.mozilla.org" {
    include base, staging-buildslave, cltbld, sandbox-network
}

node "moz2-darwin9-slave03.build.mozilla.org" {
    include base, staging-buildslave, build-network
}

node "moz2-darwin9-slave04.build.mozilla.org" {
    include base, staging-buildslave, build-network
}

node "moz2-darwin9-slave08.build.mozilla.org" {
    include base, staging-buildslave, build-network
}

node "bm-xserve14.build.mozilla.org" {
    include base, staging-buildslave, build-network
}

node "try-mac-slave05.mozilla.org" {
    include base, staging-buildslave, sandbox-network
}

node default {
    #include base
}

