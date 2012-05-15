# buildslave.pp

### These includes all come from files of the same name
### in the /manifests/packages/ tree

class buildslave {
    include nagios
    case $operatingsystem {
        CentOS: {
            include packages::debuginfopackages
            include packages::devtools
            include packages::scratchbox
            include packages::moz-rpms
            include packages::systemtap
            include packages::alsa
        }
        Darwin: {
            include packages::devtools
            include packages::repackaging-tools
            include packages::cacert
        }
    }
}
