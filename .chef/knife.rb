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
knife[:aws_access_key_id] = 'AKIAJWNKCT25JSBQWWSA'
knife[:aws_secret_access_key] = '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'  

# Opscode (Ubuntu) Openstack
knife[:openstack_username] = "tgreen"
knife[:openstack_password] = "changemenow"
knife[:openstack_tenant] = "consulting-general"
knife[:openstack_auth_url] = "http://172.31.4.28:5000/v2.0/tokens"

# ec2 windows bootstrap parameters:

knife[:bootstrap_protocol] = 'winrm'
knife[:winrm_user] = 'Administrator'
knife[:winrm_password] = '1008Western'
#knife[:chef_node_name] = 'WindowsChef'
#knife[:flavor] = 'm1.medium'
#knife[:image] = 'ami-a5f821cc'
knife[:security_groups] = 'rdp-only'
knife[:winrm_transport] = 'plaintext'
knife[:winrm_port] = '5985'

# vCloud
knife[:bluelock_username] = "opscodechef@Bluelock-PCEP39"
knife[:bluelock_password] = "1008Western"
