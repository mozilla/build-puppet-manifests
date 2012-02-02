###
# sendmail module
# usage:
#   include sendmail
#
# to customize, include sendmail::settings and override values there
###

class sendmail::settings {
    $smarthost = 'mail.build.mozilla.org'
    $masquerade = 'mail.build.mozilla.org'
}

class sendmail {
    include sendmail::settings

    case $operatingsystem {
        CentOS: {
            # We know how to handle this
            package {
                "sendmail":
                    ensure => latest;
                "sendmail-cf":
                    require => Package["sendmail"],
                    ensure => latest;
            }

            file {
                "/etc/mail/sendmail.mc":
                    require => Package["sendmail-cf"],
                    content => template("sendmail/sendmail.mc.erb"),
                    mode => 644,
                    owner => "root",
                    group => "root",
            }

            exec {
                newaliases:
                    command => "/usr/bin/newaliases",
                    refreshonly => true;
            }

            service {
                "sendmail":
                    require => File["/etc/mail/sendmail.mc"],
                    subscribe => File["/etc/mail/sendmail.mc"],
                    ensure => running,
                    enable => true;
            }
        }
        default: {
            fail("Unsupported OS: $operatingsystem")
        }
    }
}
