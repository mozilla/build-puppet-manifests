# prefs class
# manages various preferences files
class prefs {
    file {
        "/root/.vimrc":
            source => "puppet:///modules/prefs/vimrc";
        "/root/.bashrc":
            source => "puppet:///modules/prefs/bashrc";
    }
}
