# byob-repackslave.pp

### These includes all come from files of the same name
### in the /manifests/packages/ tree

class byob-repackslave {
    case $operatingsystem {
        Darwin: {
            include devtools
            include repackaging-tools
        }
    }
}
