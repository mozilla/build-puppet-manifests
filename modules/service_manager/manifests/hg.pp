class service_manager::hg {
    $cmd = "/usr/local/bin/update_hg_wc.sh"
    file {
        $cmd:
            source => "puppet:///modules/service_manager/update_hg_wc.sh",
            owner => 'root',
            group => 'root',
            mode => 0755;
    }
}
