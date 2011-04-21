# master class
# for use as a base class for master-like machines
# (e.g. buildbot masters, puppet masters)
class master {
    $slaveType = "master"
    $platform_httproot = "${httproot}/${lsbdistid}-${lsbdistrelease}-${hardwaremodel}/${slaveType}"
    include network
    include ntp
    include prefs
    packages::hg {
        "latest":
    }
    package {
        "epel-release":
            source => "http://download.fedora.redhat.com/pub/epel/5/i386/epel-release-5-4.noarch.rpm",
            provider => "rpm";
        # So that puppet help works
        "ruby-rdoc":
            ensure => "1.8.5-5.el5_4.8";
        "nrpe":
            ensure => "2.12-16.el5";
        "nagios-plugins-nrpe":
            ensure => "2.12-16.el5";
        "nagios-plugins-all":
            ensure => "1.4.15-2.el5";
    }
}
