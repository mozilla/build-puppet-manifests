$location = "mpt"
$level = "production"

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

node "linux-ref-platform" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "linux64-ref-platform" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "moz2-linux-slave01" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave02" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave05" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave06" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave07" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave08" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave09" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave10" inherits "staging-build-node" {
}

node "moz2-linux-slave11" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave12" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave13" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave14" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave15" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave16" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave18" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave19" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave20" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave21" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave22" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave23" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave24" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave25" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave26" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave27" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave28" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave29" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave30" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave31" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave32" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave33" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave34" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave35" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave36" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave37" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave38" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave39" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave40" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave41" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave42" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave43" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave44" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave45" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave46" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave47" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave48" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave49" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux-slave50" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "moz2-linux64-slave01" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "moz2-linux64-slave02" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "moz2-linux64-slave03" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "moz2-linux64-slave04" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "moz2-linux64-slave05" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "moz2-linux64-slave06" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "moz2-linux64-slave08" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "moz2-linux64-slave09" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "moz2-linux64-slave10" inherits "staging-build-node" {
}

node "moz2-linux64-slave11" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "moz2-linux64-slave12" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "linux-hgwriter-slave01" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "linux-hgwriter-slave02" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave01" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave02" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave03" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave04" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave06" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave07" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave08" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave09" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave10" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave11" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave12" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave13" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave14" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave15" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave16" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave17" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave18" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave19" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave20" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave21" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave22" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave23" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave24" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave25" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave26" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave27" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave28" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave29" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux-slave30" inherits "centos5-i686-build" {
    include buildslave, vm
}

node "try-linux64-slave01" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "try-linux64-slave02" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "try-linux64-slave03" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "try-linux64-slave04" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "try-linux64-slave05" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "try-linux64-slave06" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "try-linux64-slave07" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "try-linux64-slave08" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "try-linux64-slave09" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "try-linux64-slave10" inherits "centos5-x86_64-build" {
    include buildslave, vm
}

node "bm-mini-build-ref" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave01" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave02" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave06" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave07" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave09" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave10" inherits "staging-build-node" {
}

node "moz2-darwin9-slave11" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave12" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave13" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave14" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave15" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave16" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave17" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave18" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave19" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave21" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave22" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave23" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave24" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave25" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave26" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave38" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave39" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave41" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave42" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave43" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave44" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave45" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave46" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave47" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave48" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave49" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave50" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave51" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave52" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave53" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave54" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave55" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave56" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave57" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave58" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave60" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave61" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave62" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave63" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave64" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave65" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave66" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave67" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave69" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave70" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave71" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave72" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve06" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve07" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve08" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve09" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve10" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve11" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve12" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve15" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve16" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve17" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve18" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve19" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve20" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve21" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve22" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve23" inherits "darwin9-i386-build" {
    include buildslave
}

node "bm-xserve24" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave01" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave02" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave03" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave04" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave06" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave07" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave08" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave09" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave10" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave11" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave12" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave13" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave14" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave15" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave16" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave17" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave18" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave19" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave30" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave31" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave32" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave33" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave34" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave35" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave36" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave37" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave38" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave39" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave40" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave41" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave42" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave43" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave44" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave45" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave46" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave47" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac64-slave01" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave02" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave03" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave04" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave05" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave06" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave07" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave08" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave09" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave10" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave11" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave12" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave13" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave14" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave15" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave16" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave17" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave18" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave19" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave20" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave21" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave22" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave23" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave24" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave25" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave26" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave27" inherits "mv-build-node" {
}

node "try-mac64-slave29" inherits "mv-build-node" {
}

node "try-mac64-slave30" inherits "mv-build-node" {
}

node "try-mac64-slave31" inherits "mv-build-node" {
}

node "moz2-darwin10-slave05" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave06" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave07" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave08" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave09" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave10" inherits "staging-build-node" {
}

