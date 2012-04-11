class sudoers {
    if ($operatingsystem == "Fedora" or $operatingsystem == "CentOS") {
        $libdir = $hardwaremodel ? {
            i686   => "lib",
            x86_64 => "lib64"
        }

        file {
            "/etc/sudoers":
                mode => "0440",
                owner => "root",
                group => "root",
                content => template("sudoers/sudoers.erb");
        }
    }
}
