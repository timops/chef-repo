maintainer       "Opscode, Inc."
maintainer_email "tgreen@opscode.com"
license          "All rights reserved"
description      "Installs/Configures hadoop"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"
depends          "java", ">= 1.5.2"
depends          "ssh_known_hosts", ">= 0.5.0"

%w{ redhat centos }.each do |os|
  supports os
end