node "moz2-darwin10-slave11" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave12" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave13" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave14" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave15" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave16" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave17" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave18" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave19" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave20" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave21" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave22" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave23" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave24" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave25" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave26" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave27" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave28" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave29" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave51" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave52" inherits "darwin10-i386-build" {
    include buildslave
}

node "linux-ix-ref" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave02" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave03" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave04" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave05" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave06" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave07" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave08" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave09" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave10" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave11" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave12" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave13" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave14" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave15" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave16" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave17" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave18" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave19" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave20" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave21" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave22" inherits "mv-build-node" {
}

node "mv-moz2-linux-ix-slave23" inherits "mv-build-node" {
}

node "linux-ix-slave06" inherits "scl-build-node" {
}

node "linux-ix-slave07" inherits "scl-build-node" {
}

node "linux-ix-slave08" inherits "scl-build-node" {
}

node "linux-ix-slave09" inherits "scl-build-node" {
}

node "linux-ix-slave10" inherits "scl-build-node" {
}

node "linux-ix-slave11" inherits "scl-build-node" {
}

node "linux-ix-slave12" inherits "scl-build-node" {
}

node "linux-ix-slave13" inherits "scl-build-node" {
}

node "linux-ix-slave14" inherits "scl-build-node" {
}

node "linux-ix-slave15" inherits "scl-build-node" {
}

node "linux-ix-slave16" inherits "scl-build-node" {
}

node "linux-ix-slave17" inherits "scl-build-node" {
}

node "linux-ix-slave18" inherits "scl-build-node" {
}

node "linux-ix-slave19" inherits "scl-build-node" {
}

node "linux-ix-slave20" inherits "scl-build-node" {
}

node "linux-ix-slave21" inherits "scl-build-node" {
}

node "linux-ix-slave22" inherits "scl-build-node" {
}

node "linux-ix-slave23" inherits "scl-build-node" {
}

node "linux-ix-slave24" inherits "scl-build-node" {
}

node "linux-ix-slave25" inherits "scl-build-node" {
}

node "linux-ix-slave26" inherits "scl-build-node" {
}

node "linux-ix-slave27" inherits "scl-build-node" {
}

node "linux-ix-slave28" inherits "scl-build-node" {
}

node "linux-ix-slave29" inherits "scl-build-node" {
}

node "linux-ix-slave30" inherits "scl-build-node" {
}

node "linux-ix-slave31" inherits "scl-build-node" {
}

node "linux-ix-slave32" inherits "scl-build-node" {
}

node "linux-ix-slave33" inherits "scl-build-node" {
}

node "linux-ix-slave34" inherits "scl-build-node" {
}

node "linux-ix-slave35" inherits "scl-build-node" {
}

node "linux-ix-slave36" inherits "scl-build-node" {
}

node "linux-ix-slave37" inherits "scl-build-node" {
}

node "linux-ix-slave38" inherits "scl-build-node" {
}

node "linux-ix-slave39" inherits "scl-build-node" {
}

node "linux-ix-slave40" inherits "scl-build-node" {
}

node "linux-ix-slave41" inherits "scl-build-node" {
}

node "linux-ix-slave42" inherits "scl-build-node" {
}

node "moz2-darwin10-ref" inherits "scl-build-node" {
}

node "moz2-darwin10-slave40" inherits "mv-build-node" {
}

node "moz2-darwin10-slave41" inherits "mv-build-node" {
}

node "moz2-darwin10-slave42" inherits "mv-build-node" {
}

node "moz2-darwin10-slave43" inherits "mv-build-node" {
}

node "moz2-darwin10-slave44" inherits "mv-build-node" {
}

node "moz2-darwin10-slave45" inherits "mv-build-node" {
}

node "moz2-darwin10-slave46" inherits "mv-build-node" {
}

node "moz2-darwin10-slave47" inherits "mv-build-node" {
}

node "moz2-darwin10-slave48" inherits "mv-build-node" {
}

node "moz2-darwin10-slave49" inherits "mv-build-node" {
}

node "moz2-darwin10-slave50" inherits "mv-build-node" {
}

node "moz2-darwin10-slave53" inherits "mv-build-node" {
}

node "moz2-darwin10-slave54" inherits "mv-build-node" {
}

node "moz2-darwin10-slave55" inherits "mv-build-node" {
}

node "moz2-darwin10-slave56" inherits "mv-build-node" {
}

node "talos-r3-fed-ref" inherits "scl-test-node" {
}

node "talos-r3-fed-003" inherits "scl-test-node" {
}

node "talos-r3-fed-004" inherits "scl-test-node" {
}

