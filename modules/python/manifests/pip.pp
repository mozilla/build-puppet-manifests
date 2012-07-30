class python::pip {
    include secrets
    case $operatingsystem {
        Darwin : {
            exec {
                "install-pip":
                    creates => "/usr/local/bin/pip",
                    command => "/usr/bin/easy_install pip";
            }
            python::user_pip_conf {
                # $pip_user gets set in secrets.pp
                "$secrets::pip_user" : ;
            }
        }
    }
}
