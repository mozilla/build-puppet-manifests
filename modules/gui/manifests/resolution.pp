class gui::resolution {

    case $hardwaremodel {
        "x86_64": { $libdir = "lib64" }
        default: { $libdir = "lib" }
    }

    # This manifest for now is only used by Fedora testing slaves
    file {
        "/etc/X11/xorg.conf":
            content => template("gui/xorg.conf.erb"),
            mode    => 644,
            owner   => "root",
            group   => "root";
    }
}
