#
# Author:: Tim Green (<tgreen@opscode.com>)
# Cookbook Name:: windows
# Recipe:: default
#
# Copyright:: 2012, Opscode, Inc.
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

windows_package '7-Zip 9.20 (x64 edition)' do
  source 'c:/software/7z920-x64.msi'
  action :install
end

windows_registry 'HKLM\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU' do 
  values 'NoAutoUpdate' => 1
  notifies :restart, 'service[Windows Update]', :immediately
end

service 'Windows Update' do
  service_name 'wuauserv'
  action :nothing
end
