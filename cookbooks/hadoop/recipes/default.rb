#
# Cookbook Name:: hadoop
# Attributes:: default
#
# Copyright 2012, Opscode, Inc.
#
# All rights reserved - Do Not Redistribute
#


include_recipe 'java'


execute 'install_hadoop' do
  action :run
  command "#{node['hadoop']['tar']} -xvzf #{node['hadoop']['tarball']} -C #{node['hadoop']['install_dir']}"
  not_if { Dir.exists?(node['hadoop']['hadoop_home']) }
end

link "#{node['hadoop']['install_dir']}/hadoop" do
  action :create
  to node['hadoop']['hadoop_home']
end

user node['hadoop']['user'] do 
  action :create
  uid node['hadoop']['uid']
  home node['hadoop']['hadoop_home']
  shell '/bin/bash'
end

execute 'chown' do
  action :run
  command "chown -R #{node['hadoop']['user']}:#{node['hadoop']['user']} #{node['hadoop']['hadoop_home']}"
end
