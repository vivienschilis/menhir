require 'rubygems'
require 'activerecord'
require 'octopi'

include Octopi

require 'config/environment'

project_id = ARGV.first

project = Project.find_by_id(project_id)
puts project.inspect  

if project

  github_user = Octopi::User.find("vivienschilis")
  repository = github_user.repository("myfakeproject")

  repository.commits.each do |commit|
    todo_id=commit.message.match(/#!todo:(\d+)\s*$/)
    if (todo_id) 
      todo = Todo.find(todo_id[1])
      if todo
        todo.completed=true
        todo.save
      end
    end
  end
end