node "talos-r3-fed-005" inherits "scl-test-node" {
}

node "talos-r3-fed-006" inherits "scl-test-node" {
}

node "talos-r3-fed-007" inherits "scl-test-node" {
}

node "talos-r3-fed-008" inherits "scl-test-node" {
}

node "talos-r3-fed-009" inherits "scl-test-node" {
}

node "talos-r3-fed-010" inherits "staging-test-node" {
}

node "talos-r3-fed-011" inherits "scl-test-node" {
}

node "talos-r3-fed-012" inherits "scl-test-node" {
}

node "talos-r3-fed-013" inherits "scl-test-node" {
}

node "talos-r3-fed-014" inherits "scl-test-node" {
}

node "talos-r3-fed-015" inherits "scl-test-node" {
}

node "talos-r3-fed-016" inherits "scl-test-node" {
}

node "talos-r3-fed-017" inherits "scl-test-node" {
}

node "talos-r3-fed-018" inherits "scl-test-node" {
}

node "talos-r3-fed-019" inherits "scl-test-node" {
}

node "talos-r3-fed-020" inherits "scl-test-node" {
}

node "talos-r3-fed-021" inherits "scl-test-node" {
}

node "talos-r3-fed-022" inherits "scl-test-node" {
}

node "talos-r3-fed-023" inherits "scl-test-node" {
}

node "talos-r3-fed-024" inherits "scl-test-node" {
}

node "talos-r3-fed-025" inherits "scl-test-node" {
}

node "talos-r3-fed-026" inherits "scl-test-node" {
}

node "talos-r3-fed-027" inherits "scl-test-node" {
}

node "talos-r3-fed-028" inherits "scl-test-node" {
}

node "talos-r3-fed-029" inherits "scl-test-node" {
}

node "talos-r3-fed-030" inherits "scl-test-node" {
}

node "talos-r3-fed-031" inherits "scl-test-node" {
}

node "talos-r3-fed-032" inherits "scl-test-node" {
}

node "talos-r3-fed-033" inherits "scl-test-node" {
}

node "talos-r3-fed-034" inherits "scl-test-node" {
}

node "talos-r3-fed-035" inherits "scl-test-node" {
}

node "talos-r3-fed-036" inherits "scl-test-node" {
}

node "talos-r3-fed-037" inherits "scl-test-node" {
}

node "talos-r3-fed-038" inherits "scl-test-node" {
}

node "talos-r3-fed-039" inherits "scl-test-node" {
}

node "talos-r3-fed-040" inherits "scl-test-node" {
}

node "talos-r3-fed-041" inherits "scl-test-node" {
}

node "talos-r3-fed-042" inherits "scl-test-node" {
}

node "talos-r3-fed-043" inherits "scl-test-node" {
}

node "talos-r3-fed-044" inherits "scl-test-node" {
}

node "talos-r3-fed-045" inherits "scl-test-node" {
}

node "talos-r3-fed-046" inherits "scl-test-node" {
}

node "talos-r3-fed-047" inherits "scl-test-node" {
}

node "talos-r3-fed-048" inherits "scl-test-node" {
}

node "talos-r3-fed-049" inherits "scl-test-node" {
}

node "talos-r3-fed-050" inherits "scl-test-node" {
}

node "talos-r3-fed-051" inherits "scl-test-node" {
}

node "talos-r3-fed-052" inherits "scl-test-node" {
}

node "talos-r3-fed-053" inherits "scl-test-node" {
}

node "talos-r3-fed64-ref" inherits "scl-test-node" {
}

node "talos-r3-fed64-003" inherits "scl-test-node" {
}

node "talos-r3-fed64-004" inherits "scl-test-node" {
}

node "talos-r3-fed64-005" inherits "scl-test-node" {
}

node "talos-r3-fed64-006" inherits "scl-test-node" {
}

node "talos-r3-fed64-007" inherits "scl-test-node" {
}

node "talos-r3-fed64-008" inherits "scl-test-node" {
}

node "talos-r3-fed64-009" inherits "scl-test-node" {
}

node "talos-r3-fed64-010" inherits "staging-test-node" {
}

node "talos-r3-fed64-011" inherits "scl-test-node" {
}

node "talos-r3-fed64-012" inherits "scl-test-node" {
}

node "talos-r3-fed64-013" inherits "scl-test-node" {
}

node "talos-r3-fed64-014" inherits "scl-test-node" {
}

node "talos-r3-fed64-015" inherits "scl-test-node" {
}

node "talos-r3-fed64-016" inherits "scl-test-node" {
}

