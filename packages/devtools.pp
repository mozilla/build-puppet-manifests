#devtools.pp
#  this manifest installs all of the packages in the /tools tree
#  with the use of a helper function (install_devtools) defined below

class devtools {

    file { "/tools": ensure => directory, mode => 755, owner => root, group => root }

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
            subscribe   => file["/tools/jdk1.5.0_10"];
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
        ## Throwing this in for compatability with the install_devtools convention
        "/tools/jdk1.5.0_10":
            ensure  => "/tools/jdk-1.5.0_10";
    }
}

# This is the function that does most of the work.  It takes a file,
# name-1.2.3.tgz and unpacks it to /tools/name-1.2.3
# this fits the convention of all /tools packages with the exception of jdk,
# which we make to fit and make compatible with a symbolic link above.

define install_devtools($version, $creates) {
    exec { "/bin/tar xzf /tmp/$name-$version.tgz":
        cwd         => "/tools",
        creates     => $creates,
        alias       => "untar-$name",
        subscribe   => download_file["$name-$version.tgz"]
    }
    
    download_file {
        "$name-$version.tgz":
            # TODO: remove this hardcoding
            site    => "http://staging-puppet.build.mozilla.org/dist",
            cwd     => "/tmp",
            creates => "/tmp/$name-$version.tgz",
            require => file["/tmp"],
            alias   => "$name",
            user    => root,
            before  => Exec["untar-$name"]
    }

}
