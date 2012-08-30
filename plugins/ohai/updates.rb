require 'mixlib/shellout'

provides 'updates'

updates Mash.new

cmd = Mixlib::ShellOut.new('yum check-update')
cmd.run_command
# Returns exit value of 100 if there are packages available for an update.
# Only update the mash if something is available.
if cmd.exitstatus == 100 then
  packages = Mixlib::ShellOut.new('yum list updates -q')
  packages.run_command
  packages.stdout.each_line do |pkg|
    next if pkg =~ /^Updated Packages/
    name_arch, version, repo = pkg.split(/\s+/)
    # Key needs to have an architecture suffix in order to be unique.
    updates[name_arch] = Mash.new
    name, arch = name_arch.split('.')
    updates[name_arch] = Mash.new(:name => name, :arch => arch, :version => version, :repo => repo)
  end
end
