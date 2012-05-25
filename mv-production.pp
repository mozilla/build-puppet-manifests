$location = "mv"
$level = "production"

$puppetServer = "${location}-${level}-puppet.build.mozilla.org"

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

node "linux-ix-ref" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave02" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave03" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave04" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave05" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave06" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave07" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave08" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave09" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave10" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave11" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave12" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave13" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave14" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave15" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave16" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave17" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave18" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave19" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave20" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave21" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave22" inherits "centos5-i686-build" {
    include buildslave, ix
}

node "mv-moz2-linux-ix-slave23" inherits "centos5-i686-build" {
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

node "moz2-darwin10-ref" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave02" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave40" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave41" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave42" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave43" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave44" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave45" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave46" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave47" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave48" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave49" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave50" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave53" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave54" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave55" inherits "darwin10-i386-build" {
    include buildslave
}

node "moz2-darwin10-slave56" inherits "darwin10-i386-build" {
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

node "try-mac64-slave27" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave28" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave29" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave30" inherits "darwin10-i386-build" {
    include buildslave
}

node "try-mac64-slave31" inherits "darwin10-i386-build" {
    include buildslave
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

