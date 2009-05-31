puts "test on start/stop"

require 'rubygems'
require 'activerecord'
require 'daemons'

require 'config/environment'

options = {}

Project.all.each do |project|
  
  default_pid_dir = "/var/run/task_server_" + project.id.to_s

  if File.exists?(default_pid_dir)
    options[:dir_mode] = :normal
    options[:dir] = default_pid_dir
  end

  #Daemons.run(File.dirname(__FILE__) + '/../script/todoautoclosing.rb', options)
  
end


