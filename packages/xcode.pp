# xcode.pp
# installation of xcode on darwin

class xcode {

  case $operatingsystem {
    Darwin: {
      package { "xcode312_2621_developerdvd.dmg":
        provider => pkgdmg,
        source => "/private/nfs/puppet-files/darwin9/dist/$name";
      }
      package { "chud_4.5.0.dmg":
        provider => pkgdmg,
        source => "/private/nfs/puppet-files/darwin9/dist/$name";
      }
      package { "MacPorts-1.6.0-10.5-Leopard.dmg":
        provider => pkgdmg,
        source => "/private/nfs/puppet-files/darwin9/dist/$name";
      }
    }
  }
}
