class BlogpostsController < BaseController
  layout "projects"
  
  before_filter :select_project
  
  def select_project
    @project = Project.find(params[:project_id])
  end
  
  def index
    @blogposts = Blogpost.all
  end
  
  def show
    @blogpost = Blogpost.find(params[:id])
  end
  
  def new
    @blogpost = Blogpost.new
  end
  
  def create
    @blogpost = Blogpost.new(params[:blogpost])
    if @blogpost.save
      flash[:notice] = "Successfully created blogpost."
      redirect_to [@project,@blogpost]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @blogpost = Blogpost.find(params[:id])
  end
  
  def update
    @blogpost = Blogpost.find(params[:id])
    if @blogpost.update_attributes(params[:blogpost])
      flash[:notice] = "Successfully updated blogpost."
      redirect_to [@project,@blogpost]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @blogpost = Blogpost.find(params[:id])
    @blogpost.destroy
    flash[:notice] = "Successfully destroyed blogpost."
    redirect_to project_blogposts_url(@project)
  end
end
