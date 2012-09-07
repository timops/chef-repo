#
# Author:: Tim Green (<tgreen@opscode.com>)
# Cookbook Name:: windows
# Recipe:: default
#
# Copyright:: 2011, Opscode, Inc.
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
#

users_databag = data_bag('users')
membership ||= Hash.new

# Create all of the users!
users_databag.each do |user|
  new_user = data_bag_item('users', user)
  # Array of hashes = members of each group.
  new_user['groups'].each do |grp|
    membership[grp] ||= Array.new
    membership[grp] << new_user['id']
  end
  # Chef resource to create a new user.
  user new_user['id'] do
    password new_user['password']
    action :create
  end
end

dev_groups = data_bag_item('groups', 'devgroups')

dev_groups['groups'].each do |new_grp|
  group new_grp do
    members membership[new_grp]
    action :create
  end
end
