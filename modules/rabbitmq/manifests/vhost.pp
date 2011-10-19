# rabbitmq::vhost
#
# Usage:
# rabbitmq::vhost {
#   '/path': ;
#   '/test': ensure => absent;
# }
define rabbitmq::vhost($ensure='present') {
    case $ensure {
        'present': {
            exec {
                "rabbit_vhost:${title}":
                    require => Service["rabbitmq-server"],
                    command => "/usr/sbin/rabbitmqctl add_vhost ${title}",
                    unless => "/usr/sbin/rabbitmqctl list_vhosts | grep -q '^${title}'";
            }
        }
        'absent': {
            exec {
                "rabbit_vhost:${title}":
                    require => Service["rabbitmq-server"],
                    command => "/usr/sbin/rabbitmqctl delete_vhost ${title}",
                    onlyif => "/usr/sbin/rabbitmqctl list_vhosts | grep -q '^${title}'";
            }
        }
        default: {
            fail("Unsupported value for ensure: $ensure")
        }
    }
}
