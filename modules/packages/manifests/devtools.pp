#devtools.pp
#  this manifest installs all of the packages in the /tools tree,
#  but only for build systems, not test.

class packages::devtools {
    $buildtools_version = "ac05929dc0b1"
    $old_buildtools_version = "0b149c0ad18d"

    file {
        ["/tools", "/tools/dist"]:
            ensure => directory,
            mode => 755;
        "/tools/build-tools":
            ensure => absent;
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
            package {
                "mercurial":
                    source => "${platform_httproot}/RPMs/mercurial-1.6.3-0moz1.${hardwaremodel}.rpm",
                    ensure => latest,
                    provider => rpm;
            }
            install_rpm {
                "clang":
                    version => "3.0-r132336.moz0",
                    creates => "/tools/clang-3.0/bin/clang";
            }
            case $hardwaremodel {
        
                "x86_64": {
                    packages::install_rpm {
                        "gcc433":
                            creates     => "/tools/gcc-4.3.3/installed/bin/gcc",
                            version     => "4.3.3-0moz1";
                        "gcc45":
                            creates     => "/tools/gcc-4.5/bin/gcc",
                            version     => "4.5.2-0moz1";
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
                            require     => [Packages::Install_rpm["python25"], Packages::Install_rpm["twisted-core"], Packages::Install_rpm["zope.interface"]];
                        "twisted-core":
                            creates     => "/tools/twisted-core-2.4.0/bin/twistd",
                            version     => "2.4.0-0moz1",
                            subscribe   => File["/tools/twisted-core"],
                            require     => [Packages::Install_rpm["python25"], Packages::Install_rpm["zope.interface"]];
                        "zope.interface":
                            creates     => "/tools/zope-interface/lib/python2.5/site-packages/zope/interface/interface.py",
                            version     => "3.3.0-0moz1",
                            subscribe   => File["/tools/zope-interface"],
                            require     => Packages::Install_rpm["python25"];
                        "simplejson-py25":
                            creates     => "/tools/python-2.5.1/lib/python2.5/site-packages/simplejson/__init__.py",
                            version     => "2.1.1-0moz1",
                            require     => Packages::Install_rpm["python25"];
                        "jdk1.5":
                            creates     => "/tools/jdk-1.5.0_15/bin/java",
                            version     => "1.5.0_15-0moz1",
                            subscribe   => File["/tools/jdk"];
                        "mercurial-py26":
                            creates     => "/tools/python-2.6.5/lib/python2.6/site-packages/mercurial/windows.py",
                            version     => "1.5.1-0moz1",
                            require     => Packages::Install_rpm["python26"];
                        "virtualenv":
                            creates     => "/tools/python-2.6.5/lib/python2.6/site-packages/virtualenv_support/site.py",
                            version     => "1.4.8-0moz1",
                            require     => Packages::Install_rpm["python26"];
                    }
                }

                default: {

                    packages::install_rpm {
                        "gcc411":
                            creates     => "/tools/gcc-4.1.1/bin/gcc",
                            version     => "4.1.1-0moz1",
                            subscribe   => File["/tools/gcc"];
                        "gcc433":
                            creates     => "/tools/gcc-4.3.3/installed/bin/gcc",
                            version     => "4.3.3-0moz1";
                        "gcc45":
                            creates     => "/tools/gcc-4.5/bin/gcc",
                            version     => "4.5.2-0moz1";
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
                            require     => [Packages::Install_rpm["python25"], Packages::Install_rpm["twisted-core"], Packages::Install_rpm["zope.interface"]];
                        "twisted-core":
                            creates     => "/tools/twisted-core-2.4.0/bin/twistd",
                            version     => "2.4.0-0moz1",
                            subscribe   => File["/tools/twisted-core"],
                            require     => [Packages::Install_rpm["python25"], Packages::Install_rpm["zope.interface"]];
                        "zope.interface":
                            creates     => "/tools/zope-interface/lib/python2.5/site-packages/zope/interface/interface.py",
                            version     => "3.3.0-0moz1",
                            subscribe   => File["/tools/zope-interface"],
                            require     => Packages::Install_rpm["python25"];
                        "simplejson-py25":
                            creates     => "/tools/python-2.5.1/lib/python2.5/site-packages/simplejson/__init__.py",
                            version     => "2.1.1-0moz1",
                            require     => Packages::Install_rpm["python25"];
                        "jdk1.5":
                            creates     => "/tools/jdk-1.5.0_10/bin/java",
                            version     => "1.5.0_10-0moz1",
                            subscribe   => File["/tools/jdk"];
                        "jdk1.6":
                            creates     => "/tools/jdk-1.6.0_17/bin/java",
                            version     => "1.6.0_17-0moz1",
                            subscribe   => File["/tools/jdk6"];
                        "android-sdk":
                            creates     => "/tools/android-sdk-r8/tools/android",
                            version     => "r8-0moz3",
                            subscribe   => File["/tools/android-sdk"];
                        "android-ndk":
                            creates     => "/tools/android-ndk-r4c/build/tools/make-release.sh",
                            version     => "r4c-0moz3",
                            subscribe   => File["/tools/android-ndk"];
                        "android-ndk5":
                            creates     => "/tools/android-ndk5/build/tools/make-release.sh",
                            version     => "r5c-0moz3";
                        "mercurial-py26":
                            creates     => "/tools/python-2.6.5/lib/python2.6/site-packages/mercurial/windows.py",
                            version     => "1.5.1-0moz1",
                            require     => Packages::Install_rpm["python26"];
                        "virtualenv":
                            creates     => "/tools/python-2.6.5/lib/python2.6/site-packages/virtualenv_support/site.py",
                            version     => "1.4.8-0moz1",
                            require     => Packages::Install_rpm["python26"];
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
                "/usr/local/bin/jscoverage":
                    source => "${platform_fileroot}/usr/local/bin/jscoverage",
                    owner  => "root",
                    group  => "root";
                "/usr/local/bin/jscoverage-server":
                    source => "${platform_fileroot}/usr/local/bin/jscoverage-server",
                    owner  => "root",
                    group  => "root";
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
                        "simplejson-2.1.1-py25.dmg":
                            creates     => "/tools/python/lib/python2.5/site-packages/simplejson/__init__.py";
                    }
                    file {
                        "/tools/python":
                            ensure  => "/tools/Python-2.5.2",
                            force   => true;
                        "/tools/zope-interface":
                            ensure  => "/tools/zope-interface-3.4.1";
                        "/tools/python/bin/hg":
                            ensure => absent;
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
            exec {
                # Remove macports hg if it's installed
                remove-macport-hg:
                    command => "/opt/local/bin/port uninstall mercurial",
                    onlyif => "/bin/test -f /opt/local/bin/hg";
            }
            package {
                "clang-3.0-r132336.moz0.dmg":
                    provider    => pkgdmg,
                    ensure      => installed,
                    source      => "${platform_httproot}/DMGs/clang-3.0-r132336.moz0.dmg";
            }
            install_dmg {
                "Twisted-8.0.1.dmg":
                    creates     => "/tools/Twisted-8.0.1/twisted/words/xish/xpathparser.py",
                    subscribe   => File["/tools/twisted"];
                "mercurial-1.7.5.dmg":
                    creates => "/tools/mercurial-1.7.5/bin/hg",
                    require => Exec["remove-macport-hg"];
            }
        
            file {
                "/tools/clang-2.9":
                    ensure      => absent;
                "/tools/twisted":
                    ensure  => "/tools/Twisted-8.0.1";
                "/tools/mercurial":
                    require => Install_dmg["mercurial-1.7.5.dmg"],
                    ensure  => "/tools/mercurial-1.7.5";
                "/usr/local/bin/hg":
                    ensure => "/tools/mercurial/bin/hg",
                    require => File["/tools/mercurial"];
            }
        }
    }
}
