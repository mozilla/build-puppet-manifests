# service_manager module
#
# can update code that a service is running with
# and restart it if code has changed
#
# $updatecmd must update the code and return 0 if the service should be
# restarted
# /etc/init.d/$service must exist
#
# Usage:
# service_manager {
#      "buildapi":
#           service => "buildapi",
#           updatecmd => ...
#           minute => # as per cron;
#
define service_manager($service, $updatecmd, $minute, $user) {
    cron {
        "$name-service_manager":
            command => "sudo -u ${user} ${updatecmd} && /etc/init.d/${service} restart",
            environment => ["MAILTO=release@mozilla.com"],
            user => 'root',
            minute => $minute;
    }
}

