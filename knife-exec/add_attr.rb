nodes.all do |n|
  n['blah'] = 'test'
  n.save
end
