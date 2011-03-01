class location {
    $httproot = "http://${puppetServer}/${level}"
    $fileroot = "puppet://${puppetServer}/${level}"

    $platform_httproot = "${httproot}/${os}-${hardwaremodel}/${slaveType}"
    $platform_fileroot = "${fileroot}/${os}-${hardwaremodel}/${slaveType}"

    # Used for files that differ between locations. Eg, puppet configurations.
    $local_httproot = "${platform_httproot}/local"
    $local_fileroot = "${platform_fileroot}/local"
}
