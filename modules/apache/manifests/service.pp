class apache::service {
    include apache::settings
    service {
        httpd:
            require => Class["apache::install"],
            enable => true,
            ensure => running;
    }
}
