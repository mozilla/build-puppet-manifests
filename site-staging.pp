# site.pp

import "os/*"
import "classes/*"
import "build/*"
import "packages/*"


### Node definitions

node "moz2-linux-slave03.build.mozilla.org" {
    include base, staging-buildslave, cltbld
}

node "moz2-linux-slave04.build.mozilla.org" {
    include base, staging-buildslave, cltbld
}

node "moz2-linux-slave17.build.mozilla.org" {
    include base, staging-buildslave, cltbld
}

node default {
    #include base
}

