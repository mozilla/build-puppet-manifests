class buildmaster::settings {
    $master_user = "cltbld"
    $master_group = "cltbld"
    $master_user_uid = 500
    $master_group_gid = 500
    $master_basedir = "/builds/buildbot"
    $master_queue_venv = "${master_basedir}/queue"
}
