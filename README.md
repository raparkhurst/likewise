likewise Cookbook
======================
This cookbook is designed to work with the newer likewise open as provided by BeyondTrust (http://www.beyondtrust.com/Technical-Support/Downloads/PowerBroker-Identity-Services-Open-Edition/?Pass=True).

This cookbook will join a linux system to an existing Active Directory domain and set any preferences you want such as changing the home directory, or specifying allowed users for sudo access.

Requirements
------------
You will need to download the likewise packages from BeyondTrust and place them in an accessible repository.

Currently I have only tested this on Ubuntu 14.04 but it should also work on Debian based systems.


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
    <td><tt>['auth']['domain']</tt></td>
    <td>string</td>
    <td>name of the domain to join</td>
    <td><tt>example.com</tt></td>
  </tr>
  <tr>
    <td><tt>['auth']['dom_user']</tt></td>
    <td>string</td>
    <td>Domain user allowed to join a system to a domain</td>
    <td><tt>admin</tt></td>
  </tr>
  <tr>
    <td><tt>['auth']['dom_pw']</tt></td>
    <td>string</td>
    <td>Password for dom_user to use for authenticating to the domain</td>
    <td><tt>password</tt></td>
  </tr>
  <tr>
    <td><tt>['auth']['dom_join']</tt></td>
    <td>Boolean</td>
    <td>whether to join the domain</td>
    <td><tt>true</tt></td>
  </tr>
  <tr>
    <td><tt>['auth']['packages']</tt></td>
    <td>Array</td>
    <td>Package list to install</td>
    <td><tt>[ "likewise-open" ]</tt></td>
  </tr>
  <tr>
    <td><tt>['auth']['ad_admins']</tt></td>
    <td>Array</td>
    <td>Users that are allowed to use 'sudo'</td>
    <td><tt>[ "unix_admins" ]</tt></td>
  </tr>
  <tr>
    <td><tt>['auth']['ad_users']</tt></td>
    <td>Array</td>
    <td>Users that are allowed to login to the system</td>
    <td><tt>[ "Domain Users" ]</tt></td>
  </tr>
  <tr>
    <td><tt>['auth']['attributes']</tt></td>
    <td>Hash</td>
    <td>Hash of attributes and values to set</td>
    <td><tt>{
  "AssumeDefaultDomain" => true,
  "CreateHomeDir" => true,
  "HomeDirPrefix" => "/home",
  "HomeDirTemplate" => "%H/%D/%U",
  "LoginShellTemplate" => "/bin/bash"
  }</tt></td>
  </tr>
</table>

Usage
-----
#### likewise::default

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
