require 'rubygems'
require 'activerecord'
require 'octopi'
require 'daemons'

include Octopi

options = {}

Project.all.each do |project|
  
  default_pid_dir = "/var/run/task_server_"+project.id 

  if File.exists?(default_pid_dir)
    options[:dir_mode] = :normal
    options[:dir] = default_pid_dir
  end

  Daemons.run(File.dirname(__FILE__) + '/../script/todoautoclosing.rb', options)

end


