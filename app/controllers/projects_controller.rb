class ProjectsController < ProjectBaseController  
  layout "projects"

  before_filter :select_project, :except => [:index, :new, :create]
  before_filter :collaborator_required, :except => [:index, :new, :create]
  before_filter :project_ower_required, :only => [:edit, :update]
  before_filter :account_user_required, :only => [:new , :create]
  
  
  def select_project
    @project = Project.find(params[:id])
  end

  def index    
    @projects = current_user.projects
    render "index", :layout => "dashboard"
  end

  def show
  end

  def new
    @project = Project.new

    render "new", :layout => "dashboard"

  end

  def create
    Project.transaction do       
      @project = Project.new(params[:project])
      @project.user = current_user
      @project.account_id = current_account.id

      if @project.save
        @project.clients.create(:company_id => current_user.company.id)
        @project.collaborators.create(:user_id => current_user.id)

        flash[:notice] = "Successfully created project."
        redirect_to @project
      else
        render :action => 'new', :layout => "dashboard"
      end

    end 
  end

  def edit
  end

  def update
    if @project.update_attributes(params[:project])
      flash[:notice] = "Successfully updated project."
      redirect_to @project
    else
      render :action => 'edit'
    end
  end


  def update_positions
    params[:sortable_list].each_index do |i|
      #item = Shackmate.find(params[:sortable_list][i])
      #item.position = i
      #item.save
    end
    render :text => ""
  end
end
