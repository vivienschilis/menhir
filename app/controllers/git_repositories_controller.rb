require 'octopi'

class GitRepositoriesController < ProjectBaseController
  include Octopi
  
  def index
    
  end
  
  def last_commits
    if @project.git_repository.nil?
      render :text => "No git reposity configured"
    else
      u = Octopi::User.find("vivienschilis")
      repo = u.repository(@project.git_repository.name)
      if repo.nil?
        render :text => "No git reposity found"
      else
        render :partial => "last_commits", :locals => {:commits => repo.commits}
      end
    end
  end
  
end
