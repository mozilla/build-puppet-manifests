# Allow logins using private SSH keys stored in LDAP.
#
# USAGE
#
#     $mozldap_logins_ldap_group = 'cn=partypeople,ou=groups,dc=mozilla'
#     $mozldap_logins_ldap_host = 'someserver.mozilla.com'
#     $mozldap_logins_ldap_base = 'ou=kids,dc=mozilla'
#     $mozldap_logins_ldap_binddn = 'cn=jimmy,ou=kids,dc=mozilla'
#     $mozldap_logins_ldap_bindpw = 'pass'
#     include mozldap::logins
#
# All of the node-level variables are optional, and default to the values
# in mozldap::defaults.
#
# REQUIREMENTS
#
# * This only works on CentOS-5.5, as it uses custom-built openssh packages
# * The LDAP server itself limits which hosts can connect using the default
#   binddn; see bug 660020.

class mozldap::logins {
    include mozldap::install
    include mozldap::defaults

    # check compatibility
    if ($lsbdistid != 'CentOS' or $lsbdistrelease != '5.5') {
        fail("mozldap::logins only works on CentOS 5.5 (this is $lsbdistid $lsbdistrelease)")
    }

    # set up defaults
    $ldap_group = $mozldap_logins_ldap_group ? {
        '' => $mozldap::defaults::ldap_group,
        default => $mozldap_logins_ldap_group,
    }

    $ldap_host = $mozldap_logins_ldap_host ? {
        '' => $mozldap::defaults::ldap_host,
        default => $mozldap_logins_ldap_host,
    }

    $ldap_base = $mozldap_logins_ldap_base ? {
        '' => $mozldap::defaults::ldap_base,
        default => $mozldap_logins_ldap_base,
    }

    $ldap_binddn = $mozldap_logins_ldap_binddn ? {
        '' => $mozldap::defaults::ldap_binddn,
        default => $mozldap_logins_ldap_binddn,
    }

    $ldap_bindpw = $mozldap_logins_ldap_bindpw ? {
        '' => $mozldap::defaults::ldap_bindpw,
        default => $mozldap_logins_ldap_bindpw,
    }

    file {
        "/etc/ldap.conf":
            content => template("mozldap/ldap.conf.erb");
        "/etc/ssh/sshd_config":
            content => template("mozldap/sshd_config.erb");
        "/etc/nsswitch.conf":
            source => "puppet:///mozldap/nsswitch.conf";
        "/etc/pam.d/system-auth-ac":
            source => "puppet:///mozldap/system-auth-ac";
    }

    service {
        "sshd":
            ensure => "running",
            enable => true,
            require => Class['mozldap::install'];
    }
}

