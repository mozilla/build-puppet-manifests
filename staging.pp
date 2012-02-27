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

node "linux64-ix-slave01" inherits "centos5-x86_64-build" {
    include staging-buildslave, ix
}

node "linux64-ix-slave02" inherits "centos5-x86_64-build" {
    include staging-buildslave, ix
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

node "rev4-testing" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "rev4-testing2" inherits "darwin10-i386-test" {
    include talos_osx_rev4
}

node "lion-testing1" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "lion-testing2" inherits "darwin11-x86_64-test" {
    include talos_osx_rev4
}

node "lion-testing3" inherits "darwin11-x86_64-test" {
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

node "talos-r3-snow-010" inherits "darwin10-i386-test" {
    include talosslave
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

node "talos-r4-lion-058" inherits "darwin11-x86_64-test" {
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

