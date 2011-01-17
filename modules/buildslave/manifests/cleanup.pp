class buildslave::cleanup {
 
    tidy { "/tmp/":
        age => "1d",
        recurse => true
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

