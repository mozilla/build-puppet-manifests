# distribute ~/.purge_builds.cfg

class buildslave::purgebuilds {
    # .purge_builds.cfg is platform independent
    file {
        "${home}/cltbld/.purge_builds.cfg":
            source => "puppet:///buildslave/purge_builds.cfg.${level}",
            owner  => "cltbld",
            owner  => "cltbld",
            mode => 644;
    }
}
