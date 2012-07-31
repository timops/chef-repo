name "datanode"
description "Hadoop Datanode/Tasktracker"
run_list [ "recipe[java]", "recipe[hadoop]", "recipe[hadoop::hadoop_configure]", "recipe[hadoop::datanode_ssh]" ]
