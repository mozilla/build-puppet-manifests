#devtools.pp
#  this manifest installs all of the packages in the /tools tree
#  with the use of a helper function (install_devtools) defined below

# This file is setup to work for both CentOS and Darwin9

class devtools {

    file { "/tools": ensure => directory, mode => 755 }

    case $operatingsystem {

    CentOS: {
    $centos5root = "/N/centos5"
    $devtools_home = "${centos5root}/dist"
    $tar = "/bin/tar"

    ### The install_devtools function is found at the bottom    
    install_devtools { gcc:
            version     => "4.1.1",
            creates     => "/tools/gcc-4.1.1/bin/gcc",
            subscribe   => file["/tools/gcc"];
        python:
            version     => "2.5.1",
            creates     => "/tools/python-2.5.1/bin/python",
            subscribe   => file["/tools/python"];
        twisted:
            version     => "2.4.0",
            creates     => "/tools/twisted-2.4.0/bin/twistd",
            subscribe   => file["/tools/twisted"];
        twisted-core:
            version     => "2.4.0",
            creates     => "/tools/twisted-core-2.4.0/bin/twistd",
            subscribe   => file["/tools/twisted-core"];
        zope-interface:
            version     => "3.3.0",
            creates     => "/tools/zope-interface/lib/python2.5/site-packages/zope/interface/interface.py",
            subscribe   => file["/tools/zope-interface"];
        jdk:
            version     => "1.5.0_10",
            creates     => "/tools/jdk-1.5.0_10/bin/java",
            subscribe   => file["/tools/jdk"],
    }
    
    # Setup our symbolic links
    file { "/tools/gcc":
            ensure  => "/tools/gcc-4.1.1";
        "/tools/python":
            ensure  => "/tools/python-2.5.1";
        "/tools/twisted":
            ensure  => "/tools/twisted-2.4.0";
        "/tools/twisted-core":
            ensure  => "/tools/twisted-core-2.4.0";
        "/tools/zope-interface":
            ensure  => "/tools/zope-interface-3.3.0";
        "/tools/jdk":
            ensure  => "/tools/jdk-1.5.0_10";
        "/usr/local/bin/jscoverage":
            source => "${centos5root}/usr/local/bin/jscoverage";
        "/usr/local/bin/jscoverage-server":
            source => "${centos5root}/usr/local/bin/jscoverage-server";
    }

    }

    Darwin: {
        $devtools_home = "/private/nfs/darwin9/devtools"
        $tar = "/usr/bin/tar"

        install_devtools { 
            Python:
                version     => "2.5.2",
                creates     => "/tools/Python-2.5.2/bin/python",
                subscribe   => file["/tools/python"];
            Twisted:
                version     => "8.0.1",
                creates     => "/tools/Twisted-8.0.1/twisted",
                subscribe   => file["/tools/twisted"];
#            mercurial:
#                version     => "0.9.5",
#                creates     => "/tools/mercurial-0.9.5/hg",
#                subscribe   => file["/tools/mercurial"];
            zopeinterface:
                version     => "3.4.1",
                creates     => "/tools/zope.interface-3.4.1/build/lib.macosx-10.3-i386-2.5/zope/interface/interface.py",
                subscribe   => file["/tools/zope.interface"];
            mercurial:
                version     => "1.2.1",
                creates     => "/tools/dist/mercurial-1.2.1/hg",
#                cwd         => "/tools/dist";
                subscribe   => file["/tools/mercurial"];
        }

        file {
            "/tools/python":
                ensure  => "/tools/Python-2.5.2";
            "/tools/twisted":
                ensure  => "/tools/Twisted-8.0.1";
            "/tools/mercurial":
                ensure  => "/tools/dist/mercurial-1.2.1";
            "/tools/zope.interface":
                ensure  => "/tools/zope.interface-3.4.1";
        }
    }

    default: {
        $devtools_home = "/tmp"
    }
    }
}

# This is the function that does most of the work.  It takes a file,
# name-1.2.3.tgz and unpacks it to /tools/name-1.2.3
# this fits the convention of all /tools packages with the exception of jdk,
# which we make to fit and make compatible with a symbolic link above.

define install_devtools($version, $creates) {
    exec {"$tar xzf $devtools_home/$name-$version.tgz":
        cwd         => "/tools",
        creates     => $creates,
        alias       => "untar-$name",
    }
}
