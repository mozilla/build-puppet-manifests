# base.pp

# note that this is not a 'base' class in any sense
class base {

## This assumes that other directories (like os/*) have been imported!

    case $operatingsystem {
        # add version checking later if necessary
        CentOS: { include centos5 }

        Darwin: { 
            case $macosx_productversion_major {
                10.7: {
                    include osx_lion
                }
                default: {
                    include osx
                }
            }
        }
        default: { include centos5 }
    }

}
