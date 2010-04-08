# talosslave.pp

class talosslave {
## This assumes that other directories (like os/*) have been imported!

    case $operatingsystem {
        Fedora: { include talos_fedora }
        Darwin: { include talos_osx }
    }
}
