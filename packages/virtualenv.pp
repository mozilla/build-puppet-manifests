# virtualenv.pp
# installs virtualenv

### Download virtualenv, unpack the tarball, run python setup.py install,
### then cleanup

class virtualenv {
    
    exec {
        "python setup.py install && rm -rf virtualenv-1.3.3":
            creates => "/tools/python/lib/python2.5/site-packages/virtualenv",
            cwd => "/tmp/virtualenv-1.3.3",
            environment => ["PYTHONHOME=/tools/python"],
            path => "/tools/python/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
            alias => "install-virtualenv";
        "/bin/tar -xzf /N/dist/virtualenv-1.3.3.tar.gz":
            creates => "/tmp/virtualenv-1.3.3",
            cwd => "/tmp",
            alias => "unpack-virtualenv",
            before => Exec["install-virtualenv"];
    }
}
