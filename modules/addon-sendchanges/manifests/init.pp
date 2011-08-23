class addon-sendchanges {
    $baseDir = "/builds/buildbot/addon-sendchanges"
    $addonsFile = "${baseDir}/addons.txt"
    $sendchangeScript = "${baseDir}/addon-sendchanges.sh"
    file {
        "$baseDir":
            ensure => directory,
            owner => root;
        "$addonsFile":
            source => "puppet:///modules/addon-sendchanges/addons.txt",
            owner => root;
        "$sendchangeScript":
            source => "puppet:///modules/addon-sendchanges/addon-sendchanges.sh",
            owner => root;
        "/etc/cron.d/addon-sendchanges":
            content => template("addon-sendchanges/crontab"),
            owner => root,
            group => root,
            mode => 644;
    }
}
