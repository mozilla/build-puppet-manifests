define nginx::site($source='', $content='') {
    if ($source == '' and $content == '') {
        fail('Need to specify either source or content')
    }

    if ($source != '') {
        file {
            "/etc/nginx/conf.d/${title}.conf":
                source => $source,
                owner => 'root',
                group => 'root',
                mode => 644,
                notify => Service['nginx'];
        }
    }
    if ($content != '') {
        file {
            "/etc/nginx/conf.d/${title}.conf":
                content => $content,
                owner => 'root',
                group => 'root',
                mode => 644,
                notify => Service['nginx'];
        }
    }
}
