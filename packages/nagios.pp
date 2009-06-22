# nagios.pp
# installation of nagios NRPE for Centos

class nagios {

    file {
        "/etc/nagios/nrpe.cfg":
            source => "/N/centos5/etc/nagios/nrpe.cfg";
    }
    exec {
        "nagios-plugins":
            command => "/bin/rpm --nosignature --nodeps -i /N/centos5/custom/dag.wieers.com/nagios-plugins-1.4.9-1.el5.rf.i386.rpm",
            creates => "/usr/lib/nagios/plugins/check_nagios";
        "nagios-nrpe":
            command => "/bin/rpm --nosignature --nodeps -i /N/centos5/custom/dag.wieers.com/nagios-nrpe-2.5.2-1.el5.rf.i386.rpm",
            creates => "/usr/sbin/nrpe";
        "nagios-plugins-nrpe":
            command => "/bin/rpm --nosignature --nodeps -i /N/centos5/custom/dag.wieers.com/nagios-plugins-nrpe-2.5.2-1.el5.rf.i386.rpm",
            creates => "/usr/lib/nagios/plugins/check_nrpe";
    }
    service { 
        "nrpe":
            enable => 'true',
            ensure => 'running';
    }
}
