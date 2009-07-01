# site.pp

import "os/*"
import "classes/*"
import "build/*"
import "packages/*"


### Node definitions

node "moz2-linux-slave01.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave02.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave05.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave06.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave07.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave08.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave09.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave10.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave11.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave12.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave13.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave14.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave15.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave16.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave18.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave19.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave20.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave21.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave22.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave23.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave24.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-linux-slave25.build.mozilla.org" {
    include base, buildslave, cltbld
}

node default {
    #include base
}

