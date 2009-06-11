# site.pp

import "os/*"
import "classes/*"
import "build/*"
import "packages/*"


### Site-wide global variables below
$universalhome = "puppet://staging-puppet.build.mozilla.org/home/"
$fileroot = "puppet://staging-puppet.build.mozilla.org/"
#########

### Node definitions

node "moz2-linux-slave04.build.mozilla.org" {
    include base, buildslave, cltbld
}

node default {
    #include base
}

