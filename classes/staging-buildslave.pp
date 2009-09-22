# buildslave.pp

### These includes all come from files of the same name
### in the /manifests/packages/ tree

class staging-buildslave {
    case $operatingsystem {
        CentOS: {
            include debuginfopackages
            include devtools
            include nagios
            #include scratchbox
            include mercurial
            include buildbot
        }
        Darwin: {
            include devtools
            file {
                "/Users/cltbld/.ssh":
                    source => "${fileroot}darwin9/.ssh-staging",
                    owner => "cltbld",
                    mode => 600,
                    recurse => true;
            }
        }
    }
}
