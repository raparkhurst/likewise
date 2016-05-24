default[:likewise][:vault][:name] = "likewise"
default[:likewise][:vault][:item] = "domain"

default[:auth][:domain_join] = true
default[:auth][:packages] = [ "likewise-open" ]
default[:auth][:ad_admins] = [ "unix_admins" ]
default[:auth][:ad_users] = [ "Domain Users" ]
default[:auth][:attributes] = {
  "AssumeDefaultDomain" => true,
  "CreateHomeDir" => true,
  "HomeDirPrefix" => "/home",
  "HomeDirTemplate" => "%H/%D/%U",
  "LoginShellTemplate" => "/bin/bash"
  }
