#
# Cookbook Name:: oracle
# Recipe:: accounts
#
# Copyright 2008-2012, Opscode, Inc.
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


oracle_users = data_bag('oracle_users')
oracle_groups = data_bag('oracle_groups')

oracle_groups.each do |groupname|
  curr_grp = data_bag_item('oracle_groups', groupname)
  group curr_grp['id'] do
    gid curr_grp['gid']
    action :create
  end
end

oracle_users.each do |username|
  curr_usr = data_bag_item('oracle_users', username)
  user curr_usr['id'] do
    uid curr_usr['uid']
    gid curr_usr['gid']
    home curr_usr['home']
    shell curr_usr['shell']
    action :create
  end
end

# If the user resource could manage secondary groups, we could refactor this nicely.
oracle_groups.each do |groupname|
  curr_grp = data_bag_item('oracle_groups', groupname)
  group curr_grp['id'] do
    members curr_grp['members']
    action :modify
  end
end
