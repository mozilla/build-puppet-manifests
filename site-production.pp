$location = "production"
$level = "production"

$puppetServer = "${location}-puppet.build.mozilla.org"

import "base/*"
import "includes/*"
import "os/*"
import "classes/*"
import "build/*"
import "packages/*"

### Node definitions

node "linux-ref-platform.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "linux64-ref-platform.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "linux-ix-ref.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "moz2-linux-slave01.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave02.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave05.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave06.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave07.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave08.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave09.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave10.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave11.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave12.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave13.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave14.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave15.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave16.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave18.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave19.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave20.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave21.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave22.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave23.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave24.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave25.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave26.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave27.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave28.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave29.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave30.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave31.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave32.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave33.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave34.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave35.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave36.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave37.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave38.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave39.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave40.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave41.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave42.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave43.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave44.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave45.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave46.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave47.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave48.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave49.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux-slave50.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux64-slave01.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux64-slave02.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux64-slave03.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux64-slave04.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux64-slave05.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux64-slave06.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux64-slave08.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux64-slave09.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux64-slave10.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux64-slave11.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "moz2-linux64-slave12.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "mv-moz2-linux-ix-slave02.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave03.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave04.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave05.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave06.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave07.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave08.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave09.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave10.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave11.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave12.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave13.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave14.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave15.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave16.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave17.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave18.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave19.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave20.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave21.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave22.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave23.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "mv-moz2-linux-ix-slave24.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, ix
}

node "try-linux-slave01.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave02.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-sandbox-network, vm
}

node "try-linux-slave03.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-sandbox-network, vm
}

node "try-linux-slave04.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave06.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave07.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave08.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave09.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave10.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave11.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave12.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave13.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave14.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave15.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave16.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave17.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave18.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave19.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave20.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave21.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave22.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave23.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave24.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux-slave25.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux64-slave01.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux64-slave02.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux64-slave03.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux64-slave04.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "try-linux64-slave05.build.mozilla.org" inherits "centos5-x86_64-build" {
    include buildslave, puppet-files-build-network, vm
}

node "bm-mini-build-ref.build.mozilla.org" {
    include base, buildslave, build-network
}

node "moz2-darwin9-slave02.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave05.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave06.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave07.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave09.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave10.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave11.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave12.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave13.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave14.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave15.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave16.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave17.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave18.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave19.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave20.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave21.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave22.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave23.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave24.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave25.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave26.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave29.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave30.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave31.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave32.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave33.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave34.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave35.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave36.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave37.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave38.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave39.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave40.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave41.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave42.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave43.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave44.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave45.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave46.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave47.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave48.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave49.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave50.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave51.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave52.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave53.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave54.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave55.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave56.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave57.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave58.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave59.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave60.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave61.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave62.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave63.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave64.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave65.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave66.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin9-slave67.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "bm-xserve06.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "bm-xserve07.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "bm-xserve09.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "bm-xserve11.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "bm-xserve12.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "bm-xserve15.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "bm-xserve16.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "bm-xserve17.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "bm-xserve18.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "bm-xserve19.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "bm-xserve21.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}
node "bm-xserve22.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave01.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave02.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave03.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave04.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave06.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave07.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave08.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave09.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave10.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave11.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave12.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave13.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave14.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave15.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave16.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave17.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave18.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave19.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave20.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave21.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave22.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave23.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave24.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave25.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave26.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave27.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave28.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave29.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave30.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave31.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave32.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave33.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave34.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave35.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave36.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave37.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave38.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac-slave39.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac64-slave01.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac64-slave02.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac64-slave03.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac64-slave04.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac64-slave05.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac64-slave06.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac64-slave07.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac64-slave08.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac64-slave09.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "try-mac64-slave10.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-ref.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave05.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave06.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave07.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave08.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave09.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave10.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave11.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave12.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave13.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave14.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave15.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave16.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave17.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave18.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave19.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave20.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave21.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave22.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave23.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave24.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave25.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave26.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave27.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave28.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave29.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave30.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave31.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave32.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave33.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave34.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave35.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave36.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave37.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave38.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave39.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave40.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave41.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave42.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave43.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave44.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave45.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave46.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave47.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave48.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave49.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "moz2-darwin10-slave50.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave, puppet-files-build-network
}

node "talos-r3-fed-ref.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-003.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-004.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-005.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-006.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-007.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-008.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-009.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-010.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-011.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-012.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-013.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-014.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-015.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-016.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-017.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-018.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-019.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-020.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-021.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-022.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-023.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-024.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-025.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-026.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-027.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-028.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-029.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-030.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-031.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-032.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-033.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-034.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-035.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-036.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-037.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-038.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-039.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-040.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-041.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-042.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-043.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-044.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-045.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-046.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-047.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-048.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-049.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-050.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed64-ref.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-003.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-004.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-005.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-006.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-007.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-008.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-009.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-010.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-011.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-012.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-013.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-014.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-015.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-016.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-017.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-018.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-019.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-020.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-021.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-022.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-023.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-024.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-025.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-026.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-027.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-028.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-029.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-030.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-031.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-032.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-033.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-034.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-035.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-036.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-037.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-038.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-039.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-040.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-041.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-042.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-043.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-044.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-045.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-046.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-047.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-048.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-049.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-050.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-leopard-ref.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-001.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-002.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-003.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-004.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-005.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-006.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-007.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-008.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-009.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-010.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-011.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-012.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-013.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-014.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-015.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-016.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-017.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-018.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-019.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-020.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-021.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-022.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-023.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-024.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-025.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-026.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-027.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-028.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-029.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-030.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-031.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-032.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-033.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-034.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-035.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-036.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-037.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-038.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-039.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-040.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-041.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-042.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-043.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-044.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-045.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-046.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-047.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-048.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-049.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-050.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-snow-ref.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-001.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-002.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-003.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-004.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-005.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-006.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-007.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-008.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-009.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-010.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-011.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-012.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-013.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-014.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-015.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-016.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-017.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-018.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-019.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-020.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-021.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-022.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-023.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-024.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-025.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-026.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-027.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-028.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-029.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-030.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-031.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-032.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-033.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-034.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-035.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-036.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-037.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-038.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-039.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-040.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-041.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-042.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-043.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-044.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-045.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-046.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-047.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-048.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-049.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-050.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node default {
    #include base
}

