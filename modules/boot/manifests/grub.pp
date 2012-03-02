# Add options to manage grub.

class boot::grub {
    if $operatingsystem == "Fedora" {
        file {
            "/boot/grub/grub.conf":
	        content => template("boot/grub.conf.erb"),
		mode => 600,
		owner => root,
		group => root;
        }
    }
}
