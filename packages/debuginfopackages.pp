# debuginfo.pp
# debuginfo rpm packages

class debuginfopackages {
    Package{ provider => rpm, ensure => installed }

    case $hardwaremodel {
        x86_64: {
	    package {
	        "atk-debuginfo":
	            source => "${platform_httproot}/RPMs/atk-debuginfo-1.12.2-1.el5.centos.x86_64.rpm";
	        "cairo-debuginfo":
	            source => "${platform_httproot}/RPMs/cairo-debuginfo-1.2.4-1.el5.centos.x86_64.rpm";
	        "dbus-debuginfo":
	            source => "${platform_httproot}/RPMs/dbus-debuginfo-1.0.0-6.el5.x86_64.rpm";
	        "dbus-glib":
	            source => "${platform_httproot}/RPMs/dbus-glib-debuginfo-0.70-5.x86_64.rpm";
	        "expat-debuginfo":
	            source => "${platform_httproot}/RPMs/expat-debuginfo-1.95.8-8.2.1.x86_64.rpm";
	        "fontconfig-debuginfo":
	            source => "${platform_httproot}/RPMs/fontconfig-debuginfo-2.4.1-6.el5.x86_64.rpm";
	        "freetype-debuginfo":
	            source => "${platform_httproot}/RPMs/freetype-debuginfo-2.2.1-16.el5.x86_64.rpm";
	        "gcc-debuginfo":
	            source => "${platform_httproot}/RPMs/gcc-debuginfo-4.1.1-52.el5.x86_64.rpm";
	        "GConf2-debuginfo":
	            source => "${platform_httproot}/RPMs/GConf2-debuginfo-2.14.0-9.el5.x86_64.rpm";
	        "glib2-debuginfo":
	            source => "${platform_httproot}/RPMs/glib2-debuginfo-2.12.3-2.el5.centos.x86_64.rpm";
	        "glibc-debuginfo":
	            source => "${platform_httproot}/RPMs/glibc-debuginfo-2.5-12.x86_64.rpm";
##	        "glibc-debuginfo-common":
##	            source => "${platform_httproot}/RPMs/glibc-debuginfo-common-2.5-12.x86_64.rpm";
	        "gnome-vfs2-debuginfo":
	            source => "${platform_httproot}/RPMs/gnome-vfs2-debuginfo-2.16.0-8.el5.centos.x86_64.rpm";
	        "gtk2-debuginfo":
	            source => "${platform_httproot}/RPMs/gtk2-debuginfo-2.10.4-16.el5.x86_64.rpm";
	        "gtk2-engines-debuginfo":
	            source => "${platform_httproot}/RPMs/gtk2-engines-debuginfo-2.8.0-3.el5.x86_64.rpm";
	        "hal-cups-utils-debuginfo":
	            source => "${platform_httproot}/RPMs/hal-cups-utils-debuginfo-0.6.2-5.x86_64.rpm";
	        "hal-debuginfo":
	            source => "${platform_httproot}/RPMs/hal-debuginfo-0.5.8.1-19.el5.x86_64.rpm";
	        "libbonobo-debuginfo":
	            source => "${platform_httproot}/RPMs/libbonobo-debuginfo-2.16.0-1.el5.centos.x86_64.rpm";
	        "libgnome-debuginfo":
	            source => "${platform_httproot}/RPMs/libgnome-debuginfo-2.16.0-6.el5.centos.x86_64.rpm";
	        "libselinux-debuginfo":
	            source => "${platform_httproot}/RPMs/libselinux-debuginfo-1.33.4-2.el5.x86_64.rpm";
	        "libX11-debuginfo":
	            source => "${platform_httproot}/RPMs/libX11-debuginfo-1.0.3-8.el5.x86_64.rpm";
	        "libXcursor-debuginfo":
	            source => "${platform_httproot}/RPMs/libXcursor-debuginfo-1.1.7-1.1.x86_64.rpm";
	        "libXext-debuginfo":
	            source => "${platform_httproot}/RPMs/libXext-debuginfo-1.0.1-2.1.x86_64.rpm";
	        "libXfixes-debuginfo":
	            source => "${platform_httproot}/RPMs/libXfixes-debuginfo-4.0.1-2.1.x86_64.rpm";
	        "libXft-debuginfo":
	            source => "${platform_httproot}/RPMs/libXft-debuginfo-2.1.10-1.1.x86_64.rpm";
	        "libXi-debuginfo":
	            source => "${platform_httproot}/RPMs/libXi-debuginfo-1.0.1-3.1.x86_64.rpm";
	        "libXinerama-debuginfo":
	            source => "${platform_httproot}/RPMs/libXinerama-debuginfo-1.0.1-2.1.x86_64.rpm";
	        "libXrender-debuginfo":
	            source => "${platform_httproot}/RPMs/libXrender-debuginfo-0.9.1-3.1.x86_64.rpm";
	        "ORBit2-debuginfo":
	            source => "${platform_httproot}/RPMs/ORBit2-debuginfo-2.14.3-4.el5.x86_64.rpm";
	        "pango-debuginfo":
        	    source => "${platform_httproot}/RPMs/pango-debuginfo-1.14.9-3.el5.centos.x86_64.rpm";
	    }
        }

        default: {
	    package {
	        "atk-debuginfo":
	            source => "${platform_httproot}/RPMs/atk-debuginfo-1.12.2-1.el5.centos.i386.rpm";
	        "cairo-debuginfo":
	            source => "${platform_httproot}/RPMs/cairo-debuginfo-1.2.4-1.el5.centos.i386.rpm";
	        "dbus-debuginfo":
	            source => "${platform_httproot}/RPMs/dbus-debuginfo-1.0.0-6.el5.i386.rpm";
	        "dbus-glib":
	            source => "${platform_httproot}/RPMs/dbus-glib-debuginfo-0.70-5.i386.rpm";
	        "expat-debuginfo":
	            source => "${platform_httproot}/RPMs/expat-debuginfo-1.95.8-8.2.1.i386.rpm";
	        "fontconfig-debuginfo":
                ensure => latest,
	            source => "${platform_httproot}/RPMs/fontconfig-debuginfo-2.4.2-2.i686.rpm";
	        "freetype-debuginfo":
	            source => "${platform_httproot}/RPMs/freetype-debuginfo-2.2.1-16.el5.i386.rpm";
	        "gcc-debuginfo":
	            source => "${platform_httproot}/RPMs/gcc-debuginfo-4.1.1-52.el5.i386.rpm";
	        "GConf2-debuginfo":
	            source => "${platform_httproot}/RPMs/GConf2-debuginfo-2.14.0-9.el5.i386.rpm";
	        "glib2-debuginfo":
	            source => "${platform_httproot}/RPMs/glib2-debuginfo-2.12.3-2.el5.centos.i386.rpm";
	        "glibc-debuginfo":
	            source => "${platform_httproot}/RPMs/glibc-debuginfo-2.5-12.i386.rpm";
	        "glibc-debuginfo-common":
	            source => "${platform_httproot}/RPMs/glibc-debuginfo-common-2.5-12.i386.rpm";
	        "gnome-vfs2-debuginfo":
	            source => "${platform_httproot}/RPMs/gnome-vfs2-debuginfo-2.16.0-8.el5.centos.i386.rpm";
	        "gtk2-debuginfo":
	            source => "${platform_httproot}/RPMs/gtk2-debuginfo-2.10.4-16.el5.i386.rpm";
	# two versions of this listed...? 
	#        "gtk2-engines-debuginfo":
	#            source => "/tmp/gtk2-engines-debuginfo-2.8.0-2.el5.centos.i386.rpm",
	#            require => file["/tmp/gtk2-engines-debuginfo-2.8.0-2.el5.centos.i386.rpm"];
	        "gtk2-engines-debuginfo":
	            source => "${platform_httproot}/RPMs/gtk2-engines-debuginfo-2.8.0-3.el5.i386.rpm";
	        "hal-cups-utils-debuginfo":
	            source => "${platform_httproot}/RPMs/hal-cups-utils-debuginfo-0.6.2-5.i386.rpm";
	        "hal-debuginfo":
	            source => "${platform_httproot}/RPMs/hal-debuginfo-0.5.8.1-19.el5.i386.rpm";
	        "libbonobo-debuginfo":
	            source => "${platform_httproot}/RPMs/libbonobo-debuginfo-2.16.0-1.el5.centos.i386.rpm";
	        "libgnome-debuginfo":
	            source => "${platform_httproot}/RPMs/libgnome-debuginfo-2.16.0-6.el5.centos.i386.rpm";
	        "libselinux-debuginfo":
	            source => "${platform_httproot}/RPMs/libselinux-debuginfo-1.33.4-2.el5.i386.rpm";
	        "libX11-debuginfo":
	            source => "${platform_httproot}/RPMs/libX11-debuginfo-1.0.3-8.el5.i386.rpm";
	        "libXcursor-debuginfo":
	            source => "${platform_httproot}/RPMs/libXcursor-debuginfo-1.1.7-1.1.i386.rpm";
	        "libXext-debuginfo":
        	    source => "${platform_httproot}/RPMs/libXext-debuginfo-1.0.1-2.1.i386.rpm";
	        "libXfixes-debuginfo":
        	    source => "${platform_httproot}/RPMs/libXfixes-debuginfo-4.0.1-2.1.i386.rpm";
	        "libXft-debuginfo":
        	    source => "${platform_httproot}/RPMs/libXft-debuginfo-2.1.10-1.1.i386.rpm";
	        "libXi-debuginfo":
        	    source => "${platform_httproot}/RPMs/libXi-debuginfo-1.0.1-3.1.i386.rpm";
	        "libXinerama-debuginfo":
        	    source => "${platform_httproot}/RPMs/libXinerama-debuginfo-1.0.1-2.1.i386.rpm";
	        "libXrender-debuginfo":
        	    source => "${platform_httproot}/RPMs/libXrender-debuginfo-0.9.1-3.1.i386.rpm";
	        "ORBit2-debuginfo":
        	    source => "${platform_httproot}/RPMs/ORBit2-debuginfo-2.14.3-4.el5.i386.rpm";
	        "pango-debuginfo":
        	    source => "${platform_httproot}/RPMs/pango-debuginfo-1.14.9-3.el5.centos.i386.rpm";
	    }
        }
    }
}

