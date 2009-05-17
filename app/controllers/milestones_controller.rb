class MilestonesController < BaseController
  layout "projects"
  
  before_filter :select_project
  
  def select_project
    @project = Project.find(params[:project_id])
  end
  
  def index
    @milestones = @project.milestones.all
  end
  
  def show
    @milestone = @project.milestones.find(params[:id])
  end
  
  def new
    @milestone = @project.milestones.new
  end
  
  def create
    @milestone = @project.milestones.new(params[:milestone])
    if @milestone.save
      flash[:notice] = "Successfully created milestone."
      redirect_to [@project,@milestone]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @milestone = @project.milestones.find(params[:id])
  end
  
  def update
    @milestone = @project.milestones.find(params[:id])
    if @milestone.update_attributes(params[:milestone])
      flash[:notice] = "Successfully updated milestone."
      redirect_to [@project,@milestone]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @milestone = @project.milestones.find(params[:id])
    @milestone.destroy
    flash[:notice] = "Successfully destroyed milestone."
    redirect_to project_milestones_url
  end
end
