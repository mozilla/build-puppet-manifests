# top level manifest for buildbot master puppet master
# symlink as site.pp, or set manifests = buildmaster-production.pp in
# puppet.conf

# For passwords, etc.
import "secrets.pp"

$puppetServer = "master-puppet1.build.mozilla.org"
$level = "production"
$httproot = "http://${puppetServer}/${level}"

# disable filebuckets - we do not want to keep copies of files that
# puppet overwrites
File { backup => false }

node "buildbot-master04.build.scl1.mozilla.com" {
    $num_masters = 3
    buildmaster::buildbot_master {
        "bm04-build1":
            http_port => 8001,
            master_type => "build",
            basedir => "build1";
        "bm04-try1":
            http_port => 8101,
            master_type => "try",
            basedir => "try1";
        "bm04-tests1":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1";
    }
}

node "buildbot-master06.build.scl1.mozilla.com" {
    $num_masters = 3
    buildmaster::buildbot_master {
        "bm06-build1":
            http_port => 8001,
            master_type => "build",
            basedir => "build1";
        "bm06-try1":
            http_port => 8101,
            master_type => "try",
            basedir => "try1";
        "bm06-tests1":
            http_port => 8201,
            master_type => "tests",
            basedir => "tests1";
    }
}
