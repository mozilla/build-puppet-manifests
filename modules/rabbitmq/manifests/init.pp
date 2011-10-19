# rabbitmq class
#
# This class provides a basic rabbitmq installation with no default users, and
# one virtual host '/' set up.
#
# See also rabbitmq::user, rabbitmq::vhost, rabbitmq::perms resource
# definitions
class rabbitmq {
    package {
        "rabbitmq-server":
            ensure => latest;
    }
    service {
        "rabbitmq-server":
            require => Package["rabbitmq-server"],
            enable => true,
            hasstatus => true,
            ensure => running;
    }
    rabbitmq::user {
        "guest":
            ensure => absent;
    }
    rabbitmq::vhost {
        "/": ;
    }
}
