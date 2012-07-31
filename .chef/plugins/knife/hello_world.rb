# You can namespace however you like, but it's a good idea to use your own
# instead of the Chef::Knife namespace.
module MyKnifePlugins
# Make sure you subclass from Chef::Knife
  class HelloWorld < Chef::Knife
# This method will be executed when you run this knife command.
    def run
      puts "Hello, World!"
    end
  end
end
