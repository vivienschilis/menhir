require 'octopi'

class GitRepositoriesController < ProjectBaseController
  include Octopi
  
  def index
    
  end
  
  def last_commits
    u = Octopi::User.find("vivienschilis")
    repo = u.repository(@project.git_repository.name)
    
    render :partial => "last_commits", :locals => {:commits => repo.commits}
  end
  
end