node "talos-r3-fed64-017" inherits "scl-test-node" {
}

node "talos-r3-fed64-018" inherits "scl-test-node" {
}

node "talos-r3-fed64-019" inherits "scl-test-node" {
}

node "talos-r3-fed64-020" inherits "scl-test-node" {
}

node "talos-r3-fed64-021" inherits "scl-test-node" {
}

node "talos-r3-fed64-022" inherits "scl-test-node" {
}

node "talos-r3-fed64-023" inherits "scl-test-node" {
}

node "talos-r3-fed64-024" inherits "scl-test-node" {
}

node "talos-r3-fed64-025" inherits "scl-test-node" {
}

node "talos-r3-fed64-026" inherits "scl-test-node" {
}

node "talos-r3-fed64-027" inherits "scl-test-node" {
}

node "talos-r3-fed64-028" inherits "scl-test-node" {
}

node "talos-r3-fed64-029" inherits "scl-test-node" {
}

node "talos-r3-fed64-030" inherits "scl-test-node" {
}

node "talos-r3-fed64-031" inherits "scl-test-node" {
}

node "talos-r3-fed64-032" inherits "scl-test-node" {
}

node "talos-r3-fed64-033" inherits "scl-test-node" {
}

node "talos-r3-fed64-034" inherits "scl-test-node" {
}

node "talos-r3-fed64-035" inherits "scl-test-node" {
}

node "talos-r3-fed64-036" inherits "scl-test-node" {
}

node "talos-r3-fed64-037" inherits "scl-test-node" {
}

node "talos-r3-fed64-038" inherits "scl-test-node" {
}

node "talos-r3-fed64-039" inherits "scl-test-node" {
}

node "talos-r3-fed64-040" inherits "scl-test-node" {
}

node "talos-r3-fed64-041" inherits "scl-test-node" {
}

node "talos-r3-fed64-042" inherits "scl-test-node" {
}

node "talos-r3-fed64-043" inherits "scl-test-node" {
}

node "talos-r3-fed64-044" inherits "scl-test-node" {
}

node "talos-r3-fed64-045" inherits "scl-test-node" {
}

node "talos-r3-fed64-046" inherits "scl-test-node" {
}

node "talos-r3-fed64-047" inherits "scl-test-node" {
}

node "talos-r3-fed64-048" inherits "scl-test-node" {
}

node "talos-r3-fed64-049" inherits "scl-test-node" {
}

node "talos-r3-fed64-050" inherits "scl-test-node" {
}

node "talos-r3-fed64-051" inherits "scl-test-node" {
}

node "talos-r3-fed64-052" inherits "scl-test-node" {
}

node "talos-r3-fed64-053" inherits "scl-test-node" {
}

node "talos-r3-fed64-054" inherits "scl-test-node" {
}

node "talos-r3-fed64-055" inherits "scl-test-node" {
}

node "talos-r3-leopard-ref" inherits "scl-test-node" {
}

node "talos-r3-leopard-001" inherits "scl-test-node" {
}

node "talos-r3-leopard-002" inherits "scl-test-node" {
}

node "talos-r3-leopard-003" inherits "scl-test-node" {
}

node "talos-r3-leopard-004" inherits "scl-test-node" {
}

node "talos-r3-leopard-005" inherits "scl-test-node" {
}

node "talos-r3-leopard-006" inherits "scl-test-node" {
}

node "talos-r3-leopard-007" inherits "scl-test-node" {
}

node "talos-r3-leopard-008" inherits "scl-test-node" {
}

node "talos-r3-leopard-009" inherits "scl-test-node" {
}

node "talos-r3-leopard-010" inherits "staging-test-node" {
}

node "talos-r3-leopard-011" inherits "scl-test-node" {
}

node "talos-r3-leopard-012" inherits "scl-test-node" {
}

node "talos-r3-leopard-013" inherits "scl-test-node" {
}

node "talos-r3-leopard-014" inherits "scl-test-node" {
}

node "talos-r3-leopard-015" inherits "scl-test-node" {
}

node "talos-r3-leopard-016" inherits "scl-test-node" {
}

node "talos-r3-leopard-017" inherits "scl-test-node" {
}

node "talos-r3-leopard-018" inherits "scl-test-node" {
}

node "talos-r3-leopard-019" inherits "scl-test-node" {
}

node "talos-r3-leopard-020" inherits "scl-test-node" {
}

node "talos-r3-leopard-021" inherits "scl-test-node" {
}

node "talos-r3-leopard-022" inherits "scl-test-node" {
}

