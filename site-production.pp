# site.pp

import "os/*"
import "classes/*"
import "build/*"
import "packages/*"
import "ssh-keys/*"

$puppetServer = "production-puppet.build.mozilla.org"
$fileroot = "puppet://${puppetServer}/"
$httproot = "http://${puppetServer}/"

### Node definitions

node "linux-ref-platform.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

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

node "moz2-linux-slave26.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave27.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave28.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave29.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave30.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave31.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave32.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave33.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave34.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave35.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave36.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave37.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave38.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave39.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave40.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave41.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave42.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave43.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave44.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave45.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave46.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave47.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave48.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave49.build.mozilla.org" {
    include base, buildslave, cltbld, build-network
}

node "moz2-linux-slave50.build.mozilla.org" {
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

node "bm-mini-build-ref.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-staging-keys
}

node "moz2-darwin9-slave02.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave05.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave06.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave07.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave09.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave10.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave11.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave12.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave13.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave14.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave15.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave16.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave17.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave18.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave19.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave20.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave21.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave22.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave23.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave24.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave25.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "moz2-darwin9-slave26.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "bm-xserve07.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "bm-xserve09.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "bm-xserve11.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "bm-xserve12.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "bm-xserve16.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "bm-xserve17.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "bm-xserve18.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "bm-xserve19.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "bm-xserve21.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}
node "bm-xserve22.build.mozilla.org" {
    include base, buildslave, build-network, mac-build-network-keys
}

node "try-mac-slave01.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave02.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave03.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave04.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave06.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave07.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave08.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave09.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave10.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave11.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave12.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave13.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave14.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave15.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave16.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave17.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave18.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node "try-mac-slave19.mozilla.org" {
    include base, buildslave, sandbox-network, mac-try-keys
}

node default {
    #include base
}

