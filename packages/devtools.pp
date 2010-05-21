#devtools.pp
#  this manifest installs all of the packages in the /tools tree
#  with the use of a helper function (install_devtools) defined below

# This file is setup to work for both CentOS and Darwin9

class devtools {
    $buildbot_version = "0.8.0"
    $old_buildbot_version = "0.8.0pre"

    $buildtools_version = "0b149c0ad18d"
    $old_buildtools_version = "605b16dc7e05"

    file {
        ["/tools", "/tools/dist"]:
            ensure => directory,
            mode => 755;
    }

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
            $tar = "/bin/tar"

            case $hardwaremodel {
        
                "x86_64": {
                    install_x86_64_devtools {
                        gcc:
                            version     => "4.3.3",
                            creates     => "/tools/gcc-4.3.3/installed/bin/gcc",
                            subscribe   => File["/tools/gcc"];
                        python:
                            version     => "2.5.1",
                            creates     => "/tools/python-2.5.1/bin/python",
                            subscribe   => File["/tools/python"];
                        python26:
                            version     => "2.6.5",
                            creates     => "/tools/python-2.6.5/bin/python";
                        twisted:
                            version     => "2.4.0",
                            creates     => "/tools/twisted-2.4.0/bin/twistd",
                            subscribe   => File["/tools/twisted"];
                        twisted-core:
                            version     => "2.4.0",
                            creates     => "/tools/twisted-core-2.4.0/bin/twistd",
                            subscribe   => File["/tools/twisted-core"];
                        zope-interface:
                            version     => "3.3.0",
                            creates     => "/tools/zope-interface/lib/python2.5/site-packages/zope/interface/interface.py",
                            subscribe   => File["/tools/zope-interface"];
                        jdk:
                            version     => "1.5.0_15",
                            creates     => "/tools/jdk-1.5.0_15/bin/java",
                            subscribe   => File["/tools/jdk"];
                        buildbot:
                            version     => "$buildbot_version",
                            creates     => "/tools/buildbot-$buildbot_version/bin/buildbot",
                            subscribe   => File["/tools/buildbot"];
                        build-tools:
                            version     => "$buildtools_version",
                            creates     => "/tools/build-tools-$buildtools_version/stage/post_upload.py",
                            subscribe   => File["/tools/build-tools"];
                    }
                }

                default: {
                ### The install_devtools function is found at the bottom    
                    install_devtools {
                        gcc:
                            version     => "4.1.1",
                            creates     => "/tools/gcc-4.1.1/bin/gcc",
                            subscribe   => File["/tools/gcc"];
                        gcc433:
                            version     => "4.3.3",
                            creates     => "/tools/gcc-4.3.3/installed/bin/gcc";
                        gcc450:
                            version     => "4.5.0",
                            creates     => "/tools/gcc-4.5.0/bin/gcc";
                        python:
                            version     => "2.5.1",
                            creates     => "/tools/python-2.5.1/bin/python",
                            subscribe   => File["/tools/python"];
                        python26:
                            version     => "2.6.5",
                            creates     => "/tools/python-2.6.5/bin/python";
                        twisted:
                            version     => "2.4.0",
                            creates     => "/tools/twisted-2.4.0/bin/twistd",
                            subscribe   => File["/tools/twisted"];
                        twisted-core:
                            version     => "2.4.0",
                            creates     => "/tools/twisted-core-2.4.0/bin/twistd",
                            subscribe   => File["/tools/twisted-core"];
                        zope-interface:
                            version     => "3.3.0",
                            creates     => "/tools/zope-interface/lib/python2.5/site-packages/zope/interface/interface.py",
                            subscribe   => File["/tools/zope-interface"];
                        jdk:
                            version     => "1.5.0_10",
                            creates     => "/tools/jdk-1.5.0_10/bin/java",
                            subscribe   => File["/tools/jdk"];
                        jdk6:
                            version     => "1.6.0_17",
                            creates     => "/tools/jdk-1.6.0_17/bin/java",
                            subscribe   => File["/tools/jdk6"];
                        buildbot:
                            version     => "$buildbot_version",
                            creates     => "/tools/buildbot-$buildbot_version/bin/buildbot",
                            subscribe   => File["/tools/buildbot"];
                        build-tools:
                            version     => "$buildtools_version",
                            creates     => "/tools/build-tools-$buildtools_version/stage/post_upload.py",
                            subscribe   => File["/tools/build-tools"];
                        android-sdk:
                            version     => "r7",
                            creates     => "/tools/android-sdk-r7/tools/android",
                            subscribe   => File["/tools/android-sdk"];
                        android-ndk:
                            version     => "r3",
                            creates     => "/tools/android-ndk-r3/build/tools/make-release.sh",
                            subscribe   => File["/tools/android-ndk"];
                    }
                    file {
                        "/tools/jdk6":
                            ensure => "/tools/jdk-1.6.0_17";
                        "/tools/android-sdk":
                            ensure => "/tools/android-sdk-r7";
                        "/tools/android-ndk":
                            ensure => "/tools/android-ndk-r3";
                    }
                }
            }

