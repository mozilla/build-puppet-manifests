# base.pp

class base {

## This assumes that other directories (like os/*) have been imported!

    case $operatingsystem {
        # add version checking later if necessary
        CentOS: { include centos5 }

        Darwin: { include osx }
        default: { include centos5 }
    }

}
