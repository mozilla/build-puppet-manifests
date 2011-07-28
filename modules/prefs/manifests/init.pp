# prefs class
# manages various preferences files
class prefs {
    file {
        "/root/.vimrc":
            source => "puppet:///prefs/vimrc";
        "/root/.bashrc":
            source => "puppet:///prefs/bashrc";
    }
}
