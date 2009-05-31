class TodosController < ProjectBaseController
  layout "projects"
  
  before_filter :select_todo_list
  
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
    @todo.creator=current_user
    
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
    @todo.update_attributes(params[:todo])
    
    render :action => "show.js.rjs",
           :locals => {:project => @project, :todo_list => @todo_list, :todo => @todo }
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
  
  def complete
    @todo = @todo_list.todos.find(params[:id])
    @todo.completed=true
    @todo.save
  end
  
  def uncomplete
    @todo = @todo_list.todos.find(params[:id])
    @todo.completed=false
    @todo.save
  end
end
