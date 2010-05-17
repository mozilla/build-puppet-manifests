node "slave" {
}

node "build" inherits "slave" {
    $platform_httproot = "http://${puppetServer}/${level}/${os}-${hardwaremodel}/build"
    $platform_fileroot = "puppet://${puppetServer}/${level}/${os}-${hardwaremodel}/build"
    # Used for files that differ between locations. Eg, puppet configurations.
    $local_httproot = "${platform_httproot}/local"
    $local_fileroot = "${platform_fileroot}/local"
    include base
}

node "centos" inherits "build" {
    # devtools_home will disappear after this platform is moved off of /N
    $devtools_home = "/N/${level}/${os}-${hardwaremodel}/build/dist"
    include cltbld
}

node "centos5-i686-build" inherits "centos" {
}

node "centos5-x86_64-build" inherits "centos" {
}

node "darwin-build" inherits "build" {
}

node "darwin9-i386-build" inherits "darwin-build" {
}

node "darwin10-i386-build" inherits "darwin-build" {
}

node "test" inherits "slave" {
    $platform_httproot = "http://${puppetServer}/${level}/${os}-${hardwaremodel}/test"
    $platform_fileroot = "puppet://${puppetServer}/${level}/${os}-${hardwaremodel}/test"
    # Used for files that differ between locations. Eg, puppet configurations.
    $local_httproot = "${platform_httproot}/local"
    $local_fileroot = "${platform_fileroot}/local"
    $slavetype = "test"
    include staging-talosslave
}

node "fedora" inherits "test" {
}

node "fedora12-i686-test" inherits "fedora" {
}

node "fedora12-x86_64-test" inherits "fedora" {
}

node "darwin-test" inherits "test" {
}

node "darwin9-i386-test" inherits "darwin-test" {
}

node "darwin10-i386-test" inherits "darwin-test" {
}
