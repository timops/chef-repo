#
# Cookbook Name:: hadoop
# Attributes:: default
#
# Copyright 2012, Opscode, Inc.
#
# All rights reserved - Do Not Redistribute
#


include_recipe 'java'

remote_file "#{node['hadoop']['target']}" do
  source "#{node['hadoop']['remote']}"
  owner 'root'
  group 'root'
  action :create_if_missing
end

execute 'install_hadoop' do
  command "#{node['hadoop']['tar']} -xvzf #{node['hadoop']['target']} -C #{node['hadoop']['install_dir']}"
  not_if { Dir.exists?(node['hadoop']['hadoop_home']) }
  action :run
end

link "#{node['hadoop']['install_dir']}/hadoop" do
  to node['hadoop']['hadoop_home']
  action :create
end

user node['hadoop']['user'] do 
  uid node['hadoop']['uid']
  home node['hadoop']['hadoop_home']
  shell '/bin/bash'
  action :create
end

execute 'chown' do
  command "chown -R #{node['hadoop']['user']}:#{node['hadoop']['user']} #{node['hadoop']['hadoop_home']}"
  action :run
end
