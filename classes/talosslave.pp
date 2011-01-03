# talosslave.pp

class talosslave {
## This assumes that other directories (like os/*) have been imported!

    case $operatingsystem {
        Fedora: { include talos_fedora }
        Darwin: { include talos_osx }
    }

    # build slaves get this from the 'devtools' class, but that class does
    # not apply to test slaves; still, we want this link to exist on those
    # systems.  Reducing this duplication will wait on a refactor
    $buildbot_version = "0.8.0"
    file {
        "/tools/buildbot":
            ensure  => "/tools/buildbot-$buildbot_version";
    }
}
