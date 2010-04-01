# scratchbox.pp
# installs the scratchbox files
# In this manifest we make use of some .expect scripts to automate
# the steps necessary. Sometimes these need to be done as the cltbld
# user so we do that by calling the .expect via su

class scratchbox {
    $sb_version="2010-03-30-1129"
    exec {
        install-scratchbox:
            command => "/N/centos5/scratchbox/deploy-sb.sh $sb_version",
            creates => "/builds/scratchbox/deployed-$sb_version",
            timeout => 10800,
            cwd => "/N/centos5/scratchbox/";
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
