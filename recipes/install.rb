#
# Cookbook Name:: likewise
# Recipe:: install
#
# Distributed under the terms of the Apache 2 license
#
# Copyright 2016 Robert Parkhurst <raparkhurst@digitalsynapse.io>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

chef_gem "chef-vault"
require 'chef-vault'


domain_information = ChefVault::Item.load("#{node[:likewise][:vault][:name]}", "#{node[:likewise][:vault][:item]}")

domain_name = domain_information['domain']
domain_user = domain_information['domain_user']
domain_pass = domain_information['domain_passwd']


# remove existing authentication plugins
[
  "nscd",
  "winbind"
].each do |pkg|
  package pkg do
    action :purge
  end
end

# install likewise packages
node[:auth][:packages].each do |pkg|
  package pkg do
    action :upgrade
  end
end

# manage templates -- nsswitch.conf
template "/etc/nsswitch.conf" do
  source "nsswitch.conf.erb"
  mode "0644"
end

# manage template -- likewise.sh profile variables
template "/etc/profile.d/likewise.sh" do
  source "likewise.sh.erb"
  mode "0755"
end


execute "join-domain" do
  command "domainjoin-cli join #{domain_name} #{domain_user} \"#{domain_pass}\""
end

# Set specific policies
node[:auth][:attributes].each do |attr,val|
  execute "/opt/pbis/bin/config #{attr} #{val}"
end

# Set Sudoers
node[:auth][:ad_admins].each do |grp|
  sudo "#{grp}" do
    group "#{grp}"
  end
end
