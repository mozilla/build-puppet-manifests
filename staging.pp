$level = "staging"
$puppetServer = "${level}-puppet.build.mozilla.org"

import "secrets.pp"
import "base/*"
import "includes/*"
import "os/*"
import "classes/*"
import "build/*"
import "stage/*"

# module imports
import "buildslave"
import "gui"

### Node definitions

node "linux-ix-slave03" inherits "centos5-i686-build" {
    include staging-buildslave, ix
}

node "linux-ix-slave04" inherits "centos5-i686-build" {
    include staging-buildslave, ix
}

node "linux-ix-slave05" inherits "centos5-i686-build" {
    include staging-buildslave, ix
}

node "linux64-ix-slave01" inherits "centos5-x86_64-build" {
    include staging-buildslave, ix
}

node "linux64-ix-slave02" inherits "centos5-x86_64-build" {
    include staging-buildslave, ix
}

node "talos-r4-snow-046" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r3-fed-001" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-002" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed64-010" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r4-lion-001" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}
