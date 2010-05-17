$home = $operatingsystem ? {
    CentOS => "/home",
    Fedora => "/home",
    Darwin => "/Users",
}
$os = $operatingsystem ? {
    CentOS => "centos5",
    Fedora => "fedora12",
    Darwin => $operatingsystemrelease ? {
        "9.2.0"  => "darwin9",
        "9.8.0"  => "darwin9",
        "10.2.0" => "darwin10"
    }
}
