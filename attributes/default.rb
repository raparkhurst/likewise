default[:auth][:domain] = 'example.com'
default[:auth][:dom_user] = 'admin'
default[:auth][:dom_pw] = 'password'
default[:auth][:dom_join] = true
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
