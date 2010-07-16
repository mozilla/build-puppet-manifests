#devtools.pp
#  this manifest installs all of the packages in the /tools tree

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

            case $hardwaremodel {
        
                "x86_64": {
                    install_rpm {
                        "buildbot":
                            creates     => "/tools/buildbot-$buildbot_version/bin/buildbot",
                            version     => "${buildbot_version}-0moz2",
                            subscribe   => File["/tools/buildbot"],
                            require     => [Install_rpm["python26"], Install_rpm["zope.interface"], Install_rpm["twisted-core"], Install_rpm["twisted"]];
                        "gcc433":
                            creates     => "/tools/gcc-4.3.3/installed/bin/gcc",
                            version     => "4.3.3-0moz1";
                        "gcc45":
                            creates     => "/tools/gcc-4.5/bin/gcc",
                            version     => "4.5.0-0moz2";
                        "python25":
                            creates     => "/tools/python-2.5.1/bin/python",
                            version     => "2.5.1-0moz1",
                            subscribe   => File["/tools/python"];
                        "python26":
                            creates     => "/tools/python-2.6.5/bin/python",
                            version     => "2.6.5-0moz1";
                        "twisted":
                            creates     => "/tools/twisted-2.4.0/bin/twistd",
                            version     => "2.4.0-0moz1",
                            subscribe   => File["/tools/twisted"],
                            require     => [Install_rpm["python25"], Install_rpm["twisted-core"], Install_rpm["zope.interface"]];
                        "twisted-core":
                            creates     => "/tools/twisted-core-2.4.0/bin/twistd",
                            version     => "2.4.0-0moz1",
                            subscribe   => File["/tools/twisted-core"],
                            require     => [Install_rpm["python25"], Install_rpm["zope.interface"]];
                        "zope.interface":
                            creates     => "/tools/zope-interface/lib/python2.5/site-packages/zope/interface/interface.py",
                            version     => "3.3.0-0moz1",
                            subscribe   => File["/tools/zope-interface"],
                            require     => Install_rpm["python25"];
                        "jdk1.5":
                            creates     => "/tools/jdk-1.5.0_15/bin/java",
                            version     => "1.5.0_15-0moz1",
                            subscribe   => File["/tools/jdk"];
                        "build-tools":
                            creates     => "/tools/build-tools-$buildtools_version/stage/post_upload.py",
                            version     => "${buildtools_version}-0moz1",
                            subscribe   => File["/tools/build-tools"],
                            before      => Service["buildbot-tac"];
                        "mercurial":
                            creates     => "/tools/python-2.5.1/lib/python2.5/site-packages/mercurial/version.py",
                            version     => "1.1.2-0moz1",
                            require     => Install_rpm["python25"];
                        "mercurial-py26":
                            creates     => "/tools/python-2.6.5/lib/python2.6/site-packages/mercurial/windows.py",
                            version     => "1.5.1-0moz1",
                            require     => Install_rpm["python26"];
                        "virtualenv":
                            creates     => "/tools/python-2.6.5/lib/python2.6/site-packages/virtualenv_support/site.py",
                            version     => "1.4.8-0moz1",
                            require     => Install_rpm["python26"];
                    }
                }

                default: {

                    install_rpm {
                        "buildbot":
                            creates     => "/tools/buildbot-$buildbot_version/bin/buildbot",
                            version     => "${buildbot_version}-0moz2",
                            subscribe   => File["/tools/buildbot"],
                            require     => [Install_rpm["python26"], Install_rpm["zope.interface"], Install_rpm["twisted-core"], Install_rpm["twisted"]];
                        "gcc411":
                            creates     => "/tools/gcc-4.1.1/bin/gcc",
                            version     => "4.1.1-0moz1",
                            subscribe   => File["/tools/gcc"];
                        "gcc433":
                            creates     => "/tools/gcc-4.3.3/installed/bin/gcc",
                            version     => "4.3.3-0moz1";
                        "gcc45":
                            creates     => "/tools/gcc-4.5/bin/gcc",
                            version     => "4.5.0-0moz2";
                        "python25":
                            creates     => "/tools/python-2.5.1/bin/python",
                            version     => "2.5.1-0moz1",
                            subscribe   => File["/tools/python"];
                        "python26":
                            creates     => "/tools/python-2.6.5/bin/python",
                            version     => "2.6.5-0moz1";
                        "twisted":
                            creates     => "/tools/twisted-2.4.0/bin/twistd",
                            version     => "2.4.0-0moz1",
                            subscribe   => File["/tools/twisted"],
                            require     => [Install_rpm["python25"], Install_rpm["twisted-core"], Install_rpm["zope.interface"]];
                        "twisted-core":
                            creates     => "/tools/twisted-core-2.4.0/bin/twistd",
                            version     => "2.4.0-0moz1",
                            subscribe   => File["/tools/twisted-core"],
                            require     => [Install_rpm["python25"], Install_rpm["zope.interface"]];
                        "zope.interface":
                            creates     => "/tools/zope-interface/lib/python2.5/site-packages/zope/interface/interface.py",
                            version     => "3.3.0-0moz1",
                            subscribe   => File["/tools/zope-interface"],
                            require     => Install_rpm["python25"];
                        "jdk1.5":
                            creates     => "/tools/jdk-1.5.0_10/bin/java",
                            version     => "1.5.0_10-0moz1",
                            subscribe   => File["/tools/jdk"];
                        "jdk1.6":
                            creates     => "/tools/jdk-1.6.0_17/bin/java",
                            version     => "1.6.0_17-0moz1",
                            subscribe   => File["/tools/jdk6"];
                        "build-tools":
                            creates     => "/tools/build-tools-$buildtools_version/stage/post_upload.py",
                            version     => "${buildtools_version}-0moz1",
                            subscribe   => File["/tools/build-tools"],
                            before      => Service["buildbot-tac"];
                        "android-sdk":
                            creates     => "/tools/android-sdk-r8/tools/android",
                            version     => "r8-0moz3",
                            subscribe   => File["/tools/android-sdk"];
                        "android-ndk":
                            creates     => "/tools/android-ndk-r4c/build/tools/make-release.sh",
                            version     => "r4c-0moz3",
                            subscribe   => File["/tools/android-ndk"];
                        "mercurial":
                            creates     => "/tools/python-2.5.1/lib/python2.5/site-packages/mercurial/version.py",
                            version     => "1.1.2-0moz1",
                            require     => Install_rpm["python25"];
                        "mercurial-py26":
                            creates     => "/tools/python-2.6.5/lib/python2.6/site-packages/mercurial/windows.py",
                            version     => "1.5.1-0moz1",
                            require     => Install_rpm["python26"];
                        "virtualenv":
                            creates     => "/tools/python-2.6.5/lib/python2.6/site-packages/virtualenv_support/site.py",
                            version     => "1.4.8-0moz1",
                            require     => Install_rpm["python26"];
                    }
                    file {
                        "/tools/jdk6":
                            ensure => "/tools/jdk-1.6.0_17";
                        "/tools/android-sdk":
                            ensure => "/tools/android-sdk-r8";
                        "/tools/android-ndk":
                            ensure => "/tools/android-ndk-r4c";
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
                    backup => false,
                    force => true;
                "/tools/gcc-4.2.3":
                    ensure => absent,
                    backup => false,
                    force => true;
                "/tools/gcc-4.5.0":
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
                    source => "${platform_fileroot}/usr/local/bin/jscoverage";
                "/usr/local/bin/jscoverage-server":
                    source => "${platform_fileroot}/usr/local/bin/jscoverage-server";
            }

        }

        Darwin: {
            case $operatingsystemrelease {
                # 10.5 build machines only.
                "9.2.0": {
                    install_dmg { 
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
                    install_dmg { 
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
            install_dmg {
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
