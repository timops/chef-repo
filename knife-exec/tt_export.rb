require 'mixlib/json'

n = Chef::Node.new

abort("Usage: knife exec #{ARGV[1]} from_file to_node_name") unless ARGV[3]
from_file_name = ARGV[2]
to_node_name = ARGV[3]
puts "Parsing JSON data from: #{from_file_name}..."
input_json = IO.read(from_file_name)
puts "JSON ###################"
puts "#{input_json}"
puts "#################"
#from_file_json = JSON.parse(input_json)
n.json_create(input_json)
from_file_json = Mixlib::JSON.parse(input_json)
