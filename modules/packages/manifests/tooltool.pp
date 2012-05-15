class packages::tooltool {
    # this package is simple enough that its source code is embedded in the
    # puppet repo.  It gets the Python intepreter added to its shebang line
    case $operatingsystem {
        CentOS: {
            $python = '/tools/python-2.6.5/bin/python'
        }
        default: {
            $python = '/tools/python/bin/python'
        }
    }
    file {
        "/tools/tooltool.py":
            owner => root,
            group => root,
            mode => 0755,
            content => template("packages/tooltool.py");
    }
}
