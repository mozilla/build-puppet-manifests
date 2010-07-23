# cltbld.pp

class cltbld {

    File{ mode => 644, owner => cltbld, group => cltbld }

    #################################################
    # Manage the cltbld user:group
    #################################################
    user { "cltbld":
        ensure => 'present',
        name => "cltbld",
        uid => 500,
        gid => 500,
        comment => "Client Builder Puppet Test",
        managehome => true,
        home => $operatingsystem ? {
                    default => "/home/cltbld",
                },
        shell => "/bin/bash",
        provider => 'useradd',
        password => "i don't think so"
    }

    group { "cltbld":
        ensure => 'present',
        name => "cltbld",
        provider => 'groupadd',
        gid => 500;
    }

    #################################################
    # Manage cltbld user files
    #################################################
    file { 
            "/home/cltbld/.bash_profile":
                source => "${platform_fileroot}/home/cltbld/.bash_profile";

            "/home/cltbld/crontab":
                source => "${platform_fileroot}/home/cltbld/crontab";

            "/home/cltbld/.vnc":
                mode => 775,
                ensure => directory;

            "/home/cltbld/.vnc/passwd":
                mode => 600,
                source => "${platform_fileroot}/home/cltbld/.vnc/passwd";

            "/home/cltbld/.vnc/xstartup":
                mode => 700,
                source => "${platform_fileroot}/home/cltbld/.vnc/xstartup";
        }

        exec { "/usr/bin/crontab -u cltbld /home/cltbld/crontab":
                subscribe => File["/home/cltbld/crontab"];
        }

    case $operatingsystem {
        "CentOS": {
            case $hardwaremodel {
                "i686": {
                    file {
                        "/home/cltbld/.ssh":
                            mode => 755,
                            ensure => directory;
                        "/home/cltbld/.ssh/config":
                            mode => 600,
                            source => "${local_fileroot}/home/cltbld/.ssh/config";
                        "/home/cltbld/.ssh/known_hosts":
                            mode => 644,
                            source => "${local_fileroot}/home/cltbld/.ssh/known_hosts";
                    }
                }
            }
        }
    }
}
