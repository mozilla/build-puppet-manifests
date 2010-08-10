class location {
    $platform_httproot = "http://${puppetServer}/${level}/${os}-${hardwaremodel}/${slaveType}"
    $platform_fileroot = "puppet://${puppetServer}/${level}/${os}-${hardwaremodel}/${slaveType}"
    # Used for files that differ between locations. Eg, puppet configurations.
    $local_httproot = "${platform_httproot}/local"
    $local_fileroot = "${platform_fileroot}/local"
}
