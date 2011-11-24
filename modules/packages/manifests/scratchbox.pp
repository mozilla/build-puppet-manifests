# scratchbox.pp
# removes the scratchbox files

class packages::scratchbox {
    case $hardwaremodel {
        "x86_64": {
        }
        default: {
            file {
                "/usr/local/bin/scratchbox-preun.sh":
                    mode => 0755,
                    owner => "root",
                    group => "root",
                    source => "puppet:///packages/scratchbox-preun.sh";
            }
            package {
                "scratchbox-mercurial":
                    provider => "rpm",
                    ensure   => "absent";
                "scratchbox-host-usr":
                    provider => "rpm",
                    require => [Package["scratchbox-mercurial"]],
                    ensure => "absent";
            }
            mount {
                "/scratchbox/users/cltbld/home/cltbld/.ssh":
                    device  => '/home/cltbld/.ssh',
                    ensure  => "absent";
                "/builds/scratchbox/users/cltbld/builds/slave":
                    device => "/builds/slave",
                    ensure => "absent";
            }
            exec {
                "run-scratchbox-preun":
                    command => "/usr/local/bin/scratchbox-preun.sh",
                    require => [File["/usr/local/bin/scratchbox-preun.sh"],
                                Package["scratchbox-host-usr"]],
                    notify => [Exec["remove-scratchbox"]],
                    onlyif => "/bin/rpm -q scratchbox";
                "remove-scratchbox":
                    command => "/bin/rpm -e --noscripts scratchbox",
                    refreshonly => true;
            }
        }
    }
}
