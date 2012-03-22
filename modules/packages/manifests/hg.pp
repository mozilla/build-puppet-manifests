# hg package define
# Example usage:
# package::hg { "latest": }
define packages::hg {
    case $operatingsystem {
        CentOS: {
            if ($name == "latest") {
                $version = "1.8.1-0"
            } else {
                $version = $name
            }
            packages::install_rpm {
                "mercurial":
                    version => $version,
                    creates => "/usr/bin/hg";
            }
        }
        default: { fail("Unsupported operating system: $operatingsystem") }
    }
}
