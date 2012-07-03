define python::user_pip_conf ($homedir = '') {
    $user = $title
    $homedir_ = $operatingsystem ? {
        Darwin => "/Users/$user",
        default => "/home/$user"
    }
    $group = $operatingsystem ? {
        Darwin => "staff",
        default => $user
    }
    file {
        "$homedir_/.pip":
            ensure => directory,
            owner => $user,
            group => $group,
            mode => 0755;

        "$homedir_/.pip/pip.conf":
            source => "puppet:///python/pip.conf",
            owner => $user,
            group => $group,
            mode => 0644;
    }
}
