$home = $operatingsystem ? {
    CentOS => "/home",
    Fedora => "/home",
    Darwin => "/Users",
}
$os = $operatingsystem ? {
    CentOS => "centos5",
    Fedora => "fedora12",
    Darwin => $operatingsystemrelease ? {
        # 10.5.2
        "9.2.0"  => "darwin9",
        # 10.5.8
        "9.8.0"  => "darwin9",
        # 10.6.2
        "10.2.0" => "darwin10",
        # 10.6.6
        "10.6.0" => "darwin10",
        # 10.6.8
        "10.8.0" => "darwin10",
        # 10.7.1
        "11.1.0" => "darwin11",
        # 10.7.2
        "11.2.0" => "darwin11"
    }
}
