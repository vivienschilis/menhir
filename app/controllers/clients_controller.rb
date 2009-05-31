class ClientsController < ProjectBaseController
  
  def index
  end
  
  def new
    @client = @project.clients.new
  end
  
  def create
    @client = @project.clients.new(params[:client])
     if @client.save
        flash[:notice] = "Successfully added clients."
        redirect_to project_clients_path(@project)
     else
       redirect_to project_clients_path(@project)
     end
  end
end
