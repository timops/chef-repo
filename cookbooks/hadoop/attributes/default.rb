#
# Cookbook Name:: hadoop
# Recipe:: default
#
# Copyright 2012, Opscode, Inc.
#
# All rights reserved - Do Not Redistribute
#


# Global attributes (applicable to all nodes in Hadoop cluster, irrespective of role).
default['hadoop']['user'] = 'hadoop'
default['hadoop']['uid'] = 2001
default['hadoop']['gid'] = 2001
default['hadoop']['remote'] = 'http://apache.spinellicreations.com/hadoop/common/hadoop-1.0.4/hadoop-1.0.4-bin.tar.gz'
default['hadoop']['target'] = '/tmp/hadoop-1.0.4-bin.tar.gz'
default['hadoop']['install_dir'] = '/opt'
default['hadoop']['base_name'] = 'hadoop-1.0.4'
default['hadoop']['hadoop_home'] = "#{default['hadoop']['install_dir']}/#{default['hadoop']['base_name']}"

default['hadoop']['tar'] = '/bin/tar'

# Used in core-site.xml template.
default['hadoop']['config']['namenode'] = 'namenode.local'

# Used in hfds-site.xml template.
# These should be changed to an array and populated into the template in comma-delimited format.
default['hadoop']['config']['dfs_name_dir'] = '/tmp/namedir'
default['hadoop']['config']['dfs_data_dir'] = '/tmp/dfsdir'

# Used in mapred-site.xml template.
default['hadoop']['config']['jobtracker'] = 'namenode.local'
# This should be changed to an array and populated into the template in comma-delimited format.
default['hadoop']['config']['mapred_local_dir'] = '/tmp/mapred'
default['hadoop']['config']['mapred_system'] = '/tmp/system'
