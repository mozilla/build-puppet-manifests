$location = "scl3"
$level = "production"

$puppetServer = "${location}-${level}-puppet.srv.releng.scl3.mozilla.com"

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

node "bld-lion-r5-001" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-002" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-003" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-004" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-005" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-006" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-007" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-008" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-009" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-010" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-011" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-012" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-013" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-014" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-015" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-016" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-017" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-018" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-019" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-020" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-021" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-022" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-023" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-024" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-025" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-026" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-027" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-028" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-029" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-030" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-031" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-032" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-033" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-034" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-035" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-036" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-037" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-038" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-039" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-040" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-041" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-042" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-043" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-044" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-045" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-046" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-047" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-048" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-049" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-050" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-051" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-052" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-053" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-054" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-055" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-056" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-057" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-058" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-059" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-060" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-061" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-062" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-063" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-064" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-065" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-066" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-067" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-068" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-069" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-070" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-071" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-072" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-073" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-074" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-075" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-076" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-077" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-078" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-079" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "bld-lion-r5-080" inherits "darwin11-x86_64-build" {
    include buildslave
}

node "preproduction-stage" inherits "stage-and-aus2-server" {
    $deleteCandidatesDirs = '1'
    include stageusergroups
}
