# stagelayout.pp

class stagelayout {
    file {
        ["/builds", "/pub"]:
            ensure => directory,
            owner => "cltbld",
            group => "cltbld",
            mode => 755;
        [ "/builds/data", "/builds/data/ftp", "/builds/data/ftp/pub"]:
            ensure => directory,
            owner => "cltbld",
            group => "cltbld",
            mode => 775;
        "/builds/tmp":
            ensure => directory,
            owner => "root",
            group => "root",
            mode => 1777;
        ["/builds/data/symbols_ffx", "/builds/data/symbols_mob"]:
            ensure => directory,
            owner => "ffxbld",
            group => "firefox",
            mode => 755;
        "/builds/data/symbols_xr":
            ensure => directory,
            owner => "xrbld",
            group => "xrbld",
            mode => 775;
        "/builds/data/symbols_tbrd":
            ensure => directory,
            owner => "tbirdbld",
            group => "tbirdbld",
            mode => 775;
        ["/builds/data/ftp/pub/firefox",
        "/builds/data/ftp/pub/firefox/nightly",
        "/builds/data/ftp/pub/firefox/nightly/20xx",
        "/builds/data/ftp/pub/firefox/nightly/latest-mozilla-central",
        "/builds/data/ftp/pub/firefox/candidates",
        "/builds/data/ftp/pub/firefox/releases",
        "/builds/data/ftp/pub/firefox/tinderbox-builds"]:
            ensure => directory,
            owner => "cltbld",
            group => "firefox",
            mode => 775;
        "/builds/data/ftp/pub/firefox/try-builds":
            ensure => directory,
            owner => "trybld",
            group => "trybld",
            mode => 775;
        ["/builds/data/ftp/pub/thunderbird",
         "/builds/data/ftp/pub/thunderbird/nightly",
         "/builds/data/ftp/pub/thunderbird/nightly/20xx",
         "/builds/data/ftp/pub/thunderbird/nightly/latest-comm-central",
         "/builds/data/ftp/pub/thunderbird/candidates",
         "/builds/data/ftp/pub/thunderbird/releases",
         "/builds/data/ftp/pub/thunderbird/tinderbox-builds"]:
            ensure => directory,
            owner => "tbirdbld",
            group => "tbirdbld",
            mode => 775;
        "/builds/data/ftp/pub/thunderbird/try-builds":
            ensure => directory,
            owner => "tbirdtry",
            group => "tbirdtry",
            mode => 775;
        ["/builds/data/ftp/pub/mobile"]:
            ensure => directory,
            owner => "ffxbld",
            group => "ffxbld",
            mode => 775;
        ["/builds/data/ftp/pub/mobile/candidates",
        "/builds/data/ftp/pub/mobile/nightly",
        "/builds/data/ftp/pub/mobile/nightly/20xx",
        "/builds/data/ftp/pub/mobile/nightly/latest-mozilla-central-android",
        "/builds/data/ftp/pub/mobile/tinderbox-builds"]:
            ensure => directory,
            owner => "ffxbld",
            group => "firefox",
            mode => 755;
        "/builds/data/ftp/pub/mobile/try-builds":
            ensure => "../firefox/try-builds",
            force => true;
        ["/builds/data/ftp/pub/b2g",
        "/builds/data/ftp/pub/b2g/nightly",
        "/builds/data/ftp/pub/b2g/tinderbox-builds"]:
            ensure => directory,
            owner => "ffxbld",
            group => "firefox",
            mode => 755;
        "/builds/data/ftp/pub/xulrunner":
            ensure => directory,
            owner => "root",
            group => "xulrunner",
            mode => 775;
        ["/builds/data/ftp/pub/xulrunner/nightly",
        "/builds/data/ftp/pub/xulrunner/candidates",
        "/builds/data/ftp/pub/xulrunner/nightly/20xx",
        "/builds/data/ftp/pub/xulrunner/nightly/latest-mozilla-central",
        "/builds/data/ftp/pub/xulrunner/tinderbox-builds"]:
            ensure => directory,
            owner => "xrbld",
            group => "xulrunner",
            mode => 775;
        "/data":
            ensure => "/builds/data",
            force => true;
        "/tmp":
            ensure => "/builds/tmp",
            force => true;
        "/pub/mozilla.org":
            ensure => "/builds/data/ftp/pub",
            force => true;
        "/home/ftp":
            ensure => "/builds/data/ftp",
            force => true;
        ["/var/www/", "/var/www/html", "/var/www/html/pub",
        "/var/www/html/pub/mozilla.org", "/mnt/netapp",
        "/builds/data/ftp/pub/mozilla.org"]:
            ensure => directory,
            owner => "root",
            group => "root",
            mode => 755;
        "/home/ffxbld/checkouts":
            ensure => directory,
            owner => "ffxbld",
            group => "firefox",
            mode => 755;
        "/var/www/html/pub/mozilla.org/firefox":
            ensure => "/home/ftp/pub/firefox",
            force => true;
        "/var/www/html/pub/mozilla.org/mobile":
            ensure => "/home/ftp/pub/mobile",
            force => true;
        "/var/www/html/pub/mozilla.org/b2g":
            ensure => "/home/ftp/pub/b2g",
            force => true;
        "/var/www/html/pub/mozilla.org/thunderbird":
            ensure => "/home/ftp/pub/thunderbird",
            force => true;
        "/var/www/html/pub/mozilla.org/mozilla":
            ensure => "/home/ftp/pub/mozilla",
            force => true;
        "/builds/data/ftp/pub/mozilla.org/firefox":
            ensure => "../firefox",
            force => true;
        "/builds/data/ftp/pub/mozilla.org/mobile":
            ensure => "../mobile",
            force => true;
        "/builds/data/ftp/pub/mozilla.org/thunderbird":
            ensure => "../thunderbird",
            force => true;
        "/builds/data/ftp/pub/mozilla.org/xulrunner":
            ensure => "../xulrunner",
            force => true;
        "/var/www/html/pub/mozilla.org/xulrunner":
            ensure => "/home/ftp/pub/xulrunner",
            force => true;
        "/mnt/netapp/breakpad":
            ensure => "/builds/data",
            force => true;
        "/usr/local/bin/cltbld-bin.sh":
            source => "${platform_fileroot}/usr/local/bin/cltbld-bin.sh",
            mode => 755;
        "/usr/local/bin/tools.sh":
            source => "${platform_fileroot}/usr/local/bin/tools.sh",
            mode => 755;
    }
    exec {
        "cltbld-bin":
            command => "/usr/local/bin/cltbld-bin.sh",
            logoutput => true,
            subscribe => File["/usr/local/bin/cltbld-bin.sh"],
            require => [Package["cvs"], File["/usr/local/bin/cltbld-bin.sh"],
                        File["/root/.ssh/config"], File["/root/.ssh/known_hosts"],
                        File["/root/.ssh/cvs"], File["/root/.ssh/cvs"]];
        "tools":
            command => "/usr/local/bin/tools.sh",
            logoutput => true,
            subscribe => File["/usr/local/bin/tools.sh"],
            require => [Package["mercurial"], File["/usr/local/bin/tools.sh"],
                        File["/home/ffxbld/checkouts"]];
    }
    file {
        "/usr/local/bin/post_upload.py":
            ensure => "/home/ffxbld/checkouts/tools/stage/post_upload.py",
            require => Exec["tools"],
            force => true;
        "/usr/local/bin/extract_and_run_command.py":
            ensure => "/home/ffxbld/checkouts/tools/stage/extract_and_run_command.py",
            require => Exec["tools"],
            force => true;
        "/usr/local/bin/clamdscan":
            content => "#!/bin/bash\necho $@",
            mode => 755;
    }
}
