nodes.all do |n|
  puts "hostname: #{n['fqdn']}, client version: #{n['chef_packages']['chef']['version']}"
end
