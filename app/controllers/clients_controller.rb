class ClientsController < ProjectBaseController
  before_filter :account_ower_required
  
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

  def destroy
    @client = @project.clients.find(params[:id])
    @client.destroy
    flash[:notice] = "Client successfully removed"
    redirect_to project_clients_url(@project)
  end

end

