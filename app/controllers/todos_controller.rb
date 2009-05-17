class TodosController < BaseController
  layout "projects"
  
  before_filter :select_project
  before_filter :select_todo_list
  
  def select_project
    @project = Project.find(params[:project_id])
  end
  
  def select_todo_list
    @todo_list = @project.todo_lists.find(params[:todo_list_id])
  end
  
  def index
    @todos = @todo_list.todos.all
  end
  
  def show
    @todo = @todo_list.todos.find(params[:id])
  end
  
  def new
    @todo = @todo_list.todos.new
  end
  
  def create
    @todo = @todo_list.todos.new(params[:todo])
    
    respond_to do |format|  
       if @todo.save
          format.html { 
            flash[:notice] = "Successfully created todo."
            redirect_to [@project,@todo_list,@todo]
          }
          format.js
        else
          render :action => 'new'
        end
    end
   
  end
  
  def edit
    @todo = @todo_list.todos.find(params[:id])
  end
  
  def update
    @todo = @todo_list.todos.find(params[:id])
    if @todo.update_attributes(params[:todo])
      flash[:notice] = "Successfully updated todo."
      redirect_to [@project,@todo_list,@todo]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @todo = Todo.find(params[:id])
    
    @todo.destroy
    
    respond_to do |format|  
      format.html {
        flash[:notice] = "Successfully destroyed todo."
        redirect_to project_todo_list_todos_url(@project,@todo_list)
      }
      format.js
    end
  end
end
