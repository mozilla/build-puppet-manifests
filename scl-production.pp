$location = "scl"
$level = "production"

$puppetServer = "${location}-${level}-puppet.build.scl1.mozilla.com"

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

node "linux64-ix-ref" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave01" inherits "centos5-x86_64-build" {
    include buildslave, ix
}
node "linux64-ix-slave02" inherits "centos5-x86_64-build" {
    include staging-buildslave, ix
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

node "talos-r3-fed-001" inherits "fedora12-i686-test" {
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

node "talos-r3-fed-064" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-065" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-066" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-067" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-068" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-069" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-070" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-071" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-072" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-073" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-074" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-075" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-076" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-077" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-078" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-079" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-080" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-081" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-082" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-083" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-084" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-085" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-086" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-087" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-088" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-089" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-090" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-091" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-092" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-093" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-094" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-095" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-096" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-097" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-098" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-099" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-100" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-101" inherits "fedora12-i686-test" {
    include talosslave
}

node "talos-r3-fed-102" inherits "fedora12-i686-test" {
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

node "talos-r3-fed64-060" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-061" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-062" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-063" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-064" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-065" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-066" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-067" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-068" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-069" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-070" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r3-fed64-071" inherits "fedora12-x86_64-test" {
    include talosslave
}

node "talos-r4-snow-ref" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-001" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-002" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}
 
node "talos-r4-snow-003" inherits "darwin10-i386-test" {
    include talos_osx_rev4
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

node "talos-r4-snow-082" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-083" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-snow-084" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-ref" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-001" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-002" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-003" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-004" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-005" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-006" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-007" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-008" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-009" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-010" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-011" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-012" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-013" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-014" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-015" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-016" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-017" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-018" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-019" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-020" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-021" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-022" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-023" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-024" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-025" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-026" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-027" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-028" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-029" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-030" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-031" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-032" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-033" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-034" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-035" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-036" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-037" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-038" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-039" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-040" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-041" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-042" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-043" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-044" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-045" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-046" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-047" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-048" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-049" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-050" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-051" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-052" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-053" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-054" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-055" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-056" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-057" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-059" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-060" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-061" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-062" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-063" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-064" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-065" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-066" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-067" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-068" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-069" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-070" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-071" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-072" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-073" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-074" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-075" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-076" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-077" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-078" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-079" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-080" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-081" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-082" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "talos-r4-lion-084" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
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

node "r5-mini-001" inherits "darwin11-x86_64-build" {
    include buildslave
    }

node "r5-mini-002" inherits "darwin11-x86_64-build" {
    include buildslave
    }

node "r5-mini-003" inherits "darwin11-x86_64-build" {
        include buildslave
}

node "r5-mini-004" inherits "darwin11-x86_64-build" {
        include buildslave
}

node "r5-mini-005" inherits "darwin11-x86_64-build" {
        include buildslave
}

node "r5-mini-006" inherits "darwin11-x86_64-build" {
        include buildslave
}

