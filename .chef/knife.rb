current_dir = File.dirname(__FILE__)
log_level                :info
log_location             STDOUT
node_name                "timsgreen"
client_key               "#{current_dir}/timsgreen.pem"
validation_client_name   "persuse-validator"
validation_key           "#{current_dir}/persuse-validator.pem"
chef_server_url          "https://api.opscode.com/organizations/persuse"
cache_type               'BasicFile'
cache_options( :path => "#{ENV['HOME']}/.chef/checksums" )
cookbook_path            ["#{current_dir}/../cookbooks"]

# ec2:

knife[:aws_ssh_key_id] = 'tg'
knife[:aws_access_key_id] = 'AKIAIDKPIUAGY42AUT5Q'
knife[:aws_secret_access_key] = '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'  

# openstack (trystack.org)

knife[:openstack_username] = "mattray"
knife[:openstack_password] = "ab61lqbg"
knife[:openstack_auth_url] = "http://thefreecloud.org:5000/v2.0/tokens"
