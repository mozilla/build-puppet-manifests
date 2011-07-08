class mozldap::install {
    # Install a customized version of openssh that supports LDAP logins
    # http://code.google.com/p/openssh-lpk/

    # Note that because SSH RPMs are circularly dependent, puppet cannot
    # actually *install* these - it will just error out until you do it.

    Package { provider => 'rpm' }
    $rpm_base = "http://${puppetServer}/production/centos5-$hardwaremodel/${slaveType}/RPMs"
    package {
        "openssh":
            ensure => '5.2p1-1.rhel5',
            source => "$rpm_base/openssh-5.2p1-1.rhel5.$hardwaremodel.rpm";
        "openssh-clients":
            ensure => '5.2p1-1.rhel5',
            source => "$rpm_base/openssh-clients-5.2p1-1.rhel5.$hardwaremodel.rpm",
            require => Package[openssh];
        "openssh-server":
            ensure => '5.2p1-1.rhel5',
            source => "$rpm_base/openssh-server-5.2p1-1.rhel5.$hardwaremodel.rpm",
            require => Package[openssh],
            notify => Service[sshd];
    }

}
