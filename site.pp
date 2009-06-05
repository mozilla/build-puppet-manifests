# site.pp

import "os/*"
import "classes/*"
import "build/*"
import "packages/*"


### Site-wide global variables below
$universalhome = "puppet://test-mgmt.build.mozilla.org/home/"
$fileroot = "puppet://test-mgmt.build.mozilla.org/"
#########

### Node definitions

node "test-linslave.build.mozilla.org" {
    include base, buildslave, cltbld
}

node "moz2-darwin9-slave08.build.mozilla.org" {
    include base
}

node default {
    #include base
}

