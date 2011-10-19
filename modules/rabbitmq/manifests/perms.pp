# rabbitmq::perms
# 
# manage rabbitmq user permissions
# requires that the users and vhosts are declared elsewhere
#
# Usage:
# rabbitmq::perms {
#   'user':
#       conf => '.*',
#       write => '.*',
#       read => '.*',
#       vhost => '/foo';
#   'user-bar':
#       user => 'user',
#       conf => '.*',
#       write => '.*',
#       read => '.*',
#       vhost => '/bar';
# }
#
# The $user parameter is optional, and defaults to the resource title. This
# parameter indicates which rabbitmq user to manipulate
define rabbitmq::perms($conf, $write, $read, $vhost='/', $user='') {
    case $user {
        '': { $realuser = $title }
        default: { $realuser = $user }
    }
    exec {
        "rabbit_perms_${realuser}:${vhost}":
            require => [
                Rabbitmq::User[$realuser],
                Rabbitmq::Vhost[$vhost],
            ],
            command => "/usr/sbin/rabbitmqctl set_permissions -p '${vhost}' '${realuser}' '${conf}' '${write}' '${read}'",
            unless => "/usr/sbin/rabbitmqctl list_user_permissions ${realuser} | grep -q -F '${vhost}	${conf}	${write}	${read}'";
    }
}
