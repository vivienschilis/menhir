class DocumentsController < ProjectBaseController

  def index
    @documents = @project.documents.all(:order => "updated_at DESC")
  end
  
  def show
    @document = @project.documents.find(params[:id])
  end
  
  def new
    @document = @project.documents.new
    @document.document_versions.build
    
  end
  
  def create
    @document =  @project.documents.new(params[:document])
    if @document.save
      flash[:notice] = "Successfully created document."
      redirect_to project_documents_path(@project)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @document =  @project.documents.find(params[:id])
  end
  
  def update
    @document =  @project.documents.find(params[:id])
    if @document.update_attributes(params[:document])
      flash[:notice] = "Successfully updated document."
      redirect_to [@project,@document]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @document =  @project.documents.find(params[:id])
    @document.destroy
    flash[:notice] = "Successfully destroyed document."
    redirect_to project_documents_url(@project)
  end
end
