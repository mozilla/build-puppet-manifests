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
                "gcc45test":
                    ensure => absent;
                "moz_binutils_2.21.1":
                    ensure => absent;
                "clang":
                    provider  => rpm,
                    ensure    => absent;
                "clang_158158_moz0":
                    provider  => rpm,
                    ensure    => absent;
                "clang_154343_moz0":
                    provider  => rpm,
                    ensure    => absent;
            }
            install_rpm {
                "clang_155417_moz0":
                    version => "3.0-r155417.moz0",
                    creates => "/tools/clang-3.0-r155417.moz0/bin/clang";
                "moz_binutils_2.22":
                    version => "2.22-0moz1",
                    creates => "/tools/binutils-2.22/bin/ld.gold";
                "gcc45":
                    creates     => "/tools/gcc-4.5/bin/gcc",
                    version     => "4.5.2-0moz1";

                "gcc45_0moz2":
                    creates     => "/tools/gcc-4.5-0moz2/bin/gcc",
                    version     => "4.5.2-0moz2";

                # For testing patches to the compiler
                "gcc45_0moz3":
                    creates     => "/tools/gcc-4.5-0moz3/bin/gcc",
                    version     => "4.5.2-0moz3";

            }
            file {
                # clang symlinks
                "/tools/clang-3.0":
                    ensure  => "/tools/clang-3.0-r155417.moz0",
                    force => true;
                "/tools/clang":
                    ensure  => "/tools/clang-3.0",
                    force => true;
            }
            case $hardwaremodel {

                "x86_64": {
                    packages::install_rpm {
                        "gcc433":
                            creates     => "/tools/gcc-4.3.3/installed/bin/gcc",
                            version     => "4.3.3-0moz1";
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
                    package {
                        "android-sdk12":
                            provider  => rpm,
                            ensure    => absent;
                        "android-sdk13":
                            provider  => rpm,
                            ensure    => "r13-0moz1",
                            source    => "${platform_httproot}/RPMs/android-sdk13-r13-0moz1.${hardwaremodel}.rpm";
                        "android-sdk15":
                            provider  => rpm,
                            ensure    => "r15-0moz1",
                            source    => "${platform_httproot}/RPMs/android-sdk15-r15-0moz1.${hardwaremodel}.rpm";
                        "android-ndk":
                            provider => rpm,
                            ensure => absent;
                    }
                    packages::install_rpm {
                        "gcc411":
                            creates     => "/tools/gcc-4.1.1/bin/gcc",
                            version     => "4.1.1-0moz1",
                            subscribe   => File["/tools/gcc"];
                        "gcc433":
                            creates     => "/tools/gcc-4.3.3/installed/bin/gcc",
                            version     => "4.3.3-0moz1";
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
                        "android-ndk5":
                            creates     => "/tools/android-ndk5/build/tools/make-release.sh",
                            version     => "r5c-0moz3";
                        "android-ndk7":
                            creates     => "/tools/android-ndk7/build/tools/make-release.sh",
                            version     => "r7b-0moz2";
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
                            ensure => "absent";
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
            case $macosx_productversion_major {
                "10.5": {
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
                "10.6": {
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
                "10.7": {
                    package { 
                        "python-2.7.2.dmg":
                            source      => "${platform_httproot}/DMGs/python-2.7.2.dmg",
                            ensure      => installed,
                            provider    => pkgdmg,
                            subscribe   => File["/tools/python"];
                    }
                    file {
                        "/tools/python":
                            ensure  => "/tools/python-2.7.2",
                            force   => true;
                    }
                }
            }

            case $macosx_productversion_major{
                "10.6", "10.7": {
                    package {
                        "clang-3.0-r155417.moz0.dmg":
                            provider    => pkgdmg,
                            ensure      => installed,
                            source      => "${platform_httproot}/DMGs/clang-3.0-r155417.moz0.dmg";
                    }
                    file {
                        # clang symlinks
                        "/tools/clang-3.0":
                            ensure  => "/tools/clang-3.0-r155417.moz0",
                            force => true;
                        "/tools/clang":
                            ensure  => "/tools/clang-3.0",
                            force => true;
                        # old clang packages
                        ["/tools/clang-3.0-r158158.moz0",
                        "/var/db/.puppet_pkgdmg_installed_clang-3.0-r158158.moz0.dmg",
                        "/tools/clang-3.0-r154343.moz0",
                        "/var/db/.puppet_pkgdmg_installed_clang-3.0-r154343.moz0.dmg",
                        "/tools/clang-3.0-r152341.moz0",
                        "/var/db/.puppet_pkgdmg_installed_clang-3.0-r152341.moz0.dmg",
                        "/tools/clang-3.0-151655",
                        "/var/db/.puppet_pkgdmg_installed_clang-3.0-151655.dmg",
                        "/tools/clang-3.0-149163",
                        "/var/db/.puppet_pkgdmg_installed_clang-3.0-149163.dmg",
                        "/tools/clang-3.0-145194",
                        "/var/db/.puppet_pkgdmg_installed_clang-3.0-145194.dmg",
                        "/tools/clang-3.0-151367",
                        "/var/db/.puppet_pkgdmg_installed_clang-3.0-151367.dmg"]:
                            force => true,
                            ensure => absent;
                    }
                }
            }
            case $macosx_productversion_major{
                "10.5", "10.6": {
                    exec {
                        # Remove macports hg if it's installed
                        remove-macport-hg:
                            command => "/opt/local/bin/port uninstall mercurial",
                            onlyif => "/bin/test -f /opt/local/bin/hg";
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
    }
}
