class buildslave::cleanup {
 
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

