# site.pp

import "os/*"
import "classes/*"
import "build/*"
import "packages/*"


### Node definitions

node "moz2-linux-slave01.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave02.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave05.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave06.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave07.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave08.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave09.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave10.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave11.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave12.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave13.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave14.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave15.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave16.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave18.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave19.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave20.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave21.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave22.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave23.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave24.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave25.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "try-linux-slave01.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave02.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave03.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "sm-try-linux-slave04.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave06.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave07.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave08.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave09.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave10.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave11.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave12.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave13.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave14.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave15.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave16.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave17.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave18.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node "try-linux-slave19.mozilla.org" {
    include base, buildslave, cltbld, sandbox-network
}

node default {
    #include base
}

