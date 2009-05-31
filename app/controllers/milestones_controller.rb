class MilestonesController < ProjectBaseController
  layout "projects"

  def index
    @lates = @project.milestones.uncompleted.late
    @upcomings = @project.milestones.uncompleted.upcoming
    
    @completed = @project.milestones.completed
    
  end
  
  def show
    @milestone = @project.milestones.find(params[:id])
  end
  
  def new
    @milestone = @project.milestones.new
  end
  
  def create
    @milestone = @project.milestones.new(params[:milestone])
    @milestone.creator=current_user
    
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
  
  def complete
    @milestone = @project.milestones.find(params[:id])
    @milestone.completed=true
    @milestone.save
  end
  
  def uncomplete
    @milestone = @project.milestones.find(params[:id])
    @milestone.completed=false
    @milestone.save
  end
end
