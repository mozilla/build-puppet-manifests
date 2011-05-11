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
        "10.2.0", "10.6.0": {
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
