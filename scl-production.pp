$location = "scl"
$level = "production"

$puppetServer = "${location}-${level}-puppet.build.scl1.mozilla.com"

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

node "linux64-ix-ref" inherits "centos5-x86_64-build" {
    include buildslave, ix
}

node "linux64-ix-slave01" inherits "centos5-x86_64-build" {
    include buildslave, ix
}

node "linux64-ix-slave02" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave03" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave04" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave05" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave06" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave07" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave08" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave09" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave10" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave11" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave12" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave13" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave14" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave15" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave16" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave17" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave18" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave19" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave20" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave21" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave22" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave23" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave24" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave25" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave26" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave27" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave28" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave29" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave30" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave31" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave32" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave33" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave34" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave35" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave36" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave37" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave38" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave39" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave40" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave41" inherits "centos5-x86_64-build" {
    include buildslave, ix
}

node "linux-ix-slave01" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave02" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave03" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave04" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave05" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave06" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave07" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave08" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave09" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave10" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave11" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave12" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave13" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave14" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave15" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave16" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave17" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave18" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave19" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave20" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave21" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave22" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave23" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave24" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave25" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave26" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave27" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave28" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave29" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave30" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave31" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave32" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave33" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave34" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave35" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave36" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave37" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave38" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave39" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave40" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave41" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "linux-ix-slave42" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "moz2-darwin10-ref" inherits "darwin10-i386-build" {
    include buildslave
}

node "talos-r3-fed-ref" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-003" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-004" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-005" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-006" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-007" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-008" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-009" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-011" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-012" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-013" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-014" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-015" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-016" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-017" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-018" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-019" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-020" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-021" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-022" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-023" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-024" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-025" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-026" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-027" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-028" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-029" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-030" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-031" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-032" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-033" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-034" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-035" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-036" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-037" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-038" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-039" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-040" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-041" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-042" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-043" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-044" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-045" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-046" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-047" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-048" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-049" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-050" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-051" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-052" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-053" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-054" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-055" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-056" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-057" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-058" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-059" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-060" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-061" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-062" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-063" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed64-ref" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-003" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-004" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-005" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-006" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-007" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-008" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-009" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-011" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-012" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-013" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-014" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-015" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-016" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-017" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-018" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-019" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-020" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-021" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-022" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-023" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-024" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-025" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-026" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-027" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-028" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-029" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-030" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-031" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-032" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-033" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-034" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-035" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-036" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-037" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-038" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-039" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-040" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-041" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-042" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-043" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-044" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-045" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-046" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-047" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-048" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-049" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-050" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-051" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-052" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-053" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-054" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-055" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-056" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-057" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-058" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-059" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-leopard-ref" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-003" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-004" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-005" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-006" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-007" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-008" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-009" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-011" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-012" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-013" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-014" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-015" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-016" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-017" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-018" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-019" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-020" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-021" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-022" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-023" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-024" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-025" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-026" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-027" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-028" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-029" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-030" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-031" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-032" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-033" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-034" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-035" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-036" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-037" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-038" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-039" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-040" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-041" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-042" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-043" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-044" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-045" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-046" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-047" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-048" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-049" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-050" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-051" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-052" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-053" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-054" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-055" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-056" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-057" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-058" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-leopard-059" inherits "darwin9-i386-test" {
    include talosslave
}

node "talos-r3-snow-ref" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-003" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-004" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-005" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-006" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-007" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-008" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-009" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-011" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-012" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-013" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-014" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-015" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-016" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-017" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-018" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-019" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-020" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-021" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-022" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-023" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-024" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-025" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-026" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-027" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-028" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-029" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-030" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-031" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-032" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-033" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-034" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-035" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-036" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-037" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-038" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-039" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-040" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-041" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-042" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-043" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-044" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-045" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-046" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-047" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-048" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-049" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-050" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-051" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-052" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-053" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-054" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-055" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-056" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-057" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-058" inherits "darwin10-i386-test" {
    include talosslave
}

node "talos-r3-snow-059" inherits "darwin10-i386-test" {
    include talosslave
}

node "linux-hgwriter-slave03" inherits "centos5-i686-build" {
    include buildslave, kvm
}

node "linux-hgwriter-slave04" inherits "centos5-i686-build" {
    include buildslave, kvm
}

node "byob-repack01" inherits "byob-repack" {
    include byob-repackslave
}

node "byob-repack02" inherits "byob-repack" {
    include byob-repackslave
}

node "byob-repack03" inherits "byob-repack" {
    include byob-repackslave
}

node "byob-repack04" inherits "byob-repack" {
    include byob-repackslave
}

node "byob-repack05" inherits "byob-repack" {
    include byob-repackslave
}

