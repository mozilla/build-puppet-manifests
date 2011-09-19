# The userids and ssh keys for these users are defined in secrets.pp.
#
# To add or remove people, edit that file.  IT can supply the resources for
# secrets.pp.  To remove users, add them below.

class userlogins {
    # install the required users
    include secrets::users

    # former relengers
    user {
        [
            'dmitchell',
        ]:
            ensure => absent;
    }
}
