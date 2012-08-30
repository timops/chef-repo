nodes.all do |n|
  puts "current run list: #{n.run_list}"
  n.run_list << 'recipe[windows]'
  n.save
end
