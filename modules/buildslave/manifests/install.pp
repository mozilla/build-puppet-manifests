# Install the buildbot and buildbot-slave packages in a virtualenv keyed
# from the version number, with a symlink denoting the active version
#
# USAGE:
#
#   include buildslave::install
#
# OR
#
#   buildslave::install::version {
#       "0.8.4":
#           active => false;
#       "0.8.5":
#           active => true;
#   }
#
# The first form will install the current version of buildbot on this
# host.  Under normal circumstances, this is what should appear in the
# manifests.  The second form allows the installation of alternative versions
# of buildbot.  Multiple versions can be specified, and those versions
# will all be installed side-by-side.  At most one can have the 'active'
# parameter, which makes the /tools/buildbot link point to that version.
#
# The second form is intended for use in staging and for partial deployments of
# new versions of buildbot.
#
# DEPENDENCIES
#
# This module depends on the 'python' module.
#
# NOTES
#
# This class does not support versions of Buildbot older than 0.8.1 (before the
# master/slave split).  As a special case, if you specify version "0.8.0", it
# will simply use the existing 0.8.0 directory.
#
# To add a new version of buildbot:
#
#  - establish the desired version of the buildbot source, on the 'slaves'
#    branch of build/buildbot
#  - tag it with SLAVE_X_Y_Z_MOZN as appropriate
#  - add slave/buildslave/VERSION containing the lower-case form, e.g.,
#    3.4.1-moz3.  similarly for master/buildslave/VERSION
#  - run 'setup.py sdist' in the slave/ directory and in the master/ directory
#  - copy the resulting {master,slave}/dist/buildbot-*.tar.gz into the
#    python-packages directory (see modules/python/manifests/virtualenv.pp).
#  - add a new case below setting any relevant variables for the install.

class buildslave::install::settings {
    $production_version = "0.8.4-pre-moz1"
}

# this class simply invokes the resource type with the production version
class buildslave::install {
    include buildslave::install::settings

    buildslave::install::version {
        # remove old versions
        "0.8.0.old":
            ensure => absent;

        "0.8.0pre":
            ensure => absent;

        # inactive previous version
        "0.8.0":
            active => false;

        "$buildslave::install::settings::production_version":
            active => true;
    }
}

# install a particular version of the buildslave code
#
# title: version number
# active: if true, make /tools/buildbot point here (default false)
# ensure: present/absent
define buildslave::install::version($active=false, $ensure="present") {
    $version = $title

    # Pick a python based on which kind of slave this is.  This should
    # eventually be replaced by a puppet-managed install of a specified version
    # of python.  The effect here is:
    #
    # test
    #  linux - /usr/bin/python (2.6.2)
    #  linux64 - /usr/bin/python (2.6.2)
    #  darwin9 - /usr/bin/python (2.5.1)
    #  darwin10 - /usr/bin/python (2.6.1)
    #
    # build
    #  linux - /tools/python-2.6.5/bin/python (2.6.5)
    #  darwin9 - /tools/python/bin/python (2.5.2)
    #  darwin10 - /tools/python-2.6.4/bin/python (2.6.4)
    #
    case $operatingsystem {
        CentOS: {
            $python = "/tools/python-2.6.5/bin/python"
        }

        Darwin: {
            # luckily, Darwin build and test slaves have different versions!
            # the better fix is in bug 637686
            case $operatingsystemrelease {
                "10.2.0": { # darwin10 build; talos is 10.6.0
                    $python = "/tools/python-2.6.4/bin/python"
                }
                "9.2.0": { # darwin9 build; talos is 9.8.0
                    $python = "/tools/python/bin/python"
                }
                default: {
                    $python = "/usr/bin/python"
                }
            }
        }
        default: {
            $python = "/usr/bin/python"
        }
    }

    # set the parameters for the virtualenv below.  Each version should
    # set $python and $packages explicitly.
    case $version {
        # old versions
        "0.8.0.old": { }
        "0.8.0pre": { }

        # legacy version (see below)
        "0.8.0": { }

        # newer versions
        "0.8.4-pre-moz1": {
            $packages = [
                          "zope.interface==3.6.1",
                          "buildbot-slave==$version",
                          "buildbot==$version",
                          # note that this tarball of Twisted is *not* the one
                          # from pypi; that tarball was unpacked,
                          # conditionalExtensions was set to [] in both
                          # setup.py and twisted/topfiles/setup.py, and a new
                          # tarball made with 'setup.py sdist', and the result is in
                          # the python-packages directory.
                          "Twisted==10.2.0",
                          # buildbot doesn't require simplejson, but some of the
                          # scripts we run (hgtool.py, graph_server_post.py) do
                          # - bug 637508
                          "simplejson==2.1.3" ]
        }

        default: {
            fail("unrecognized buildbot version $version")
        }
    }

    case $ensure {
        present: {
            case $version {
                default: {
                    python::virtualenv {
                        "/tools/buildbot-$version":
                            python => $python,
                            packages => $packages;
                    }
                }

                # special-case the 0.8.0 version to do it the old-fashioned way
                "0.8.0": {
                    include buildslave::install::old
                }
            }

            if $active {
                file {
                    "/tools/buildbot":
                        ensure => "link",
                        target => "/tools/buildbot-$version";
                }
            }
        }

        absent: {
            # absent? that's easy - blow away the directory
            file {
                "/tools/buildbot-$version":
                    ensure => absent,
                    backup => false,
                    force => true;
            }
        }
    }
}

# install Buildbot-0.8.0 the old fashioned (system-global) way.  Note that the
# version numbers vary here (moz1, moz2, etc.)
class buildslave::install::old {
    case $operatingsystem {
        CentOS: {
            case $hardwaremodel {
                "x86_64": {
                    packages::install_rpm {
                        "buildbot":
                            creates     => "/tools/buildbot-0.8.0/bin/buildbot",
                            version     => "0.8.0-0moz2",
                            subscribe   => File["/tools/buildbot"],
                            # these are defined in devtools.pp
                            require     => [
                                Packages::Install_rpm["python26"],
                                Packages::Install_rpm["zope.interface"],
                                Packages::Install_rpm["twisted-core"],
                                Packages::Install_rpm["twisted"],
                            ];
                    }
                }

                default: {

                    packages::install_rpm {
                        "buildbot":
                            creates     => "/tools/buildbot-0.8.0/bin/buildbot",
                            version     => "0.8.0-0moz2",
                            subscribe   => File["/tools/buildbot"],
                            # these are defined in devtools.pp
                            require     => [
                                Packages::Install_rpm["python26"],
                                Packages::Install_rpm["zope.interface"],
                                Packages::Install_rpm["twisted-core"],
                                Packages::Install_rpm["twisted"],
                            ];
                    }
                }
            }
        }

        # formerly in os/talos_osx.pp and packages/devtools.pp
        Darwin: {
            install_dmg {
                "buildbot-0.8.0.dmg":
                    creates     => "/tools/buildbot-0.8.0/lib",
                    subscribe   => File["/tools/buildbot"];
            }
        }

        # formerly in os/talos_fedora.pp
        Fedora: {
            package {
                "buildbot":
                    source => "${platform_httproot}/RPMs/buildbot-0.8.0-0moz1.${hardwaremodel}.rpm",
                    provider => "rpm",
                    ensure => '0.8.0-0moz1';
            }
        }
    }
}       
