class puppet::config {
    case $operatingsystem {
        Darwin: {
            file {
                "/usr/local/bin/sleep-and-run-puppet.sh":
                    source => "puppet:///puppet/sleep-and-run-puppet.sh",
                    mode => 755;
                "/Library/LaunchDaemons/com.reductivelabs.puppet.plist":
                    content => template("puppet/com.reductivelabs.puppet.plist.erb"),
                    owner => "root",
                    group => "wheel",
                    mode => 644,
                    require => File["/usr/local/bin/sleep-and-run-puppet.sh"];
                ["/var/puppet", "/var/puppet/log"]:
                    ensure => directory;
            }
            exec {
                "update-launchd":
                    command => "/bin/launchctl load -w /Library/LaunchDaemons/com.reductivelabs.puppet.plist",
                    refreshonly => true,
                    subscribe => File["/Library/LaunchDaemons/com.reductivelabs.puppet.plist"];
            }
        }
        default: {
            fail("Unsupported operating system")
        }
    }
}
