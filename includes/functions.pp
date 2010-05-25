define install_package($creates) {
    case $operatingsystem {
        # todo
        #CentOS, Fedora: {
        #}
        Darwin: {
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
    }
}

