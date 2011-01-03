$location = "mv"
$level = "production"

$puppetServer = "${location}-${level}-puppet.build.mozilla.org"

import "base/*"
import "includes/*"
import "os/*"
import "classes/*"
import "build/*"
import "packages/*"

# module imports
import "buildslave"

### Node definitions

node "linux-ix-ref.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave02.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave03.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave04.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave05.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave06.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave07.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave08.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave09.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave10.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave11.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave12.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave13.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave14.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave15.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave16.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave17.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave18.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave19.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave20.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave21.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave22.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave23.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave03.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave04.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave05.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave06.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave07.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave08.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave09.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave10.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave11.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave12.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave13.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave14.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave15.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave16.build.mozilla.org" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "moz2-darwin9-slave29.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave30.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave31.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave32.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave33.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave34.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave35.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave36.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin9-slave37.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave20.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave21.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave22.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave23.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave24.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave25.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave26.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave27.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave28.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "try-mac-slave29.build.mozilla.org" inherits "darwin9-i386-build" {
    include buildslave
}

node "moz2-darwin10-ref.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave40.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave41.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave42.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave43.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave44.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave45.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave46.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave47.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave48.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave49.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave50.build.mozilla.org" inherits "darwin10-i386-build" {
    include buildslave
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

node "talos-r3-fed-051.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-052.build.mozilla.org" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-053.build.mozilla.org" inherits "fedora12-i686-test" {
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

node "talos-r3-fed64-051.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-052.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-053.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-054.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-055.build.mozilla.org" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-leopard-ref.build.mozilla.org" inherits "darwin9-i386-test" {
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

node "talos-r3-leopard-051.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-052.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-053.build.mozilla.org" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-snow-ref.build.mozilla.org" inherits "darwin10-i386-test" {
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

node "talos-r3-snow-051.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-052.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-053.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-054.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-055.build.mozilla.org" inherits "darwin10-i386-test" {
    include talosslave
}

node "byob-repack01.build.mozilla.org" inherits "byob-repack" {
    include byob-repackslave
}

node "byob-repack02.build.mozilla.org" inherits "byob-repack" {
    include byob-repackslave
}

node "byob-repack03.build.mozilla.org" inherits "byob-repack" {
    include byob-repackslave
}

node "byob-repack04.build.mozilla.org" inherits "byob-repack" {
    include byob-repackslave
}

node "byob-repack05.build.mozilla.org" inherits "byob-repack" {
    include byob-repackslave
}

node default {
    #include base
}

