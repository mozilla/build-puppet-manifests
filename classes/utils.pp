# utils.pp
# various utility classes and functions

### The puppet File type works up to a certain file size, at which it times out when
### downloading the file. This method works around that by using wget instead

define download_file(
        $site="",
        $cwd="",
        $creates="",
        $require="",
        $user="",
        $mode="744") {

    exec { $name:
        command => "/usr/bin/wget ${site}/${name}; /bin/chmod ${mode} ${cwd}/${name}",
        cwd => $cwd,
        creates => "${cwd}/${name}",
        require => $require,
        user => $user,
    }
}

