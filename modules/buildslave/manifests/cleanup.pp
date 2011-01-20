class buildslave::cleanup {
 
    exec { "rm -rf /tmp/*":
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

