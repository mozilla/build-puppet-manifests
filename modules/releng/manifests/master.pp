# master class
# for use as a base class for master-like machines
# (e.g. buildbot masters, puppet masters)
class releng::master {
    $platform_httproot = "${httproot}/${lsbdistid}-${lsbdistrelease}-${hardwaremodel}/${slaveType}"
    include nagios
    include network
    include boot
    include ntp
    include root-user
    include sudoers
    include mercurial
    case $operatingsystem {
        CentOS: {
            $epel = $operatingsystemrelease ? {
                "5.5" => "http://mrepo.mozilla.org/mrepo/5-x86_64/RPMS.epel/epel-release-5-4.noarch.rpm",
                "6.2" => "http://mrepo.mozilla.org/mrepo/6-x86_64/RPMS.epel/epel-release-6-5.noarch.rpm",
            }
            include prefs
            include sendmail
            include ganglia::client
            package {
                "epel-release":
                    source => "${epel}",
                    provider => "rpm";
                # So that puppet help works
                "ruby-rdoc":
                    ensure => latest;
                "screen":
                    ensure => latest;
                "strace":
                    ensure => latest;
                "redhat-lsb":
                    ensure => latest;
            }
        }
        Darwin: {
            include puppet::config
        }
    }
}
