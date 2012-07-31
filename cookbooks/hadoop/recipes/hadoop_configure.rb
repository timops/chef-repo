#
# Cookbook Name:: hadoop
# Recipe:: hadoop_configure
#
# Copyright 2012, Opscode, Inc.
#
# All rights reserved - Do Not Redistribute
#


template "#{node['hadoop']['hadoop_home']}/conf/core-site.xml" do
  action :create
  source 'core-site.xml.erb'
  owner node['hadoop']['user']
  group node['hadoop']['user']
  mode '0664'
  variables(
    :namenode => node['hadoop']['config']['namenode']
  )
end

template "#{node['hadoop']['hadoop_home']}/conf/hdfs-site.xml" do
  action :create
  source 'hdfs-site.xml.erb'
  owner node['hadoop']['user']
  group node['hadoop']['user']
  mode '0664'
  variables(
    :dfs_name_dir => node['hadoop']['config']['dfs_name_dir'],
    :dfs_data_dir => node['hadoop']['config']['dfs_data_dir']
  )
end

template "#{node['hadoop']['hadoop_home']}/conf/mapred-site.xml" do
  action :create
  source 'mapred-site.xml.erb'
  owner node['hadoop']['user']
  group node['hadoop']['user']
  mode '0664'
  variables(
    :tasktracker => node['hadoop']['config']['namenode'],
    :mapred_local_dir => node['hadoop']['config']['mapred_local_dir'],
    :system_dir => node['hadoop']['config']['mapred_system']
  )
end

begin
  hadoop_data = data_bag('hadoop')
rescue
  Chef::Log.error("Could not load data bag 'hadoop' which is required to configure Hadoop slaves, quitting.")
end

hadoop_slaves = data_bag_item('hadoop', 'slaves').to_hash

template "#{node['hadoop']['hadoop_home']}/conf/slaves" do
  action :create
  source 'slaves.erb'
  owner node['hadoop']['user']
  group node['hadoop']['user']
  mode '0664'
  variables(
    :slaves => hadoop_slaves
  )
end
