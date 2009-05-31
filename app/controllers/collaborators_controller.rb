class CollaboratorsController < ProjectBaseController
  
  before_filter :select_client
  
  def select_client
    @project = Project.find(params[:project_id])
  end
  
  def new
    @project.collaborators.new
  end
  
  def create
    @collaborator = @project.collaborators.new(params[:collaborator])
    @collaborator.save
  end
  
  def destroy
    @collaborator = @project.collaborators.find(params[:id])
    @collaborator.destroy
  end
  
end
