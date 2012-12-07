#
# Cookbook Name:: hadoop
# Recipe:: namenode_ssh
#
# Copyright 2012, Opscode, Inc.
#
# All rights reserved - Do Not Redistribute
#

# Refactor this because it's required for both namenodes and datanodes.
directory "#{node['hadoop']['hadoop_home']}/\.ssh" do
  owner node['hadoop']['uid']
  group node['hadoop']['gid']
  mode '0700'
  action :create
end

%w{id_rsa.pub id_rsa}.each do |f|
  cookbook_file "#{node['hadoop']['hadoop_home']}/\.ssh/#{f}" do
    source f
    owner node['hadoop']['uid']
    group node['hadoop']['gid']
    mode '0600'
    backup false
    action :create
  end
end

# Following should be moved to a new recipe, but works fine for now.
execute "hadoop_format" do
  command './hadoop namenode -format'
  user node['hadoop']['user']
  cwd "#{node['hadoop']['hadoop_home']}/bin"
  action :run
  not_if { Dir.exists?(node['hadoop']['config']['dfs_name_dir']) }
end

# This needs to be included on namenode also.  Confusing, but correct.
include_recipe 'hadoop::datanode_ssh'
