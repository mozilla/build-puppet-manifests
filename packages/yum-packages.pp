class yum-packages {
    Package{ provider => rpm }

    package {
        "nano":
            ensure => installed;
    }
}
