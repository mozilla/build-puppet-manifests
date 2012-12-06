define sysctl($value) {
    exec {
        "sysctl-$name":
            command => "/sbin/sysctl $name=$value",
            onlyif  => "/sbin/sysctl -n $name | grep -q -v $value";
    }
}
