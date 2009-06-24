# buildslave.pp

### These includes all come from files of the same name
### in the /manifests/packages/ tree

class buildslave {
    include debuginfopackages
    include devtools
    include nagios
    include scratchbox
    include mercurial
    include virtualenv
    include buildbot
}
