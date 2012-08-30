name "tomcat_server"
description "Tomcat server deployment."
run_list(
  "recipe[java]",
  "recipe[tomcat]"
)
override_attributes(
)
