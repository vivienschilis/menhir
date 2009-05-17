class ImagesController < ApplicationController
  layout "projects"
  
  before_filter :select_project
  
  def select_project
    @project = Project.find(params[:project_id])
  end
  
  def index
    @images = Image.all
  end
  
  def show
    @image = Image.find(params[:id])
  end
  
  def new
    @image = Image.new
  end
  
  def create
    @image = Image.new(params[:image])
    if @image.save
      flash[:notice] = "Successfully created image."
      redirect_to [@project,@image]
    else
      render :action => 'new'
    end
  end
  
  def edit
    @image = Image.find(params[:id])
  end
  
  def update
    @image = Image.find(params[:id])
    if @image.update_attributes(params[:image])
      flash[:notice] = "Successfully updated image."
      redirect_to [@project,@image]
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @image = Image.find(params[:id])
    @image.destroy
    flash[:notice] = "Successfully destroyed image."
    redirect_to project_images_url
  end
end
