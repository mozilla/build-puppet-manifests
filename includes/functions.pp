define install_rpm($creates, $version) {
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

define install_dmg($creates) {
    # This check serves the same purpose as the one above, but simplified
    # because there's no upgrade case to worry about with the pkgdmg provider.
    exec {
        "check-for-${name}":
            command => "/usr/local/bin/check-for-package.sh ${name} ${creates}",
            creates => "/var/db/.puppet_pkgdmg_installed_${name}",
            require => File["/usr/local/bin/check-for-package.sh"];
    }
    case $operatingsystemrelease {
        "9.2.0", "9.8.0": {
            package {
                "${name}":
                    provider => pkgdmg,
                    ensure => installed,
                    source => "${platform_httproot}/DMGs/${name}",
                    require => Exec["check-for-${name}"];
            }
        }
        "10.2.0": {
            package {
                "${name}":
                    provider => pkgdmg,
                    ensure => installed,
                    source => "${platform_httproot}/DMGs/${name}",
                    require => [Exec["check-for-${name}"], File["pkgdmg.rb"]];
            }
        }
    }
}
