default[:likewise][:domain] = 'example.com'
default[:likewise][:dom_user] = 'admin'
default[:likewise][:dom_pw] = 'password'
default[:likewise][:dom_join] = true
default[:likewise][:packages] = [ "likewise-open" ]
default[:likewise][:ad_admins] = [ "unix_admins" ]
default[:likewise][:ad_users] = [ "Domain Users" ]
default[:likewise][:attributes] = {
  "AssumeDefaultDomain" => true,
  "CreateHomeDir" => true,
  "HomeDirPrefix" => "/home",
  "HomeDirTemplate" => "%H/%D/%U",
  "LoginShellTemplate" => "/bin/bash"
  }
