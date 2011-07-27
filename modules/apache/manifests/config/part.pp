# Creates a partial config from either a plain source or a template.
define apache::config::part($source="", $template="") {
    include apache::install
    include apache::settings
    if (($source == "" and $template == "") or ($source != "" and $template != "")) {
        fail("apache::config::part: One of \$source or \$template must be set (but not both)")
    }
    if ($source != "") {
        file {
            "${apache::settings::configDir}/${name}":
                source => $source,
                owner => root,
                group => root,
                mode => 644,
                require => Class["apache::install"];
        }
    }
    else {
        file {
            "${apache::settings::configDir}/${name}":
                content => template($template),
                owner => root,
                group => root,
                mode => 644,
                require => Class["apache::install"];
        }
    }
}