node "talos-r3-leopard-023" inherits "scl-test-node" {
}

node "talos-r3-leopard-024" inherits "scl-test-node" {
}

node "talos-r3-leopard-025" inherits "scl-test-node" {
}

node "talos-r3-leopard-026" inherits "scl-test-node" {
}

node "talos-r3-leopard-027" inherits "scl-test-node" {
}

node "talos-r3-leopard-028" inherits "scl-test-node" {
}

node "talos-r3-leopard-029" inherits "scl-test-node" {
}

node "talos-r3-leopard-030" inherits "scl-test-node" {
}

node "talos-r3-leopard-031" inherits "scl-test-node" {
}

node "talos-r3-leopard-032" inherits "scl-test-node" {
}

node "talos-r3-leopard-033" inherits "scl-test-node" {
}

node "talos-r3-leopard-034" inherits "scl-test-node" {
}

node "talos-r3-leopard-035" inherits "scl-test-node" {
}

node "talos-r3-leopard-036" inherits "scl-test-node" {
}

node "talos-r3-leopard-037" inherits "scl-test-node" {
}

node "talos-r3-leopard-038" inherits "scl-test-node" {
}

node "talos-r3-leopard-039" inherits "scl-test-node" {
}

node "talos-r3-leopard-040" inherits "scl-test-node" {
}

node "talos-r3-leopard-041" inherits "scl-test-node" {
}

node "talos-r3-leopard-042" inherits "scl-test-node" {
}

node "talos-r3-leopard-043" inherits "scl-test-node" {
}

node "talos-r3-leopard-044" inherits "scl-test-node" {
}

node "talos-r3-leopard-045" inherits "scl-test-node" {
}

node "talos-r3-leopard-046" inherits "scl-test-node" {
}

node "talos-r3-leopard-047" inherits "scl-test-node" {
}

node "talos-r3-leopard-048" inherits "scl-test-node" {
}

node "talos-r3-leopard-049" inherits "scl-test-node" {
}

node "talos-r3-leopard-050" inherits "scl-test-node" {
}

node "talos-r3-leopard-051" inherits "scl-test-node" {
}

node "talos-r3-leopard-052" inherits "scl-test-node" {
}

node "talos-r3-leopard-053" inherits "scl-test-node" {
}

node "talos-r3-snow-ref" inherits "scl-test-node" {
}

node "talos-r3-snow-001" inherits "scl-test-node" {
}

node "talos-r3-snow-002" inherits "scl-test-node" {
}

node "talos-r3-snow-003" inherits "scl-test-node" {
}

node "talos-r3-snow-004" inherits "scl-test-node" {
}

node "talos-r3-snow-005" inherits "scl-test-node" {
}

node "talos-r3-snow-006" inherits "scl-test-node" {
}

node "talos-r3-snow-007" inherits "scl-test-node" {
}

node "talos-r3-snow-008" inherits "scl-test-node" {
}

node "talos-r3-snow-009" inherits "scl-test-node" {
}

node "talos-r3-snow-010" inherits "staging-test-node" {
}

node "talos-r3-snow-011" inherits "scl-test-node" {
}

node "talos-r3-snow-012" inherits "scl-test-node" {
}

node "talos-r3-snow-013" inherits "scl-test-node" {
}

node "talos-r3-snow-014" inherits "scl-test-node" {
}

node "talos-r3-snow-015" inherits "scl-test-node" {
}

node "talos-r3-snow-016" inherits "scl-test-node" {
}

node "talos-r3-snow-017" inherits "scl-test-node" {
}

node "talos-r3-snow-018" inherits "scl-test-node" {
}

node "talos-r3-snow-019" inherits "scl-test-node" {
}

node "talos-r3-snow-020" inherits "scl-test-node" {
}

node "talos-r3-snow-021" inherits "scl-test-node" {
}

node "talos-r3-snow-022" inherits "scl-test-node" {
}

node "talos-r3-snow-023" inherits "scl-test-node" {
}

node "talos-r3-snow-024" inherits "scl-test-node" {
}

node "talos-r3-snow-025" inherits "scl-test-node" {
}

node "talos-r3-snow-026" inherits "scl-test-node" {
}

node "talos-r3-snow-027" inherits "scl-test-node" {
}

node "talos-r3-snow-028" inherits "scl-test-node" {
}

node "talos-r3-snow-029" inherits "scl-test-node" {
}

node "talos-r3-snow-030" inherits "scl-test-node" {
}

node "talos-r3-snow-031" inherits "scl-test-node" {
}

