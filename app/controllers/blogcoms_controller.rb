class BlogcomsController < BaseController
  layout "projects"
  
  def index
    @blogcoms = Blogcom.all
  end
  
  def show
    @blogcom = Blogcom.find(params[:id])
  end
  
  def new
    @blogcom = Blogcom.new
  end
  
  def create
    @blogcom = Blogcom.new(params[:blogcom])
    if @blogcom.save
      flash[:notice] = "Successfully created blogcom."
      redirect_to @blogcom
    else
      render :action => 'new'
    end
  end
  
  def edit
    @blogcom = Blogcom.find(params[:id])
  end
  
  def update
    @blogcom = Blogcom.find(params[:id])
    if @blogcom.update_attributes(params[:blogcom])
      flash[:notice] = "Successfully updated blogcom."
      redirect_to @blogcom
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @blogcom = Blogcom.find(params[:id])
    @blogcom.destroy
    flash[:notice] = "Successfully destroyed blogcom."
    redirect_to blogcoms_url
  end
end
