#
# Cookbook Name:: hadoop
# Recipe:: datanode_ssh
#
# Copyright 2012, Opscode, Inc.
#
# All rights reserved - Do Not Redistribute
#


begin
  key_data = data_bag('ssh_known_hosts')
rescue
  Chef::Log.info("Could not load data bag 'ssh_known_hosts' which is required to perform remote administration of datanodes.")
end

# Refactor this because it's required for both namenodes and datanodes.
directory "#{node['hadoop']['hadoop_home']}/\.ssh" do
  owner node['hadoop']['uid']
  group node['hadoop']['gid']
  mode '0700'
  action :create
end

hadoop_namenode = data_bag_item('ssh_known_hosts', 'namenode').to_hash

template "#{node['hadoop']['hadoop_home']}/\.ssh/authorized_keys" do
  source 'authorized_keys.erb'
  owner node['hadoop']['user']
  group node['hadoop']['user']
  mode '0640'
  variables(
    :namenode => hadoop_namenode
  )
  action :create
end
