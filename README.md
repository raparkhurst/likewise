likewise Cookbook
======================
This cookbook is designed to work with the newer likewise open as provided by BeyondTrust (http://www.beyondtrust.com/Technical-Support/Downloads/PowerBroker-Identity-Services-Open-Edition/?Pass=True).

This cookbook will join a linux system to an existing Active Directory domain and set any preferences you want such as changing the home directory, or specifying allowed users for sudo access.

Requirements
------------
Right now this has only been tested on Ubuntu so only Ubuntu or Debian systems.  In addition you will need to download the packages for likewise and put them into a local repository that each node will have access to.

Attributes
----------
#### likewise::default
<table>
  <tr>
    <th>Key</th>
    <th>Type</th>
    <th>Description</th>
    <th>Default</th>
  </tr>
  <tr>
    <td><tt>['likewise']['bacon']</tt></td>
    <td>Boolean</td>
    <td>whether to include bacon</td>
    <td><tt>true</tt></td>
  </tr>
</table>

Usage
-----
#### likewise::default

The default attributes for likewise are as follows:

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


For the domain user ('dom_user') and domain password ('dom_pw') you will need to supply a valid user and password that have the authority to join a system to a domain.  I don't have support for data bags, or encrypted data bags yet, but you can put these in either your node definition or enviornment (or encapsulate it in another cookbook that then calls this).

For likewise attributes, you can set those to include any attributes you want to set.  On each run the cookbook will set those attributes.  The above defaults are the ones I've set for my use.


An example of setting the variables in json format (in a run_list or in the default_attributes section):

  "likewise": {
    "domain": "acme.domain",
    "dom_user": "acme_admin",
    "dom_pw": "SecurePassword",
    "dom_join": true
  }



Contributing
------------
I'm sure I've left stuff out and I know I'm not doing any testing (just re-running everyhing on each run).  I'll work on fixing this.  If you find anything wrong or want to contribute in any way please feel free to do so!



License and Authors
-------------------
Distributed under the Apache 2 license


Robert Parkhurst <robert.parkhurst@gmail.com>
