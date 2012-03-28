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
            include prefs
            include sendmail
            include ganglia::client
            package {
                "epel-release":
                    source => "http://mrepo.mozilla.org/mrepo/5-x86_64/RPMS.epel/epel-release-5-4.noarch.rpm",
                    provider => "rpm";
                # So that puppet help works
                "ruby-rdoc":
                    ensure => latest;
                "screen":
                    ensure => latest;
                "strace":
                    ensure => latest;
            }
        }
        Darwin: {
            include puppet::config
        }
    }
}
