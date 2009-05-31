class ProjectBaseController < BaseController
  before_filter :select_project
  before_filter :collaborator_required
  
  def select_project
    @project = Project.find(params[:project_id])
  end
  
  def collaborator_required
    if !current_user.participate?(@project)
       flash[:error] = "You are not authorised to access this project"
       redirect_to dashboard_path  
    end
  end
end
