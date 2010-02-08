# nagios.pp
# installation of nagios NRPE for Centos

# This manifest works with i386 AND x86_64 provided that the nagios rpm files are all
# the same version!

class nagios {

    case $hardwaremodel {
        "x86_64": { $libdir = "lib64" }
        default: { $libdir = "lib" }
    }

    file {
        "/etc/nagios/nrpe.cfg":
            source => "/N/centos5/etc/nagios/nrpe.cfg";
    }
    exec {
        "nagios-plugins":
            command => "/bin/rpm --nosignature --nodeps -i /N/centos5/custom/dag.wieers.com/nagios-plugins-1.4.9-1.el5.rf.$hardwaremodel.rpm",
            creates => "/usr/$libdir/nagios/plugins/check_nagios";
        "nagios-nrpe":
            command => "/bin/rpm --nosignature --nodeps -i /N/centos5/custom/dag.wieers.com/nagios-nrpe-2.5.2-1.el5.rf.$hardwaremodel.rpm",
            creates => "/usr/sbin/nrpe";
        "nagios-plugins-nrpe":
            command => "/bin/rpm --nosignature --nodeps -i /N/centos5/custom/dag.wieers.com/nagios-plugins-nrpe-2.5.2-1.el5.rf.$hardwaremodel.rpm",
            creates => "/usr/$libdir/nagios/plugins/check_nrpe";
    }
    service { 
        "nrpe":
            enable => 'true',
            subscribe => file["/etc/nagios/nrpe.cfg"],
            ensure => 'running';
    }
}
