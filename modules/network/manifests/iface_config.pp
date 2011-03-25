# Make sure the system's interfaces are configured correctly.  This
# usually amounts to making sure they talk to DHCP.
class network::iface_config {
    case $operatingsystem {
        Fedora: {

            # on Fedora systems (regardless of bitlength), we need to inject
            # the PERSISTENT_DHCLIENT=yes argument into the interface
            # configuration script, or the slaves will give up on DHCP too
            # quickly - see bug 636051 and bug 636069.  Since fedora invents a
            # new ethN interface for every hardware address it sees, we
            # configure this for both eth0, and blow away the file where Fedora
            # "remembers" MAC addresses.  The net effect is that most of the
            # time, the machine will come up with eth0 as the active interface.
            # In cases where eth1 is the active interface, the default behavior
            # is to use DHCP anyway, although without PERSISTENT_DHCLIENT, but
            # this is good enough.

            file {
                "/etc/sysconfig/network-scripts/ifcfg-eth0":
                    source => "puppet:///network/fedora-ifcfg-eth0";

                "/etc/udev/rules.d/70-persistent-net.rules":
                    content => "# clobbered on startup by puppet";

                    # (note that fedora will append to this file on every boot,
                    # so this resource will actuate on every puppet run)
            }
        }

        CentOS: {

            # CentOS systems aren't quite so energetic about their network configuration,
            # so all we have to do is set the eth0 configuration script.

            file {
                "/etc/sysconfig/network-scripts/ifcfg-eth0":
                    source => "puppet:///network/centos-ifcfg-eth0";
            }
        }

        # other operating systems seem to work OK based on the refimage; add
        # more here when that proves untrue

    }
}
