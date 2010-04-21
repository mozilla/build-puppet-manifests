# scratchbox.pp
# installs the scratchbox files
# In this manifest we make use of some .expect scripts to automate
# the steps necessary. Sometimes these need to be done as the cltbld
# user so we do that by calling the .expect via su

class scratchbox {
    case $hardwaremodel {
        "x86_64": {
        }
        default: {
            $sb_version="2010-03-30-1129"
            $sb_prefix="/builds/scratchbox"
            $sb_hg_version="1.5.1"
            exec {
                install-scratchbox:
                    command => "/N/centos5/scratchbox/deploy-sb.sh $sb_version",
                    creates => "/builds/scratchbox/deployed-$sb_version",
                    timeout => 10800,
                    cwd => "/N/centos5/scratchbox/";
                install-sb-mercurial:
                    command => "/bin/tar zxf /N/centos5/scratchbox/mercurial-${sb_hg_version}.linux-arm.tar.gz",
                    creates => "${sb_prefix}/users/cltbld/targets/FREMANTLE_ARMEL/usr/local/bin/hg",
                    cwd => "${sb_prefix}/users/cltbld/targets/FREMANTLE_ARMEL/";
            }
                    
            file {
                "/scratchbox":
                    ensure => '/builds/scratchbox',
                    mode => 755,
                    owner => root,
                    group => root;
        
                "/builds/scratchbox/moz_scratchbox":
                    source => "/N/centos5/scratchbox/moz_scratchbox",
                    mode => 755,
                    require => Exec['install-scratchbox'];
        
                "/builds/scratchbox/etc/resolv.conf":
                    source => "/N/centos5/scratchbox/etc/resolv.conf",
                    require => Exec["install-scratchbox"];
        
                ### Some /etc/resolv.conf links
                "/builds/scratchbox/users/cltbld/targets/FREMANTLE_ARMEL/etc/resolv.conf":
                    ensure  => "/etc/resolv.conf",
                    require => Exec["install-scratchbox"];
                "/builds/scratchbox/users/cltbld/targets/CHINOOK-ARMEL-2007/etc/resolv.conf":
                    ensure  => "/etc/resolv.conf",
                    require => Exec["install-scratchbox"];
            }
        
            mount {
                "/builds/scratchbox/users/cltbld/builds/slave":
                    device => "/builds/slave",
                    fstype => "auto",
                    options => "bind",
                    ensure => "mounted",
                    require => Exec['install-scratchbox'];
            }
        }
    }
}
