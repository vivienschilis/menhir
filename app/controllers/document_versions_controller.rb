class DocumentVersionsController < ProjectBaseController
  
  before_filter :select_document
  
  def select_document
    @document = @project.documents.find(params[:document_id])
  end
  
  
  def index
    @document_versions = @document.document_versions.all
  end
  
  def show
    @document_version = @document.document_versions.find(params[:id])
  end
  
  def new
    @document_version = @document.document_versions.new
  end
  
  def create
    @document_version = @document.document_versions.new(params[:document_version])
    if @document_version.save
      flash[:notice] = "Successfully created file version."
      redirect_to project_documents_url(@project)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @document_version = @document.document_versions.find(params[:id])
  end
  
  def update
    @document_version = @document.document_versions.find(params[:id])
    if @document_version.update_attributes(params[:document_version])
      flash[:notice] = "Successfully updated file version."
      redirect_to project_documents_url(@project)
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @document_version =  @document.document_versions.find(params[:id])
    @document_version.destroy
    flash[:notice] = "Successfully destroyed file version."
    redirect_to project_documents_url(@project)
  end
  
  def after_save
    document.updated_at=Time.now
    document.save
  end
end
