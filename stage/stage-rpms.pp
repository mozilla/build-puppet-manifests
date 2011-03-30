class stage-rpms {

    Package{ provider => rpm, ensure => installed }
    package {
        "cvs":
            source => "${platform_httproot}/RPMs/cvs-1.11.22-5.el5.i386.rpm";
        "python25":
            source => "${platform_httproot}/RPMs/python25-2.5.1-0moz1.i686.rpm";
        "mercurial":
            source => "${platform_httproot}/RPMs/mercurial-py26-1.5.1-0moz1.i686.rpm",
            require     => Package["python25"];
        "p7zip":
            source => "${platform_httproot}/RPMs/p7zip-9.13-1.el5.rf.i386.rpm";
    }
    file {
        "/tools":
            ensure => directory,
            mode => 755;
        "/tools/python":
            ensure  => "/tools/python-2.5.1";
    }
}
