# site.pp

import "os/*"
import "classes/*"
import "build/*"
import "packages/*"


### Node definitions

node "moz2-linux-slave04.build.mozilla.org" {
    include base, buildslave, cltbld
}

node default {
    #include base
}

