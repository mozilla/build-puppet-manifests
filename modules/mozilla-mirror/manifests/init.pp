# This resource configures all necessary things to have a working Mozilla
# mirror. Specifically, it:
#  - Ensures that Apache is installed, running, and correctly configured
#  - Creates a cronjob that syncs the named rsync module every 10 minutes
define mozilla-mirror($host="") {
    $docroot = "/var/www/html/$name"

    include mozilla-mirror::apache

    mozilla-mirror::rsync {
        $name:
            dest => $docroot,
            host => $host;
    }
}
