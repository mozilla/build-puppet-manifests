# extras.pp
# installs extra packages or libraries that we may need for our build system

class extras {
   exec {
        ### This installs libhildonfm2-dev for Fennec on Maemo - bug 511290
        "su - cltbld -c '/scratchbox/moz_scratchbox -p apt-get --yes --force-yes install libhildonfm2-dev'":
            # As long as CHINOOK-ARMEL-2007 is _the_ target used by scratchbox
            creates => "/scratchbox/users/cltbld/targets/CHINOOK-ARMEL-2007/var/lib/dpkg/info/libhildonfm2-dev.list",
            alias => "install-libhildonfm2-dev",
            # I had to declare this since we are running the command as "su - cltbld -c" 
            # This was the minimum path that I needed to declare to make it work
            path => "/bin";
   }
}
