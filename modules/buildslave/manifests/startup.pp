# Ensure that a buildslave starts up on this machine
#
# USAGE:
#
#  include buildslave::startup
#
# This class takes care of installing runslave.py and any other prerequisites,
# and hooking into the startup process as appropriate to the system.  The
# interface between this class and the puppet startup is somewhat ill-defined,
# and should be cleaned up.

class buildslave::startup {
    # currently, CentOS means build, so buildbot's started as root, while
    # Fedora means test, so buildbot's started via console.  This may get
    # more complicated later, maybe requiring a regexp on the slave name?
    # (which would require Puppet 0.25.0).  This could also be based on
    # $slaveType, although that includes 'stage', which throws things off.
    $startuptype = $operatingsystem ? {
        CentOS      => "initd",
        Fedora      => "desktop",
        Darwin      => "launchd"
    }

    # everyone uses runslave.py in the same place
    file {
        "/usr/local/bin/runslave.py":
            source => "puppet:///buildslave/runslave.py",
            owner  => "root",
            group  => $operatingsystem ? {
                        Darwin => "wheel",
                        default => "root",
                    },
            mode => 755;
    }

    case $startuptype {
        initd: {
            file {
                "/etc/init.d/buildbot":
                    source => "puppet:///buildslave/linux-initd-buildbot.sh",
                    owner  => "root",
                    group  => "root",
                    mode => 755,
                    notify => Exec["reset-buildbot-service"];

                # this file is no longer used
                "/etc/default/buildbot":
                    ensure  => absent;
            }

            exec {
                reset-buildbot-service:
                    command => "/sbin/chkconfig --del buildbot && /sbin/chkconfig --add buildbot",
                    refreshonly => true;
            }

            # buildbot-tac is no longer used, so disable it.
            service {
                "buildbot-tac":
                    provider => "redhat",
                    ensure => 'stopped',
                    enable => 'false',
                    before => File["/etc/init.d/buildbot-tac"]
            }
            file {
                "/etc/init.d/buildbot-tac":
                    ensure => absent
            }
        }

        desktop: {
            # this is set up to run by the puppet-config class
            file {
                "/home/cltbld/run-puppet-and-buildbot.sh":
                    source => "puppet:///buildslave/run-puppet-and-buildbot.sh",
                    owner => cltbld,
                    group => cltbld;
            }
        }

        launchd: {
            # talos, build-darwin9, and build-darwin10 each have different
            # PATHs and PYTHONPATHs.  This is a historical artifact, and I
            # (dustin) don't know if it's necessary to maintain this separation
            # anymore.

            case $slaveType {
                "test": {
                    $buildslave_path = "/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin"
                    case $macosx_productversion_major {
                        "10.5":  {
                            $buildslave_pythonpath = "NONE"
                        }
                        default: {
                            $buildslave_pythonpath = "/Library/Python/2.5/site-packages"
                        }
                    }
                }
                "build": {
                    $buildslave_path = "/tools/buildbot/bin:/tools/python/bin:/opt/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/X11/bin"
                    case $macosx_productversion_major {
                        "10.5":  {
                            $buildslave_pythonpath = "NONE"
                        }
                        "10.6": {
                            $buildslave_pythonpath = "/tools/buildbot/lib/python2.6/site-packages:/tools/twisted/lib/python2.6/site-packages/:/tools/twisted-core/lib/python2.6/site-packages:/tools/zope-interface/lib/python2.6/site-packages"
                        }
                        "10.7": {
                            $buildslave_pythonpath = "/tools/buildbot/lib/python2.7/site-packages"
                        }
                    }
                }
            }

            file {
                "/Library/LaunchAgents/org.mozilla.build.buildslave.plist":
                    content => template("buildslave/org.mozilla.build.buildslave.plist.erb"),
                    owner => "root",
                    group => "wheel",
                    notify => Exec["buildslave-startup-reboot"];
            }

            # The buildslave service is in /Library/LaunchAgents, so it's run
            # on a per-login basis, from an instance of launchd owned by
            # cltbld.  Puppet is run from /Library/LaunchDaemons, so it's run
            # on a per-boot basis, as root.  That means that puppet processing
            # proceeds asynchronously with the cltbld login process.  If we
            # alter the plist, we have no way of knowing if cltbld has already
            # logged in and started its launchd (in which case we'd need to run
            # 'launchctl load' as cltbld to reload the plist) or if it's still
            # in the process of logging in (in which case 'launchctl load'
            # would fail)
            #
            # The solution is to simply reboot the slave whenever it starts up
            # and gets a new plist file.  Bug 620530 suggests a better
            # solution.
            exec { 
                "buildslave-startup-reboot":
                    name => "/sbin/reboot",
                    refreshonly => true;
            }

            # remove old plists, rebooting if we do (to avoid double-starts)
            file {
                "/Library/LaunchAgents/buildbot.start.slave.plist":
                    ensure => absent,
                    notify => Exec["buildslave-startup-reboot"];

                "/Library/LaunchAgents/buildbot.start.talos.slave.plist":
                    ensure => absent,
                    notify => Exec["buildslave-startup-reboot"];
            }
                
            # remove the old buildbot-tac generator
            file {
                "/usr/local/bin/buildbot-tac":
                    ensure => absent;

                "/Library/LaunchAgents/buildbot-tac.generator.com.plist":
                    ensure => absent;
            }
        }
    }
}

