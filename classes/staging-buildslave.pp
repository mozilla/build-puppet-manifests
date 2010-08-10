# staging-buildslave.pp

### These includes all come from files of the same name
### in the /manifests/packages/ tree

class staging-buildslave {
    case $operatingsystem {
        CentOS: {
            include debuginfopackages
            include devtools
            include nagios
            include scratchbox
            include buildbot
            include moz-rpms
        }
        Darwin: {
            include devtools
            include repackaging-tools
        }
    }
}