            file {
                # Ensure previous version of build-tools is gone
                "/tools/build-tools-$old_buildtools_version":
                    ensure => absent,
                    force => true;
                # Ensure previous version of buildbot is gone
                "/tools/buildbot-$old_buildbot_version":
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
            $tar = "/usr/bin/tar"
            case $operatingsystemrelease {
                # 10.5 build machines only.
                "9.2.0": {
                    install_package { 
                        "Python-2.5.2.dmg":
                            creates     => "/tools/Python-2.5.2/share",
                            subscribe   => File["/tools/python"];
                        "zope-interface-3.4.1.dmg":
                            creates     => "/tools/zope-interface-3.4.1/lib/python2.5/site-packages/zope/interface/verify.py",
                            subscribe   => File["/tools/zope-interface"];
                        "mercurial-1.2.1.dmg":
                            creates     => "/tools/mercurial-1.2.1/tests/tinyproxy.py",
                            subscribe   => File["/tools/mercurial"];
                    }
                    file {
                        "/tools/python":
                            ensure  => "/tools/Python-2.5.2",
                            force   => true;
                        "/tools/zope-interface":
                            ensure  => "/tools/zope-interface-3.4.1";
                        "/tools/mercurial":
                            ensure  => "/tools/dist/mercurial-1.2.1";
                    }
                }
                # 10.6 build machines only
                "10.2.0": {
                    install_package { 
                        "python-2.6.4.dmg":
                            creates     => "/tools/python-2.6.4/bin/smtpd.py",
                            subscribe   => File["/tools/python"];
                        "zope-interface-3.5.3.dmg":
                            creates     => "/tools/zope-interface-3.5.3/lib/python2.6/site-packages/zope/interface/verify.py",
                            subscribe   => File["/tools/zope-interface"];
                    }
                    file {
                        "/tools/python":
                            ensure  => "/tools/python-2.6.4",
                            force   => true;
                        "/tools/zope-interface":
                            ensure  => "/tools/zope-interface-3.5.3";
                    }
                }
            }
            # All Mac build machines
            # devtools_home is defined above, so each platform gets a tarball specific to it
            install_package {
                "Twisted-8.0.1.dmg":
                    creates     => "/tools/Twisted-8.0.1/twisted/words/xish/xpathparser.py",
                    subscribe   => File["/tools/twisted"];
                "buildbot-${buildbot_version}.dmg":
                    creates     => "/tools/buildbot-${buildbot_version}/lib",
                    subscribe   => File["/tools/buildbot"];
                "build-tools-${buildtools_version}.dmg":
                    creates     => "/tools/build-tools-${buildtools_version}/stage/post_upload.py",
                    subscribe   => File["/tools/build-tools"];
            }
        
            file {
                "/tools/twisted":
                    ensure  => "/tools/Twisted-8.0.1";
                "/tools/buildbot":
                    # needs to be forced because the first time we do this
                    # Buildbot will be a directory, not a symlink
                    force   => true,
                    ensure  => "/tools/buildbot-$buildbot_version";
                "/tools/build-tools":
                    ensure => "/tools/build-tools-$buildtools_version";
            }
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
