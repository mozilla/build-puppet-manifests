# This barebones class provides a working Apache installation with no
# site-specific configuration. When including this you will have any necessary
# packages installed, a basic configuration file created, and Apache started,
# and configuration to start on boot.
class apache {
    include apache::install
    include apache::service
}
