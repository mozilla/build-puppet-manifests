# debuginfo.pp
# debuginfo rpm packages

class debuginfopackages {
    Package{ provider => rpm, ensure => installed }
    $debuginforoot = "${fileroot}centos5/custom/debuginfo-packages/"

    package {
        "atk-debuginfo":
            source => "/N/centos5/RPMS/i386/atk-debuginfo-1.12.2-1.el5.centos.i386.rpm";
        "cairo-debuginfo":
            source => "/N/centos5/RPMS/i386/cairo-debuginfo-1.2.4-1.el5.centos.i386.rpm";
        "dbus-debuginfo":
            source => "/N/centos5/RPMS/i386/dbus-debuginfo-1.0.0-6.el5.i386.rpm";
        "dbus-glib":
            source => "/N/centos5/RPMS/i386/dbus-glib-debuginfo-0.70-5.i386.rpm";
        "expat-debuginfo":
            source => "/N/centos5/RPMS/i386/expat-debuginfo-1.95.8-8.2.1.i386.rpm";
        "fontconfig-debuginfo":
            source => "/N/centos5/RPMS/i386/fontconfig-debuginfo-2.4.1-6.el5.i386.rpm";
        "freetype-debuginfo":
            source => "/N/centos5/RPMS/i386/freetype-debuginfo-2.2.1-16.el5.i386.rpm";
        "gcc-debuginfo":
            source => "/N/centos5/RPMS/i386/gcc-debuginfo-4.1.1-52.el5.i386.rpm";
        "GConf2-debuginfo":
            source => "/N/centos5/RPMS/i386/GConf2-debuginfo-2.14.0-9.el5.i386.rpm";
        "glib2-debuginfo":
            source => "/N/centos5/RPMS/i386/glib2-debuginfo-2.12.3-2.el5.centos.i386.rpm";
        "glibc-debuginfo":
            source => "/N/centos5/RPMS/i386/glibc-debuginfo-2.5-12.i386.rpm";
        "glibc-debuginfo-common":
            source => "/N/centos5/RPMS/i386/glibc-debuginfo-common-2.5-12.i386.rpm";
        "gnome-vfs2-debuginfo":
            source => "/N/centos5/RPMS/i386/gnome-vfs2-debuginfo-2.16.0-8.el5.centos.i386.rpm";
        "gtk2-debuginfo":
            source => "/N/centos5/RPMS/i386/gtk2-debuginfo-2.10.4-16.el5.i386.rpm";
# two versions of this listed...? 
#        "gtk2-engines-debuginfo":
#            source => "/tmp/gtk2-engines-debuginfo-2.8.0-2.el5.centos.i386.rpm",
#            require => file["/tmp/gtk2-engines-debuginfo-2.8.0-2.el5.centos.i386.rpm"];
        "gtk2-engines-debuginfo":
            source => "/N/centos5/RPMS/i386/gtk2-engines-debuginfo-2.8.0-3.el5.i386.rpm";
        "hal-cups-utils-debuginfo":
            source => "/N/centos5/RPMS/i386/hal-cups-utils-debuginfo-0.6.2-5.i386.rpm";
        "hal-debuginfo":
            source => "/N/centos5/RPMS/i386/hal-debuginfo-0.5.8.1-19.el5.i386.rpm";
        "libbonobo-debuginfo":
            source => "/N/centos5/RPMS/i386/libbonobo-debuginfo-2.16.0-1.el5.centos.i386.rpm";
        "libgnome-debuginfo":
            source => "/N/centos5/RPMS/i386/libgnome-debuginfo-2.16.0-6.el5.centos.i386.rpm";
        "libselinux-debuginfo":
            source => "/N/centos5/RPMS/i386/libselinux-debuginfo-1.33.4-2.el5.i386.rpm";
        "libX11-debuginfo":
            source => "/N/centos5/RPMS/i386/libX11-debuginfo-1.0.3-8.el5.i386.rpm";
        "libXcursor-debuginfo":
            source => "/N/centos5/RPMS/i386/libXcursor-debuginfo-1.1.7-1.1.i386.rpm";
        "libXext-debuginfo":
            source => "/N/centos5/RPMS/i386/libXext-debuginfo-1.0.1-2.1.i386.rpm";
        "libXfixes-debuginfo":
            source => "/N/centos5/RPMS/i386/libXfixes-debuginfo-4.0.1-2.1.i386.rpm";
        "libXft-debuginfo":
            source => "/N/centos5/RPMS/i386/libXft-debuginfo-2.1.10-1.1.i386.rpm";
        "libXi-debuginfo":
            source => "/N/centos5/RPMS/i386/libXi-debuginfo-1.0.1-3.1.i386.rpm";
        "libXinerama-debuginfo":
            source => "/N/centos5/RPMS/i386/libXinerama-debuginfo-1.0.1-2.1.i386.rpm";
        "libXrender-debuginfo":
            source => "/N/centos5/RPMS/i386/libXrender-debuginfo-0.9.1-3.1.i386.rpm";
        "ORBit2-debuginfo":
            source => "/N/centos5/RPMS/i386/ORBit2-debuginfo-2.14.3-4.el5.i386.rpm";
        "pango-debuginfo":
            source => "/N/centos5/RPMS/i386/pango-debuginfo-1.14.9-3.el5.centos.i386.rpm";
    }

    file {
        "/tmp":
            owner => root,
            group => root,
            ensure => directory
    }
}

