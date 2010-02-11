#devtools.pp
#  this manifest installs all of the packages in the /tools tree
#  with the use of a helper function (install_devtools) defined below

# This file is setup to work for both CentOS and Darwin9

class devtools {
    $buildbot_version = "5f43578cba2b"
    $buildtools_version = "0b149c0ad18d"
    $old_buildtools_version = "605b16dc7e05"

    file { ["/tools", "/tools/dist"]: ensure => directory, mode => 755 }

    case $hardwaremodel {
        "x86_64": {
            $gcc_version = "4.3.3/installed"
            $jdk_version = "1.5.0_15"
        }
        default: {
            $gcc_version = "4.1.1"
            $jdk_version = "1.5.0_10"
        }
    }

    case $operatingsystem {

        CentOS: {
            $centos5root = "/N/centos5"
            $devtools_home = "${centos5root}/dist"
            $tar = "/bin/tar"

	    case $hardwaremodel {
	    
            "x86_64": {
	        install_x86_64_devtools {
                gcc:
                    version     => "4.3.3",
                    creates     => "/tools/gcc-4.3.3/installed/bin/gcc",
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
                    version     => "1.5.0_15",
                    creates     => "/tools/jdk-1.5.0_15/bin/java",
                    subscribe   => file["/tools/jdk"];
#                buildbot:
#                    version     => "$buildbot_version",
#                    creates     => "/tools/buildbot-$buildbot_version/bin/buildbot",
#                    subscribe   => file["/tools/buildbot"];
#                build-tools:
#                    version     => "$buildtools_version",
#                    creates     => "/tools/build-tools-$buildtools_version/stage/post_upload.py",
#                    subscribe   => file["/tools/build-tools"];
                }
            }

            default: {
            ### The install_devtools function is found at the bottom    
            install_devtools {
                gcc:
                    version     => "4.1.1",
                    creates     => "/tools/gcc-4.1.1/bin/gcc",
                    subscribe   => file["/tools/gcc"];
                gcc433:
                    version     => "4.3.3",
                    creates     => "/tools/gcc-4.3.3/installed/bin/gcc";
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
                    subscribe   => file["/tools/jdk"];
                buildbot:
                    version     => "$buildbot_version",
                    creates     => "/tools/buildbot-$buildbot_version/bin/buildbot",
                    subscribe   => file["/tools/buildbot"];
                build-tools:
                    version     => "$buildtools_version",
                    creates     => "/tools/build-tools-$buildtools_version/stage/post_upload.py",
                    subscribe   => file["/tools/build-tools"];
            }
            }
	    }

            file {
                # Ensure previous version of build-tools is gone
                "/tools/build-tools-$old_buildtools_version":
                    ensure => absent,
                    force => true;
                "/tools/gcc-4.2.3":
                    ensure => absent,
                    backup => false,
                    force => true;
                # Setup our symbolic links
                "/tools/gcc":
                    ensure  => "/tools/gcc-$gcc_version",
                    force => true;
                "/tools/python":
                    ensure  => "/tools/python-2.5.1";
                "/tools/twisted":
                    ensure  => "/tools/twisted-2.4.0";
                "/tools/twisted-core":
                    ensure  => "/tools/twisted-core-2.4.0";
                "/tools/zope-interface":
                    ensure  => "/tools/zope-interface-3.3.0";
                "/tools/jdk":
                    ensure  => "/tools/jdk-$jdk_version";
                "/tools/buildbot":
                    # needs to be forced because the first time we do this
                    # Buildbot will be a directory, not a symlink
                    force   => true,
                    ensure  => "/tools/buildbot-$buildbot_version";
                "/tools/build-tools":
                    ensure => "/tools/build-tools-$buildtools_version";
                "/usr/local/bin/jscoverage":
                    source => "${centos5root}/usr/local/bin/jscoverage";
                "/usr/local/bin/jscoverage-server":
                    source => "${centos5root}/usr/local/bin/jscoverage-server";
            }

        }

        Darwin: {
            $devtools_home = "/N/darwin9/devtools"
            $tar = "/usr/bin/tar"

            install_devtools { 
                Python:
                    version     => "2.5.2",
                    creates     => "/tools/Python-2.5.2/bin/python",
                    require     => file["/etc/fstab"],
                    subscribe   => file["/tools/python"];
                Twisted:
                    version     => "8.0.1",
                    creates     => "/tools/Twisted-8.0.1/twisted",
                    require     => file["/etc/fstab"],
                    subscribe   => file["/tools/twisted"];
                zope-interface:
                    version     => "3.4.1",
                    creates     => "/tools/zope-interface-3.4.1/lib/python2.5/site-packages/zope/interface/interface.py",
                    require     => file["/etc/fstab"],
                    subscribe   => file["/tools/zope-interface"];
                mercurial:
                    version     => "1.2.1",
                    creates     => "/tools/mercurial-1.2.1/hg",
                    require     => file["/etc/fstab"],
                    subscribe   => file["/tools/mercurial"];
                buildbot:
                    version     => "$buildbot_version",
                    creates     => "/tools/buildbot-$buildbot_version/bin/buildbot",
                    subscribe   => file["/tools/buildbot"];
                build-tools:
                    version     => "$buildtools_version",
                    creates     => "/tools/build-tools-$buildtools_version/stage/post_upload.py",
                    subscribe   => file["/tools/build-tools"];
                }

            file {
                "/tools/build-tools-$old_buildtools_version":
                    ensure => absent,
                    force => true;
                "/tools/python":
                    ensure  => "/tools/Python-2.5.2",
                    force   => true;
                "/tools/twisted":
                    ensure  => "/tools/Twisted-8.0.1";
                "/tools/mercurial":
                    ensure  => "/tools/dist/mercurial-1.2.1";
                "/tools/zope-interface":
                    ensure  => "/tools/zope-interface-3.4.1";
                "/tools/buildbot":
                    # needs to be forced because the first time we do this
                    # Buildbot will be a directory, not a symlink
                    force   => true,
                    ensure  => "/tools/buildbot-$buildbot_version";
                "/tools/build-tools":
                    ensure => "/tools/build-tools-$buildtools_version";
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

define install_x86_64_devtools($version, $creates) {
    exec {"$tar xzf $devtools_home/$name-$version.x86_64.tgz":
        cwd         => "/tools",
        creates     => $creates,
        alias       => "untar-$name",
    }
}
