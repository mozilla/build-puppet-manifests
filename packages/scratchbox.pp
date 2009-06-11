# scratchbox.pp
# installs the scratchbox files
# In this manifest we make use of some .expect scripts to automate
# the steps necessary. Sometimes these need to be done as the cltbld
# user so we do that by calling the .expect via su

class scratchbox {
    
    exec {
        "/bin/tar -xzf /N/dist/scratchbox-toolchain-cs2007q3-glibc2.5-arm6-1.0.7-3-i386.tar.gz":
            creates => "/scratchbox/compilers/cs2007q3-glibc2.5-arm6/share/doc/cs2007q3-glibc2.5-arm-arm-none-linux-gnueabi/html/annotate/Prompting.html",
            cwd => "/",
            alias => "unpack-scratchbox-toolchain";

        "/bin/tar -xvf /N/dist/scratchbox-devkit-cputransp-1.0.7-i386.tar.gz":
            creates => "/scratchbox/devkits/cputransp/deb_list/qemu",
            cwd => "/",
            alias => "unpack-scratchbox-devkit";

        "/N/dist/maemo-scratchbox-install_4.0.1.sh -s /scratchbox":
            creates => "/scratchbox/run_me_first.sh",
            alias => "install-scratchbox",
            timeout => 1800;

        "/scratchbox/sbin/sbox_adduser cltbld yes":
            creates => "/scratchbox/users/cltbld",
            require => Exec["install-scratchbox"],
            alias => "setup-scratchbox-user";

        "/bin/su -c \"/usr/bin/expect /scratchbox/setup.expect\" cltbld":
            creates => "/scratchbox/users/cltbld/targets/CHINOOK-ARMEL-2007.config",
            require => Exec["setup-scratchbox-user"],
            alias => "setup-scratchbox";

        ### This is currently BROKEN. The expect script hangs on the license agreement
        "/bin/su -c \"/usr/bin/expect /scratchbox/maemo-sdk.expect\" cltbld":
            creates => "/scratchbox/users/cltbld/home/cltbld/maemo-sdk-nokia-binaries_4.0.1",
            require => Exec["setup-scratchbox"],
            alias => "setup-maemo-sdk";

        "/bin/chown -R cltbld /scratchbox/devkits/maemo3-tools":
            # we only want this triggered by the parent directory chown (below in file section)
            # so we set this to /bin/true to avoid it triggering on its own
            creates => "/bin/true",
            alias => "chown-maemo3";
    }

    file {
        "/scratchbox":
            ensure => directory,
            mode => 755,
            owner => root,
            group => root;

        "/scratchbox/moz_scratchbox":
            source => "${fileroot}centos5/scratchbox/moz_scratchbox",
            mode => 755;

        "/scratchbox/etc/resolv.conf":
            source => "${fileroot}centos5/scratchbox/etc/resolv.conf",
            require => Exec["install-scratchbox"];

        "/scratchbox/setup.expect":
            source => "${fileroot}centos5/scratchbox/setup.expect",
            mode => 755,
            before => Exec["setup-scratchbox"];

        "/scratchbox/maemo-sdk.expect":
            source => "${fileroot}centos5/scratchbox/maemo-sdk.expect",
            mode => 755,
            before => Exec["setup-maemo-sdk"];

        ### Some /etc/resolv.conf links
        "/scratchbox/users/cltbld/targets/CHINOOK_X86/etc/resolv.conf":
            ensure  => "/etc/resolv.conf";
        "/scratchbox/users/cltbld/targets/CHINOOK_ARMEL/etc/resolv.conf":
            ensure  => "/etc/resolv.conf";
        "/scratchbox/users/cltbld/targets/CHINOOK-ARMEL-2007/etc/resolv.conf":
            ensure  => "/etc/resolv.conf";

        ### If this directory needs chown'ing, then its contents will likely
        ### need it as well.  We trigger an exec command above to do just that
        "/scratchbox/devkits/maemo3-tools":
            ensure => directory,
            owner => cltbld,
            subscribe => Exec["chown-maemo3"];
    }
}
