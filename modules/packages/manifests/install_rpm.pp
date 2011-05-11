define packages::install_rpm($creates, $version) {
    # We'd really like to do this here, but can't. This needs to be included at
    # the node level for now. See the comments in base/nodes.pp.
    # include packages

    # This check will mark a package as installed if the file or directory it
    # creates already exists. It is intended to only be run for packages that
    # are not installed yet (eg, isn't run for packages getting an updated
    # version). check-for-rpm.sh handles marking it as installed, if necessary.
    # The onlyif will ensure that this is only run for packages which do not
    # have any version installed.
    exec {
        "check-for-${name}":
            command => "/usr/local/bin/check-for-rpm.sh ${platform_httproot}/RPMs/${name}-${version}.${hardwaremodel}.rpm ${creates}",
            onlyif => "/bin/bash -c '! /bin/rpm -ql ${name}'",
            require => File["/usr/local/bin/check-for-rpm.sh"]
    }
    package {
        "${name}":
            provider => "rpm",
            ensure => "${version}",
            source => "${platform_httproot}/RPMs/${name}-${version}.${hardwaremodel}.rpm",
            require => Exec["check-for-${name}"]
    }
}
