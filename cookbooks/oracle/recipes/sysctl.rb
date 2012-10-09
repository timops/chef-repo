#
# Cookbook Name:: oracle
# Recipe:: sysctl
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

template '/etc/sysctl.conf' do
  source 'sysctl.conf.erb'
  variables(
    :shmmax => node['oracle']['kernel']['shmall'],
    :shmall => node['oracle']['kernel']['shmmax'],
    :aio_max_nr => node['oracle']['kernel']['aio_max_nr'],
    :file_max => node['oracle']['kernel']['file_max'],
    :shmmni => node['oracle']['kernel']['shmmni'],
    :sem => node['oracle']['kernel']['sem'],
    :port_range => node['oracle']['kernel']['port_range'],
    :rmem_default => node['oracle']['kernel']['rmem_default'],
    :rmem_max => node['oracle']['kernel']['rmem_max'],
    :wmem_default => node['oracle']['kernel']['wmem_default'],
    :wmem_max => node['oracle']['kernel']['wmem_max']
  )
  action :create
  notifies :run, "execute[sysctl]", :immediately
end

execute 'sysctl' do
  command 'sysctl -p'
  action :nothing
end
