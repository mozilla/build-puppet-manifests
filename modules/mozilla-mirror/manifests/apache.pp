class mozilla-mirror::apache {
    include apache
    include mozilla-mirror::mime-types
}

# Mozilla mirrors require some specific MIME types in order to function
# correctly (http://www.mozilla.org/community/mirroring.html).
class mozilla-mirror::mime-types {
    apache::config::part {
        "mozilla-mirror-mime.conf":
            source => "puppet:///mozilla-mirror/mime.conf";
    }
}
