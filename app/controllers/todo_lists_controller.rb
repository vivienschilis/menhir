class TodoListsController < ProjectBaseController
  layout "projects"
  
  def index
    @todo_lists =  @project.todo_lists.all
  end
  
  def show
    @todo_list = @project.todo_lists.find(params[:id])
  end
  
  def new
    @todo_list = TodoList.new
  end
  
  def create
    @todo_list = @project.todo_lists.new(params[:todo_list])
    if @todo_list.save
      flash[:notice] = "Successfully created todo list."
      redirect_to [@project,@todo_list]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @todo_list = TodoList.find(params[:id])
  end
  
  def update
    @todo_list = @project.todo_lists.find(params[:id])
    if @todo_list.update_attributes(params[:todo_list])
      flash[:notice] = "Successfully updated todo list."
      redirect_to [@project,@todo_list]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @todo_list = @project.todo_lists.find(params[:id])
    @todo_list.destroy
    flash[:notice] = "Successfully destroyed todo list."
    redirect_to project_todo_lists_url
  end
end
