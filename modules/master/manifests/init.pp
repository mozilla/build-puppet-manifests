# master class
# for use as a base class for master-like machines
# (e.g. buildbot masters, puppet masters)
class master {
    $platform_httproot = "${httproot}/${lsbdistid}-${lsbdistrelease}-${hardwaremodel}/${slaveType}"
    include nagios
    include network
    include boot
    include ntp
    include prefs
    include ganglia::client
    include root-user
    packages::hg {
        "latest":
    }
    package {
        "epel-release":
            source => "http://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-4.noarch.rpm",
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
