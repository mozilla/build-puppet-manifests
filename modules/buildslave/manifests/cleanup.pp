# Clean up various messes typically found on a buildslave.
#
# USAGE:
#
#  include buildslave::cleanup

class buildslave::cleanup {
 
    # Note that this command will likely fail for runs done when DMGs are
    # mounted from pkgdmg since they mount under /tmp and have really old files
    exec { "find /tmp/* -mmin +15 -print | xargs -n1 rm -rf":
        path => "/usr/bin:/usr/sbin:/bin"
    }

    case $operatingsystem {
        CentOS,Fedora: {
            tidy { "/home/cltbld/.mozilla/firefox/console.log":
                age => 0
            }
        }
        Darwin: {
            tidy { "/Users/cltbld/Library/Application Support/Firefox/console.log":
                age => 0
            }
        }
    }
}

