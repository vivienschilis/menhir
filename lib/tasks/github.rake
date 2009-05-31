require 'rubygems'
require 'active_record'

namespace :github do
  desc 'GitHub widget control'

  namespace :todos do

    task :close do
      puts "GitHub..."
      init_active_record
      close_todo_tasks
    end
  end
  
  namespace :daemon do
    
    task :start do
      run "#{RAILS_ROOT}/script/github_server_control.rb start" 
    end
    
    task :stop do
      run "#{RAILS_ROOT}/script/github_server_control.rb stop" 
    end
  end
end


def init_active_record
  config = YAML.load_file("#{RAILS_ROOT}/config/database.yml")
  ActiveRecord::Base.establish_connection(config[RAILS_ENV])
end


def close_todo_tasks
  
end