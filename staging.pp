$level = "staging"
$puppetServer = "${level}-puppet.build.mozilla.org"

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

node "ix-vm-test01" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "ix-vm-test02" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "moz2-linux-slave03" inherits "centos5-i686-build" {
    include staging-buildslave, vm
}

node "moz2-linux-slave04" inherits "centos5-i686-build" {
    include staging-buildslave, vm
}

node "moz2-linux-slave10" inherits "centos5-i686-build" {
    include staging-buildslave, vm
}

node "moz2-linux-slave17" inherits "centos5-i686-build" {
    include staging-buildslave, vm
}

node "moz2-linux64-slave07" inherits "centos5-x86_64-build" {
    include staging-buildslave, vm
}

node "moz2-linux64-slave10" inherits "centos5-x86_64-build" {
    include staging-buildslave, vm
}


node "mv-moz2-linux-ix-slave01" inherits "centos5-i686-build" {
    include staging-buildslave, ix
}

node "linux-ix-slave03" inherits "centos5-i686-build" {
    include staging-buildslave, ix
}

node "linux-ix-slave04" inherits "centos5-i686-build" {
    include staging-buildslave, ix
}

node "linux-ix-slave05" inherits "centos5-i686-build" {
    include staging-buildslave, ix
}

node "moz2-linux-slave51" inherits "centos5-i686-build" {
    include staging-buildslave, vm
}

node "moz2-darwin9-slave03" inherits "darwin9-i386-build" {
    include staging-buildslave
}

node "moz2-darwin9-slave08" inherits "darwin9-i386-build" {
    include staging-buildslave
}

node "moz2-darwin9-slave10" inherits "darwin9-i386-build" {
    include staging-buildslave
}

node "moz2-darwin10-slave01" inherits "darwin10-i386-build" {
    include staging-buildslave
}

node "moz2-darwin10-slave02" inherits "darwin10-i386-build" {
    include staging-buildslave
}

node "moz2-darwin10-slave03" inherits "darwin10-i386-build" {
    include staging-buildslave
}

node "moz2-darwin10-slave04" inherits "darwin10-i386-build" {
    include staging-buildslave
}

node "moz2-darwin10-slave10" inherits "darwin10-i386-build" {
    include staging-buildslave
}

node "moz2-darwin9-slave68" inherits "darwin9-i386-build" {
    include staging-buildslave
}

node "talos-r3-fed-001" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-002" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-010" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed64-001" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-002" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-010" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-leopard-001" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-002" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-010" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-snow-001" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-002" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-010" inherits "darwin10-i386-test" {
    include talosslave
}

node default {
    #include base
}

