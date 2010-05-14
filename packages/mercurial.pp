# mercurial.pp
# installs mercurial

### Download mercurial, unpack the tarball, run python setup.py install,
### then cleanup

class mercurial {
    
    exec {
        "python setup.py install; rm -rf /tools/mercurial-1.1.2":
            creates => "/tools/python/lib/python2.5/site-packages/mercurial",
            cwd => "/tools/mercurial-1.1.2",
            environment => ["PYTHONHOME=/tools/python"],
            path => "/tools/python/bin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/root/bin",
            alias => "install-mercurial";
        "/bin/tar -xzf $devtools_home/mercurial-1.1.2.tar.gz":
            creates => "/tools/mercurial-1.1.2/",
            cwd => "/tools",
            alias => "unpack-mercurial",
            before => Exec["install-mercurial"];
    }
}
