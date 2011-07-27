# This resource creates a cronjob that syncs against one of Mozilla's rsync
# servers. It has the smarts to know that some modules are served from
# releases-rsync.mozilla.org, while others from stage-rsync.mozilla.org.
# (Note: the mozilla-prereleases only allows hosts in its whitelist.)
define mozilla-mirror::rsync($dest, $host="") {
    $rsyncModule = $name
    if ($host == "") {
        if ($rsyncModule == "mozilla-prereleases") {
            $rsyncHost = "stage-rsync.mozilla.org"
        }
        else {
            $rsyncHost = "releases-rsync.mozilla.org"
        }
    }
    else {
        $rsyncHost = $host
    }
    file {
        "/etc/cron.d/mozilla-mirror-${name}":
            content => template("mozilla-mirror/rsync-crontab.erb"),
            owner => root,
            group => root,
            mode => 644;
    }
}