node "talos-r3-snow-032" inherits "scl-test-node" {
}

node "talos-r3-snow-033" inherits "scl-test-node" {
}

node "talos-r3-snow-034" inherits "scl-test-node" {
}

node "talos-r3-snow-035" inherits "scl-test-node" {
}

node "talos-r3-snow-036" inherits "scl-test-node" {
}

node "talos-r3-snow-037" inherits "scl-test-node" {
}

node "talos-r3-snow-038" inherits "scl-test-node" {
}

node "talos-r3-snow-039" inherits "scl-test-node" {
}

node "talos-r3-snow-040" inherits "scl-test-node" {
}

node "talos-r3-snow-041" inherits "scl-test-node" {
}

node "talos-r3-snow-042" inherits "scl-test-node" {
}

node "talos-r3-snow-043" inherits "scl-test-node" {
}

node "talos-r3-snow-044" inherits "scl-test-node" {
}

node "talos-r3-snow-045" inherits "scl-test-node" {
}

node "talos-r3-snow-046" inherits "scl-test-node" {
}

node "talos-r3-snow-047" inherits "scl-test-node" {
}

node "talos-r3-snow-048" inherits "scl-test-node" {
}

node "talos-r3-snow-049" inherits "scl-test-node" {
}

node "talos-r3-snow-050" inherits "scl-test-node" {
}

node "talos-r3-snow-051" inherits "scl-test-node" {
}

node "talos-r3-snow-052" inherits "scl-test-node" {
}

node "talos-r3-snow-053" inherits "scl-test-node" {
}

node "talos-r3-snow-054" inherits "scl-test-node" {
}

node "talos-r3-snow-055" inherits "scl-test-node" {
}

node "byob-repack01" inherits "mv-build-node" {
}

node "byob-repack02" inherits "mv-build-node" {
}

node "byob-repack03" inherits "mv-build-node" {
}

node "byob-repack04" inherits "mv-build-node" {
}

node "byob-repack05" inherits "mv-build-node" {
}

node "moz2-linux-slave03" inherits "staging-build-node" {
}

node "moz2-linux-slave04" inherits "staging-build-node" {
}

node "moz2-linux-slave17" inherits "staging-build-node" {
}

node "moz2-linux64-slave07" inherits "staging-build-node" {
}

node "mv-moz2-linux-ix-slave01" inherits "staging-build-node" {
}

node "linux-ix-slave01" inherits "staging-build-node" {
}

node "linux-ix-slave02" inherits "staging-build-node" {
}

node "linux-ix-slave03" inherits "staging-build-node" {
}

node "linux-ix-slave04" inherits "staging-build-node" {
}

node "linux-ix-slave05" inherits "staging-build-node" {
}

node "moz2-linux-slave51" inherits "staging-build-node" {
}

node "moz2-darwin9-slave03" inherits "staging-build-node" {
}

node "moz2-darwin9-slave08" inherits "staging-build-node" {
}

node "moz2-darwin10-slave01" inherits "staging-build-node" {
}

node "moz2-darwin10-slave02" inherits "staging-build-node" {
}

node "moz2-darwin10-slave03" inherits "staging-build-node" {
}

node "moz2-darwin10-slave04" inherits "staging-build-node" {
}

node "moz2-darwin9-slave68" inherits "staging-build-node" {
}

node "talos-r3-fed-001" inherits "staging-test-node" {
}

node "talos-r3-fed-002" inherits "staging-test-node" {
}

node "talos-r3-fed64-001" inherits "staging-test-node" {
}

node "talos-r3-fed64-002" inherits "staging-test-node" {
}

node "talos-r4-snow-004" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-005" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-006" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-007" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-008" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-009" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-010" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-011" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-012" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-013" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-014" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-015" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-016" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-017" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-018" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-019" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-020" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-021" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-022" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-023" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-024" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-025" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-026" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-027" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-028" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-029" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-030" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-031" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-032" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-033" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-034" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-035" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-036" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-037" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-038" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-039" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-040" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-041" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-042" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-043" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-044" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-045" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-046" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-047" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-048" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-049" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-050" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-051" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-052" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-053" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-054" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-055" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-056" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-057" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-058" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-059" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-060" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-061" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-062" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-063" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-064" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-065" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-066" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-067" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-068" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-069" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-070" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-071" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-072" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-073" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-074" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-075" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-076" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-077" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-078" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-079" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-080" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "dev-stage01" inherits "stage-and-aus2-server" {
    $deleteCandidatesDirs = '0'
    include stageusergroups
}
