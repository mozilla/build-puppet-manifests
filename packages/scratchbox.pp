# scratchbox.pp
# installs the scratchbox files

class scratchbox {
    case $hardwaremodel {
        "x86_64": {
        }
        default: {
            $sb_prefix="/builds/scratchbox"
            $sb_version="20100330-0moz1"
            $sb_datestamp="2010-03-30-1129"
            $sb_host_usr_ver="1-0moz1"
            # Our Scratchbox RPM uses %post to unpack its tarball. If that fails
            # there's no way to mark the package as uninstalled or otherwise
            # cleanup. This exec works around that by checking if its *really*
            # installed, and removing it completely if it isn't.
            exec {
                check-scratchbox-install:
                    command => "/bin/rpm -e scratchbox",
                    onlyif  => "/bin/rpm -ql scratchbox && [[ ! -e ${sb_prefix}/deployed-${sb_datestamp} ]]";
            }
            package {
                "scratchbox-mercurial":
                    provider => "rpm",
                    ensure   => "absent";
            }
            install_rpm {
                "scratchbox":
                    creates => "/builds/scratchbox/deployed-${sb_datestamp}",
                    version => "${sb_version}",
                    require => Exec["check-scratchbox-install"];
                "scratchbox-host-usr":
                    creates => "${sb_prefix}/users/cltbld/host_usr/bin/hg",
                    version => "${sb_host_usr_ver}",
                    require => [Package["scratchbox-mercurial"], 
                                Install_rpm["scratchbox"]];
            }

            file {
                "/scratchbox":
                    ensure => "/builds/scratchbox",
                    mode => 755,
                    owner => "root",
                    group => "root";
        
                "/builds/scratchbox/moz_scratchbox":
                    source => "${platform_fileroot}/builds/scratchbox/moz_scratchbox",
                    owner => "root",
                    group => "root",
                    mode => 755,
                    require => Install_rpm["scratchbox"];
        
                "/builds/scratchbox/users/cltbld/home/cltbld/.bashrc":
                    source => "${platform_fileroot}/builds/scratchbox/users/cltbld/home/cltbld/.bashrc",
                    mode => 755,
                    owner => cltbld,
                    group => cltbld,
                    require => Install_rpm["scratchbox"];
        
                "/builds/scratchbox/etc/resolv.conf":
                    source => "${platform_fileroot}/builds/scratchbox/etc/resolv.conf",
                    owner => "root",
                    group => "root",
                    require => Install_rpm["scratchbox"];
        
                ### Some /etc/resolv.conf links
                "/builds/scratchbox/users/cltbld/targets/FREMANTLE_ARMEL/etc/resolv.conf":
                    ensure  => "/etc/resolv.conf",
                    require => Install_rpm["scratchbox"];
                "/builds/scratchbox/users/cltbld/targets/CHINOOK-ARMEL-2007/etc/resolv.conf":
                    ensure  => "/etc/resolv.conf",
                    require => Install_rpm["scratchbox"];
            }
        
            mount {
                "/builds/scratchbox/users/cltbld/builds/slave":
                    device => "/builds/slave",
                    fstype => "auto",
                    options => "bind",
                    ensure => "mounted",
                    require => Install_rpm["scratchbox"];
            }
        }
    }
}
