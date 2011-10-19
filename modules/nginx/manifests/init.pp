# This class gets a basic nginx installation up and running
class nginx {
    package {
        "nginx":
            ensure => latest;
    }
    service {
        "nginx":
            ensure => running,
            enable => true;
    }
}
