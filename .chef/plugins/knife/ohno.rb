require 'chef/knife'

module Lnxchk
  class Ohno < Chef::Knife

    deps do
      require 'chef/knife/status'
      require 'chef/knife/search'
      require 'chef/search/query'
      require 'highline'
    end

    banner "knife ohno HOURS"

    def run
      unless hours = name_args.first
        ui.error "You need to specify a number of hours behind the checkins are"
        exit 1
      end
    
      if nocolor = name_args[1]
        color = 0
      else 
        color = 1
      end

      hours = hours.to_i

      stdout_orig = $stdout 
      $stdout = File.open('/dev/null', 'w')
      knife_status = Chef::Knife::Status.new
      hitlist = knife_status.run
      $stdout.close
      $stdout = stdout_orig

      print "\nLost cheep in need of chefherding for more than #{hours} hours: \n"
      hitlist.each { |node|
        hour, minutes, seconds = Chef::Knife::Status.new.time_difference_in_hms(node["ohai_time"])
        if hour >= hours
          x = hour.to_s()
          if (color == 1) && (node.attribute?('ec2'))
            ui.msg("#{node['fqdn']} - #{node['ec2']['instance_id']}:\t\t" + ui.color("#{x} hours", :red))
          elsif (color == 1) 
            ui.msg("#{node['fqdn']}:\t\t" + ui.color("#{x} hours", :red))
          else
            ui.msg("#{node['fqdn']}:\t\t#{x} hours")
          end
        end
      }
      #File.delete('/tmp/ohno')
    end # close run
  end # close class
end # close module

