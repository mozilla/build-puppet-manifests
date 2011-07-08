# Configuration for mozldap.  Most of these can be overridden at the node level
# if necessary

class mozldap::defaults {
    $ldap_group = 'cn=buildteam,ou=groups,dc=mozilla'
    $ldap_host = 'pm-ns.mozilla.org'
    $ldap_base = 'dc=mozilla'

    # passwords are stored in the top-level secrets.pp
    include secrets
    $ldap_binddn = $secrets::ldap_binddn
    $ldap_bindpw = $secrets::ldap_bindpw
}
