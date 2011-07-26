class perl::module::settings {
    $module_source = "http://${puppetServer}/$level/perl-modules"
}

define perl::module::install($version) {
    include perl::module::settings

    $workdir = "/tmp/$name"
    $perlName = inline_template("<%= name.sub('-', '::') %>")

    Exec { path => "/bin:/usr/bin" }

    exec {
        "perl-module-remove-$name-start":
            command => "rm -rf $workdir",
            unless => "! perl -M\"$perlName $version\" -e ''",
            notify => Exec["perl-module-mkdir-$name"];
        "perl-module-mkdir-$name":
            command => "mkdir $workdir",
            notify => Exec["perl-module-unpack-$name"],
            refreshonly => true;
        "perl-module-unpack-$name":
            command => "wget -O- ${perl::module::settings::module_source}/$name-$version.tar.gz | tar -xz --strip-components=1",
            cwd => "$workdir",
            notify => Exec["perl-module-makefilepl-$name"],
            refreshonly => true;
        "perl-module-makefilepl-$name":
            command => "perl Makefile.PL",
            cwd => "$workdir",
            notify => Exec["perl-module-install-$name"],
            refreshonly => true;
        "perl-module-install-$name":
            command => "make install",
            cwd => "$workdir",
            notify => Exec["perl-module-remove-$name-end"],
            refreshonly => true;
        "perl-module-remove-$name-end":
            command => "rm -rf $workdir",
            refreshonly => true;
    }
}
