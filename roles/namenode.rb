name "namenode"
description "Hadoop Namenode/Jobtracker"
run_list [ "recipe[java]", "recipe[hadoop]", "recipe[hadoop::hadoop_configure]", "recipe[hadoop::namenode_ssh]", "recipe[ssh_known_hosts]" ]
