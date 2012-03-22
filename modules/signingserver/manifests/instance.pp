# Create a signing server instance
#
# title: Base directory of the signing server
# listenaddr: Address the server should listen on. Eg, 127.0.0.1 or 0.0.0.0
# port: Port the server should listen on
# code_tag: The revision (or tag or branch) that the server code should be
#               pulled on
# user: The user the server should be owned by and run as
# token_secret: The shared secret used to sign new tokens with.
# new_token_auth: The username and password required to create new tokens with
#                 the signing server, in the format username:password.
# mar_key_name: The nickname for the key used in mar signing.
define signingserver::instance($listenaddr, $port, $code_tag, $user, $token_secret,
                               $new_token_auth, $mar_key_name, $formats) {
    include secrets::network
    $package_dir_http = "http://${puppetServer}/$level/python-packages"

    # These are specific to a siging server instance, and based off
    # of configuration provided.
    $basedir = $title
    $script_dir = "$basedir/tools/release/signing"
    $signed_dir = "$basedir/signed-files"
    $unsigned_dir = "$basedir/unsigned-files"
    $testfile_dir = "$basedir/test-files"
    $secrets_dir = "$basedir/secrets"
    $signcode_keydir = "$secrets_dir/signcode"
    $gpg_homedir = "$secrets_dir/gpg"
    $mar_keydir = "$secrets_dir/mar"
    $dmg_keydir = "$secrets_dir/dmg"
    $dmg_keychain = "$dmg_keydir/signing.keychain"
    $server_certdir = "$secrets_dir/server"
    $full_private_ssl_cert = "$server_certdir/signing.server.key"
    $full_public_ssl_cert = "$server_certdir/signing.server.cert"

    # These parameters are common between all signing servers, and not
    # overridable. Additionally, some other common-to-all-signing-servers
    # options are hardcoded into the template.
    $allowed_ips = $secrets::network::buildNetworkIPs
    $new_token_allowed_ips = $secrets::network::masterIPs
    $signscript = "$basedir/bin/python2.6 $script_dir/signscript.py -c $basedir/signscript.ini"
    $mar_cmd = "$basedir/bin/signmar -d $basedir/secrets/mar -n $mar_key_name -s"
    $testfile_signcode = "$testfile_dir/test.exe"
    $testfile_mar = "$testfile_dir/test.mar"
    $testfile_gpg = "$testfile_dir/test.mar"
    $testfile_dmg = "$testfile_dir/test.tar"
    $tools_repo = "http://hg.mozilla.org/build/tools"

    File {
        owner => $user
    }
    Exec {
        user => $user
    }
    exec {
        "$basedir-virtualenv":
            creates => "$basedir",
            command => "/usr/bin/virtualenv-2.6 $basedir",
            user => $user;
    }
    case $operatingsystem {
        Darwin: {
            exec {
                "$basedir-pip":
                    creates => "$basedir/bin/pip",
                    command => "$basedir/bin/easy_install pip",
                    user => $user,
                    require => Exec["$basedir-virtualenv"];
            }
            $venv_reqs = [Exec["$basedir-virtualenv"], Exec["$basedir-pip"]]
        }
        default: {
            $venv_reqs = Exec["$basedir-virtualenv"]
        }
    }
    exec {
        "$basedir-clone-tools":
            creates => "$basedir/tools",
            command => "/usr/bin/hg clone -r $code_tag $tools_repo tools",
            cwd => "$basedir",
            require => $venv_reqs;
        "$basedir-gevent":
            command => "$basedir/bin/pip install --no-deps --no-index --find-links=${package_dir_http} gevent==0.13.6",
            require => $venv_reqs,
            onlyif => "/bin/sh -c '! $basedir/bin/python -c \"import gevent\"'";
        "$basedir-webob":
            command => "$basedir/bin/pip install --no-deps --no-index --find-links=${package_dir_http} WebOb==1.0.8",
            require => $venv_reqs,
            onlyif => "/bin/sh -c '! $basedir/bin/python -c \"import webob\"'";
        "$basedir-poster":
            command => "$basedir/bin/pip install --no-deps --no-index --find-links=${package_dir_http} poster==0.8.1",
            require => $venv_reqs,
            onlyif => "/bin/sh -c '! $basedir/bin/python -c \"import poster\"'";
        "$basedir-ipy":
            command => "$basedir/bin/pip install --no-deps --no-index --find-links=${package_dir_http} IPy==0.75",
            require => $venv_reqs,
            onlyif => "/bin/sh -c '! $basedir/bin/python -c \"import IPy\"'";
        "$basedir-greenlet":
            command => "$basedir/bin/pip install --no-deps --no-index --find-links=${package_dir_http} greenlet==0.3.1",
            require => $venv_reqs,
            onlyif => "/bin/sh -c '! $basedir/bin/python -c \"import greenlet\"'";
        "$basedir-redis":
            command => "$basedir/bin/pip install --no-deps --no-index --find-links=${package_dir_http} redis==2.4.5",
            require => $venv_reqs,
            onlyif => "/bin/sh -c '! $basedir/bin/python -c \"import redis\"'";
        "$basedir-flufl.lock":
            command => "$basedir/bin/pip install --no-deps --no-index --find-links=${package_dir_http} flufl.lock==2.2",
            require => $venv_reqs,
            onlyif => "/bin/sh -c '! $basedir/bin/python -c \"import flufl.lock\"'";
        "$basedir-pexpect":
            command => "$basedir/bin/pip install --no-deps --no-index --find-links=${package_dir_http} pexpect==2.4",
            require => $venv_reqs,
            onlyif => "/bin/sh -c '! $basedir/bin/python -c \"import pexpect\"'";
    }
    
    file {
        ["$signed_dir", "$unsigned_dir", "$testfile_dir", "$secrets_dir", "$signcode_keydir", "$gpg_homedir", "$mar_keydir", "$dmg_keydir", "$server_certdir"]:
            ensure => directory,
            require => Exec["$basedir-virtualenv"];
        "$basedir/signing.ini":
            content => template("signingserver/signing.ini.erb"),
            require => Exec["$basedir-virtualenv"];
        "$basedir/signscript.ini":
            content => template("signingserver/signscript.ini.erb"),
            require => Exec["$basedir-virtualenv"];
        # FIXME: this installs a linux signmar binary on Mac
        "$basedir/bin/signmar":
            source => "puppet:///modules/signingserver/signmar",
            mode => 755,
            require => Exec["$basedir-virtualenv"];
        "$testfile_signcode":
            source => "puppet:///modules/signingserver/test.exe";
        "$testfile_mar":
            source => "puppet:///modules/signingserver/test.mar";
        "$testfile_dmg":
            source => "puppet:///modules/signingserver/test.tar";
        # Private certs are explicitly not available through the puppet://
        # fileserver, because they are available to any Puppet client that
        # can authenticate.
        "$full_private_ssl_cert":
            content => file("/etc/puppet/secrets/signing.server.key"),
            mode => 600;
        "$full_public_ssl_cert":
            # XXX: probably should use per-host certs at some point
            source => "puppet:///modules/signingserver/signing.server.cert";
    }
}
